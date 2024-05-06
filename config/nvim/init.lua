local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')
  Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
  Plug('lervag/vimtex')
vim.call('plug#end')

require'nvim-treesitter.configs'.setup {
  ensure_installed = { 'eex', 'elixir', 'heex' },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

vim.wo.number = true

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'tex' },
  callback = function()
    vim.opt.formatoptions:append('a')
  end
})
