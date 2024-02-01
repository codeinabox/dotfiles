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

-- mason-lspconfig.nviM
require("mason").setup()
require("mason-lspconfig").setup {
	ensure_installed = {
		"prosemd_lsp",
		"lua_ls",
		"typos_lsp",
		"vtsls"
	},
}

vim.keymap.set('n', '<c-p>', '<cmd>Telescope find_files hidden=true no_ignore=true<CR>')

require("mason-lspconfig").setup_handlers {
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function (server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup {}
	end,
}
