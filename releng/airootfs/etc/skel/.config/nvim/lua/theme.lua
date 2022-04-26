local cmd = vim.cmd
cmd("let g:nvcode_termcolors=256")

cmd("colorscheme xresources")

vim.cmd([[
        syntax on
        filetype on
        filetype plugin indent on
    ]])

cmd("let g:nvcode_termcolors=256")

cmd("colorscheme xresources")
require "highlights"
