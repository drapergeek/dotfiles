vim.api.nvim_create_autocmd("FileType", {
  pattern = "graphql",
  callback = function(ev)
    vim.lsp.start({
      name = "apollo-language-server",
      -- If you're using a profile, you can append `'--profile', 'default'`
      -- to this list (substitute `default` for your profile name)
      cmd = { "rover", "lsp", "--supergraph-config", "supergraph.yaml" },
      -- Set the "root directory" to the parent directory of the file in the
      -- current buffer (`ev.buf`) that contains a `supergraph.yaml` file.
      root_dir = vim.fs.root(ev.buf, { "supergraph.yaml" }),
    })
  end,
})
