return {
  { "tpope/vim-surround", lazy = false },
  { "tpope/vim-endwise", lazy = false },
  { "tpope/vim-fugitive", lazy = false },
  { "tpope/vim-rhubarb", lazy = false },
  { "christoomey/vim-tmux-runner", lazy = false },
  {
    "janko-m/vim-test",
    lazy = false,
    -- change a keymap
    keys = {
      { "<leader>t", "<cmd>TestNearest<cr>", desc = "Run nearest test" },
      { "<leader>tf", "<cmd>TestFile<cr>", desc = "Run test file" },
      { "<leader>a", "<cmd>TestSuite<cr>", desc = "Run entire test suite" },
      { "<leader>l", "<cmd>TestLast<cr>", desc = "Run the last test run" },
    },
    config = function()
      vim.cmd('let test#strategy = "vtr"')
    end,
  },
  { "christoomey/vim-tmux-navigator", lazy = false },
  { "tpope/vim-rails", lazy = false },
  { "jgdavey/tslime.vim", lazy = false },
  { "akinsho/toggleterm.nvim", enabled = false },
  { "ludovicchabant/vim-gutentags", lazy = false },
  { "github/copilot.vim", lazy = false },
  { "wsdjeg/vim-fetch", lazy = false },
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
    keys = {
      { "<leader>a", nil, desc = "AI/Claude Code" },
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
      { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
      {
        "<leader>as",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil" },
      },
      -- Diff management
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
  },
}
