-- Neovim configuration to extend .vimrc
vim.cmd("source ~/.vimrc")

-- Shortcut to reload ~/.vim/init.lua
vim.keymap.set('n', '<Leader>r', '<cmd>luafile ~/.vim/init.lua<CR>')

-- Turn off spell check in terminal
vim.api.nvim_create_autocmd({"TermOpen"}, {
  pattern = {"*"},
  command = "setlocal nospell",
})

-- Toggleterm
require("toggleterm").setup{}
vim.g['test#strategy'] = "toggleterm"

-- mason-lspconfig
require("mason").setup()
require("mason-lspconfig").setup {
	ensure_installed = {
		"prosemd_lsp",
		"lua_ls",
		"typos_lsp",
		"vtsls"
	},
	handlers = {
	   -- The first entry (without a key) will be the default handler
	   -- and will be called for each installed server that doesn't have
	   -- a dedicated handler.
	   function (server_name) -- default handler (optional)
		   require("lspconfig")[server_name].setup {}
	   end,
	   ["lua_ls"] = function ()
		   local lspconfig = require("lspconfig")
		   lspconfig.lua_ls.setup {
			  settings = {
				Lua = {
				  diagnostics = {
					globals = {'vim'}
				  }
				}
			  }
		   }
	   end,
	}
}

-- Telescope
vim.keymap.set('n', '<c-p>', '<cmd>Telescope find_files hidden=true<CR>')
vim.keymap.set('n', '<Leader>y', '<cmd>Telescope buffers<CR>')
vim.keymap.set('n', '<Leader>a', '<cmd>Telescope live_grep<CR>')

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  -- ensure_installed = { "lua", "typescript" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  -- sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  -- ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

}
