# home-manager.nix

{ inputs, ... }: {

  # may look a bit different
  home-manager."jonvemo" = {
    extraSpecialArgs = { inherit inputs; };
    users = {
#      "jonvemo" = import ./home.nix;
      modules = [
        ./home.nix
        inputs.self.outputs.homeManagerModules.default
      ];
    };
  };

}
