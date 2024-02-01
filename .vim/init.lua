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

-- Telescope
vim.keymap.set('n', '<c-p>', '<cmd>Telescope find_files hidden=true no_ignore=true<CR>')
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
