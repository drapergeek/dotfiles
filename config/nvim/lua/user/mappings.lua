-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>h"] = { "<cmd>set nohlsearch<cr>", desc = "Stop highlighting search" },
    ["<leader><leader>"] = { "<c-^>", desc = "Switch to last file" },
    ["<Tab>"] = false,

    ["<C-p>"] = { function() require("telescope.builtin").find_files() end, desc = "Find files" },
    -- tab bar shortcuts
    ["<leader>b"] = false,
    ["<leader>bb"] = false,
    ["<leader>bd"] = false,
    ["<leader>b\\"] = false,
    ["<leader>b|"] = false,
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    --["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<leader>t"] = { name = "Tests" },
    ["<leader>tt"] = { "<cmd>TestNearest<cr>", desc = "Test nearest" },
    ["<leader>tf"] = { "<cmd>TestFile<cr>", desc = "Test file" },
    ["<leader>ta"] = { "<cmd>TestSuite<cr>", desc = "Test suite" },
    ["<leader>tl"] = { "<cmd>TestLast<cr>", desc = "Test last" },
    ["<leader>gr"] = { "<cmd>windo e!<cr>", desc = "Refresh windows" },
    ["<Tab>"] = false
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
    ["<Tab>"] = false
  }
}
