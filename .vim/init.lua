-- Neovim configuration to extend .vimrc
vim.cmd("source ~/.vimrc")

-- Shortcut to reload ~/.vim/init.lua
vim.keymap.set('n', '<Leader>r', '<cmd>luafile ~/.vim/init.lua<CR>')

-- Turn off spell check in terminal
vim.api.nvim_create_autocmd({"TermOpen"}, {
  pattern = {"*"},
  command = "setlocal nospell",
})

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
