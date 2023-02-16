local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
  return
end

local servers = {
  "jdtls",
  "jsonls",
  "sumneko_lua",
  "pyright",
  "clangd",
  "tsserver",
  "tailwindcss",
}

local settings = {
  ui = {
    border = "rounded",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup {
  ensure_installed = servers,
  automatic_installation = false,
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}
local lspconfig = require("lspconfig")

for _, server in pairs(servers) do
  opts = {
    on_attach = require("braint.lsp.handlers").on_attach,
    capabilities = require("braint.lsp.handlers").capabilities,
  }

  server = vim.split(server, "@")[1]

  if server == "tsserver" then
    local tsserver_opts = require "braint.lsp.settings.tsserver"
    opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
  end

  if server == "sumneko_lua" then
    local l_status_ok, lua_dev = pcall(require, "neodev")
    if not l_status_ok then
      return
    end
    lspconfig.sumneko_lua.setup({
      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace"
          },
          diagnostics  = {
              globals = {"vim"}
          }
        }
      }
    })
    goto continue
  end

  if server == "jdtls" then
    goto continue
  end

  lspconfig[server].setup(opts)
  ::continue::
end

-- TODO: add something to installer later
-- require("lspconfig").motoko.setup {}
