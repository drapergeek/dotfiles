--vim.g.copilot_no_tab_map = true
--vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
--vim.g.copilot_assume_mapped = true

return {
  "Mofiqul/dracula.nvim",
  {"tpope/vim-surround", lazy = false},
  {"tpope/vim-endwise", lazy = false},
  {"tpope/vim-fugitive", lazy = false},
  {"tpope/vim-rhubarb", lazy = false},
  {"janko-m/vim-test", lazy = false},
  {"christoomey/vim-tmux-navigator", lazy = false},
  {"tpope/vim-rails", lazy = false},
  {"jgdavey/tslime.vim", lazy = false},
  {"akinsho/toggleterm.nvim",  enabled = false },
  {"ludovicchabant/vim-gutentags", lazy = false},
  {"github/copilot.vim", lazy = false},
  {"wsdjeg/vim-fetch", lazy = false},
  {
    "aserowy/tmux.nvim", lazy = false,
    config = function() return require("tmux").setup() end,
  },
  {"m4xshen/smartcolumn.nvim",
    lazy = false,
    opts = function(_, opts)
      opts.colorcolumn = "100"
      return opts
    end,
  },
  { 
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      opts.tabline = nil -- remove tabline
      return opts
    end,
  },
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
}
