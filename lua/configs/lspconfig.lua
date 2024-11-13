-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "pyright" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

lspconfig.html.setup {
  filetypes = { "html", "htmldjango" },
  settings = {
    html = {
      format = {
        enable = true,
      },
    },
  },
}

lspconfig.yamlls.setup {
  settings = {
    yaml = {
      schemas = {
        -- Optional: add specific schemas for YAML files, e.g., Kubernetes, GitHub Actions, etc.
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["https://json.schemastore.org/kubernetes.json"] = "/*.k8s.yaml",
      },
      validate = true,  -- Enable validation
      format = {
        enable = true,  -- Enable formatting
      },
      hover = true,
      completion = true,
    },
  },
}
