local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

null_ls.setup {
  debug = true,
  sources = {
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.diagnostics.eslint_d.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})'
    }),
    null_ls.builtins.diagnostics.fish,
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.flake8.with({
      diagnostics_format = "[#{c}] #{m} (#{s})"
    }),
    null_ls.builtins.formatting.isort.with({
      method = null_ls.methods.DIAGNOSTICS_ON_SAVE
    }),
    null_ls.builtins.diagnostics.mypy.with({
      method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
      extra_args = { "--show-error-codes" },
      diagnostics_format = "[#{c}] #{m} (#{s})"
    }),
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
      })
    end
    should_attach = function(bufnr)
      return not vim.api.nvim_buf_get_name(bufnr):match("^git://")
    end
  end
}

vim.api.nvim_create_user_command(
  'DisableLspFormatting',
  function()
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
  end,
  { nargs = 0 }
)
