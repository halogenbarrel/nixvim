{
  pkgs,
  lib,
  ...
}: {
  config.vim = {
    # =========================== Themes ===========================
    theme.enable = true;
    theme.name = "rose-pine";
    theme.style = "dark";

    # ============================ Globals =========================
    globals.mapleader = " ";
    options.tabstop = 2;
    options.shiftwidth = 2;

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
        columns = [
          "icon"
          "permissions"
          "mtime"
        ];
        view_options.show_hidden = true;
      };
    };

    # ============================= LSP ============================
    # This does not work, simply because it fucking breaks all other binds.
    # lsp.servers.nixd.settings = {
    # nixd.nixpkgs.expr = "import <nixpkgs> {}";
    # };

    autocomplete.blink-cmp.enable = true;

    lsp.enable = true;
    lsp.formatOnSave = true;
    languages = {
      nix = {
        enable = true;
        format.enable = true;
        lsp = {
          servers = ["nixd"];
        };
        treesitter.enable = true;
      };
      clang = {
        enable = true;
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
