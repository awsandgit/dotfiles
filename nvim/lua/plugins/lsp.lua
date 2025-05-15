return {
  -- Mason setup
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },

  -- Mason LSP config
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "terraformls", "ts_ls", "solargraph", "html", "lua_ls", "pyright" },
      })
    end,
  },

  -- Neovim LSP config
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      -- Default capabilities
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Terraform LSP specific capabilities (e.g., snippet support)
      local tf_capa = vim.lsp.protocol.make_client_capabilities()
      tf_capa.textDocument.completion.completionItem.snippetSupport = true

      -- LSP configurations
      local lspconfig = require("lspconfig")
      
      -- on_attach function to define keymaps for LSP buffers
      local on_attach = function(client, bufnr)
        -- Key mappings for LSP functionality
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = bufnr })
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { buffer = bufnr })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
      end

      -- Configure each LSP server
      lspconfig.ts_ls.setup({ capabilities = capabilities, on_attach = on_attach })
      lspconfig.solargraph.setup({ capabilities = capabilities, on_attach = on_attach })
      lspconfig.html.setup({ capabilities = capabilities, on_attach = on_attach })
      lspconfig.lua_ls.setup({ capabilities = capabilities, on_attach = on_attach })
      lspconfig.terraformls.setup({ capabilities = tf_capa, on_attach = on_attach })
      lspconfig.pyright.setup({ capabilities = capabilities, on_attach = on_attach })

      -- Auto-format Terraform files before saving
      vim.api.nvim_create_autocmd({"BufWritePre"}, {
        pattern = {"*.tf", "*.tfvars"},
        callback = function()
          vim.lsp.buf.format()
        end,
      })
    end,
  },
}
