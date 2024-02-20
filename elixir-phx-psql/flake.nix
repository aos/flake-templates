{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    beamPkgs = with pkgs.beam_minimal; packagesWith interpreters.erlangR26;
    erlang = beamPkgs.erlang;
    elixir = beamPkgs.elixir_1_16;
    hex = beamPkgs.hex;
    elixir_ls = beamPkgs.elixir-ls;

    pg_port = "15432";
    pg_user = "postgres";
    pg_pass = "postgres";
  in {
    devShells."${system}".default = pkgs.mkShell {
      buildInputs = [
        erlang
        elixir
        hex
        elixir_ls
        pkgs.inotifyTools
        pkgs.nodejs
        pkgs.postgresql
      ];

      ERL_INCLUDE_PATH = "${erlang}/lib/erlang/usr/include";
      ERL_AFLAGS = "-kernel shell_history enabled";

      shellHook = ''
        # Allow mix to work on local directory
        mkdir -p .nix-mix
        mkdir -p .nix-hex
        export MIX_HOME=$PWD/.nix-mix
        export HEX_HOME=$PWD/.nix-hex
        export ERL_LIBS=$HEX_HOME/lib/erlang/lib

        # Concat paths
        export PATH=$MIX_HOME/bin:$PATH
        export PATH=$MIX_HOME/escripts:$PATH
        export PATH=$HEX_HOME/bin:$PATH

        # PG setup
        echo "Starting PSQL on port ${pg_port} user: ${pg_user} pass: ${pg_pass}"

        # Get MD5 hash of current directory
        pg_cntr_name="psql-''$(pwd | md5sum | awk '{print $1}')"
        pg_docker_volume="$PWD/.pg_docker_volume"
        status="$(podman inspect -f='{{.State.Status}}' $pg_cntr_name 2>/dev/null)"
        if [[ $? -eq 0 && $status =~ (exited|running) ]]; then
          podman start "$pg_cntr_name"
        else
          mkdir -p $pg_docker_volume
          podman run --name "$pg_cntr_name" \
                     -d -v $pg_docker_volume:/var/lib/postgresql/data:rw \
                     -e POSTGRES_PASSWORD=${pg_pass} \
                     -e PGPORT=${pg_port} \
                     -p ${pg_port}:${pg_port} \
                     docker.io/postgres
        fi

        # For convenience
        alias pg="PGPASSWORD=${pg_pass} psql -p ${pg_port} -U ${pg_user} -h localhost"

        # "Run: `mix archive.install hex phx_new` if need be."
        '';
    };
  };
}
