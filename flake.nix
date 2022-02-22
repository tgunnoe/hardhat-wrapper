{
  inputs.dream2nix.url = "github:nix-community/dream2nix";
  outputs = { self, dream2nix }@inputs:
    let
      dream2nix = inputs.dream2nix.lib.init {
        #use flake-utils to generate several
        systems = [ "x86_64-linux" ];
        config.projectRoot = ./. ;
      };
    in dream2nix.makeFlakeOutputs {

      # The one we're really interested in is hardhat
      source = ./.;
    };
}
