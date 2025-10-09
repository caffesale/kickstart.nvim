-- java.lua
--
-- Java development setup using nvim-java
-- Provides LSP, DAP, and testing support for Java

return {
  'nvim-java/nvim-java',
  dependencies = {
    'nvim-java/lua-async-await',
    'nvim-java/nvim-java-core',
    'nvim-java/nvim-java-test',
    'nvim-java/nvim-java-dap',
    'mfussenegger/nvim-dap',
    'neovim/nvim-lspconfig',
  },
  ft = { 'java' }, -- Load only for Java files
  config = function()
    require('java').setup({
      jdtls = {
        settings = {
          java = {
            imports = {
              gradle = {
                wrapper = {
                  checksums = {
                    {
                      sha256 = "7d3a4ac4de1c32b59bc6a4eb8ecb8e612ccd0cf1ae1e99f66902da64df296172",
                      allowed = true
                    }
                  }
                }
              }
            }
          }
        }
      }
    })
  end,
}
