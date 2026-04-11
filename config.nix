{
  pkgs,
  lib,
  ...
}: {
  config.vim = {
    # =========================== Themes ===========================
    theme.enable = true;
    theme.name = "gruvbox";
    theme.style = "dark";

    # ============================ Globals =========================
    globals.mapleader = " ";

    # =========================== Plugins ==========================
    git.neogit.enable = true;
    telescope = {
      enable = true;
    };
    binds.whichKey.enable = true;
    treesitter.enable = true;
    statusline.lualine = {
      enable = true;
    };
    utility.oil-nvim = {
      enable = true;
      gitStatus.enable = true;
      setupOpts = {
        columns = ["icon" "permissions" "mtime"];
        view_options.show_hidden = true;
      };
    };

    lsp.formatOnSave = true;
    lsp.mappings.format = "<leader>lf";
    autocomplete.blink-cmp.enable = true;
    languages = {
      nix = {
        enable = true;
        format.enable = true;
        lsp = {
          enable = true;
          servers = ["nixd"];
        };
        treesitter.enable = true;
      };
    };

    # =========================== Keymaps ==========================

    keymaps = [
      {
        key = "<leader>pf";
        mode = "n";
        silent = true;
        action = ":Oil<CR>";
      }
    ];
  };
}
