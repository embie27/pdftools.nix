{
  description = "A collection of pdf commands to perform various tasks.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };


  outputs = { self, flake-utils, nixpkgs }: 

    flake-utils.lib.eachDefaultSystem (system:

      let 
        pkgs = import nixpkgs { inherit system; };
      in {
        packages = {
          pdf2gray = pkgs.writeShellApplication {
            name = "pdf2gray";
            runtimeInputs = [ pkgs.ghostscript ];
            text = builtins.readFile ./scripts/pdf2gray.sh;
          };
        };
      }
    );
}
