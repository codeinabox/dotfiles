-- Neovim configuration to extend .vimrc
vim.cmd("source ~/.vimrc")

-- Shortcut to reload ~/.config/nvim/init.lua
vim.keymap.set('n', '<Leader>r', '<cmd>luafile ~/.config/nvim/init.lua<CR>')

-- Turn off spell check in terminal
vim.api.nvim_create_autocmd({"TermOpen"}, {
  pattern = {"*"},
  command = "setlocal nospell",
})

-- Set test strategy to toggleterm
vim.g['test#strategy'] = "toggleterm"

require("bigfile").setup {
  filesize = 2,
  features = { -- features to disable
    "indent_blankline",
    "illuminate",
    "lsp",
    "treesitter",
    "syntax",
    "matchparen",
    "vimopts",
    "filetype",
	{
	  name = "gitgutter",
	  disable = function()
		vim.cmd "GitGutterBufferDisable"
	  end,
	}
  },
}

require('claude-chat').setup({
  split = "vsplit",
  position = "right"
})

require("mason").setup()
require("mason-lspconfig").setup {
	ensure_installed = {
		"lua_ls",
		"vimls"
	}
}

require("toggleterm").setup{}

-- Telescope
vim.keymap.set('n', '<c-p>', '<cmd>Telescope find_files hidden=true<CR>')
vim.keymap.set('n', '<Leader>y', '<cmd>Telescope buffers<CR>')
vim.keymap.set('n', '<Leader>m', '<cmd>Telescope git_status<CR>')
vim.keymap.set('n', '<Leader>a', '<cmd>Telescope live_grep<CR>')

require('nvim-treesitter').install({ 'lua', 'python', 'typescript' })

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua', 'python', 'javascript', 'typescript' },
  callback = function() vim.treesitter.start() end,
})
