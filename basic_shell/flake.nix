{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  };
  outputs = { self, nixpkgs, flake-utils }:
  let
    eachDefaultSystemMap = let
      defaultSystems = [
        "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"
      ];
    in fn: let
      proc = system: { name = system; value = fn system; };
    in builtins.listToAttrs ( map proc defaultSystems );

    pkgsFor = eachDefaultSystemMap ( system:
      builtins.getAttr system nixpkgs.legacyPackages);
  in
  {
    devShells = eachDefaultSystemMap (system: 
      let
        pkgs = builtins.getAttr system pkgsFor;
      in
      {
        default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # packages
          ];
        };
      }
    );
  };
}
