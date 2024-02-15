local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')
  Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
vim.call('plug#end')

require'nvim-treesitter.configs'.setup {
  ensure_installed = { 'elixir' },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
