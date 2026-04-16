{
  pkgs,
  lib,
  ...
}: {
  config.vim = {
    # =========================== Themes ===========================
    theme.enable = true;
    theme.name = "everforest";
    theme.style = "hard";

    # ============================ Globals =========================
    globals.mapleader = " ";
    options.tabstop = 2;
    options.shiftwidth = 2;

    # =========================== Plugins ==========================

    mini.surround.enable = true;
    mini.comment.enable = true;
    mini.pairs.enable = true;
    mini.diff.enable = true;
    navigation.harpoon = {
      enable = true;
      mappings = {
        file1 = "1";
        file2 = "2";
        file3 = "3";
        file4 = "4";
        listMarks = "o";
      };
    };

    git.neogit.enable = true;
    visuals.fidget-nvim.enable = true;
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
      rust = {
        enable = true;
      };
      python = {
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
      {
        key = "<leader>wd";
        mode = "n";
        silent = true;
        action = ":close<CR>";
      }
      {
        key = "<leader>wv";
        mode = "n";
        silent = true;
        action = ":vsplit<CR>";
      }
      {
        key = "<leader>ws";
        mode = "n";
        silent = true;
        action = ":split<CR>";
      }
      {
        key = "<leader>wo";
        mode = "n";
        silent = true;
        action = ":only<CR>";
      }
      # movement
      {
        key = "<C-h>";
        mode = "n";
        silent = true;
        action = ":wincmd h<CR>";
      }
      {
        key = "<C-j>";
        mode = "n";
        silent = true;
        action = ":wincmd j<CR>";
      }
      {
        key = "<C-k>";
        mode = "n";
        silent = true;
        action = ":wincmd k<CR>";
      }
      {
        key = "<C-l>";
        mode = "n";
        silent = true;
        action = ":wincmd l<CR>";
      }
    ];
  };
}
