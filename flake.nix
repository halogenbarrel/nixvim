{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = {
    self,
    nixpkgs,
    nvf,
    ...
  } @ inputs: let
    # 1. Define the architectures you want to support
    supportedSystems = [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];

    # 2. Create a helper function to iterate over those systems
    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
  in {
    # 3. Wrap your packages output with the helper
    packages = forAllSystems (system: {
      # Set the default package to the wrapped instance of Neovim.
      # This will allow running your Neovim configuration with
      # `nix run` and sharing it with other users.
      default =
        (nvf.lib.neovimConfiguration {
          # 4. Inject the current system dynamically
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [./config.nix];
        }).neovim;
    });
  };
}
