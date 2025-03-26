return {
  { "tpope/vim-surround", lazy = false },
  { "tpope/vim-endwise", lazy = false },
  { "tpope/vim-fugitive", lazy = false },
  { "tpope/vim-rhubarb", lazy = false },
  {
    "janko-m/vim-test",
    lazy = false,
    -- change a keymap
    keys = {
      { "<leader>t", "<cmd>TestNearest<cr>", desc = "Run nearest test" },
      { "<leader>f", "<cmd>TestFile<cr>", desc = "Run test file" },
      { "<leader>a", "<cmd>TestSuite<cr>", desc = "Run entire test suite" },
      { "<leader>l", "<cmd>TestLast<cr>", desc = "Run the last test run" },
    },
  },
  { "christoomey/vim-tmux-navigator", lazy = false },
  { "tpope/vim-rails", lazy = false },
  { "jgdavey/tslime.vim", lazy = false },
  { "akinsho/toggleterm.nvim", enabled = false },
  { "ludovicchabant/vim-gutentags", lazy = false },
  { "github/copilot.vim", lazy = false },
  { "wsdjeg/vim-fetch", lazy = false },
}
