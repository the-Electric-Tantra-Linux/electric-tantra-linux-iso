# Neovim

I this to write (most of) my code. Using mostly Lua to configure NeoVim and preferring plugins also written in Lua, 
I am able to achieve loading times I hardly notice moving quickly into the program from terminal and have all the
functionality I would even attempt to on an IDE available to me with the power and reliably VIM is legendary for. 

## Plugins 
### Theme and General Appearance
`wbthomason/packer.nvim` - Package Management 

`vimwiki/vimwiki` - my note management app of choice

`nekonako/xresources-nvim` - uses xresources as source for color scheme
  `norcalli/nvim-colorizer.lua` - color highlighting 
  `akinsho/nvim-bufferline.lua` - Status Line
  `glepnir/galaxyline.nvim` - Tab Line 
### Code Rendering and Syntax Highlighting 
  `nvim-treesitter/nvim-treesitter` - code parsing 
  `sbdchd/neoformat` - provides code formatting 
  `nvim-lua/plenary.nvim` - a set of useful functions to have on hand
  `windwp/nvim-ts-autotag` - autoclosing tags with treesitter
  `andymass/vim-matchup` - matching word highlighter
  `windwp/nvim-autopairs` - bracket pairing functionality
  `nvim-treesitter/playground` - shows the treesitter within nvim 
  `alvan/vim-closetag` - autoclose tag, without parsing (just in case)
  `neovim/nvim-lspconfig` - Language Support Protocol Configuration
  `onsails/lspkind-nvim` - Pictograms for lsp 
  `kabouzeid/nvim-lspinstall` - Install various lsps
  `folke/trouble.nvim` - popup menu for debugging, references, etc 
  `glepnir/lspsaga.nvim` - additional LSP functionality 
  
  `hrsh7th/nvim-compe` - completion 

  `lewis6991/gitsigns.nvim`  - decor for git on nvim 
  `f-person/git-blame.nvim` - git blame functionality 
  `tpope/vim-fugitive` - git functionality 
  `tpope/vim-rhubarb` - github functionality for vim-fugitive 
 
 `mattn/webapi-vim` - internet api interface

  `hrsh7th/vim-vsnip` - LSP/VSCode snippet support
  `rafamadriz/friendly-snippets` - preconfigured snippets for a variety of languages 

  `kyazdani42/nvim-tree.lua` - file explorer 
  `kyazdani42/nvim-web-devicons` - icons from the internet 
  `ryanoasis/vim-devicons` - icons 
  `nvim-telescope/telescope.nvim` - fuzzy finder
  `nvim-telescope/telescope-media-files.nvim` - media plugin for finder of fuzzies
  `nvim-telescope/telescope-fzy-native.nvim` - compiled fzy style sorter
  `nvim-telescope/telescope-project.nvim` - fuzzy finder project awareness
  `nvim-lua/popup.nvim` - pop up API from vim in nvim 


  `glepnir/dashboard-nvim` - good welcome page 
  `tweekmonster/startuptime.vim` - monitors start up times

  `karb94/neoscroll.nvim` - better scrolling 
  `monaqa/dial.nvim` - simple increment/decrement 
  `nacro90/numb.nvim` - unobtrusive bufferline peeking 
  `turbio/bracey.vim` - live edit html, css & js

  `phaazon/hop.nvim ` - jump around in the buffer
  `windwp/nvim-spectre` - find & replace
  `simrat39/symbols-outline.nvim` - LSP + tree-like view 
  `folke/which-key.nvim` - emacs like command options menu 
  `lukas-reineke/indent-blankline.nvim` - keep the indent from getting sloppy


## Intended Result

While not the nightmare to manage that it looks like, this configuration has a relatively straightforward goal that by and large it achieves, namely:
> Provide IDE like functionality without long startups or too much of a hassle to modify.

This is why the traditional vim configuration subdirectories have been eschewed and I have instead preferred housing most of the configuration within the `lua` subdirectory. Its easier and specific ordering can be accomplished by the order that the files are called within the `init.lua` file that the program itself sees. 

## NeoVim Nightly
To get this configuration to do anything at all, you will need to have NeoVim's nightly release installed. To get it, follow the steps below 
```bash 
cd ~ && sudo rm -r neovim
git clone https://github.com/neovim/neovim
cd neovim
sudo make CMAKE_BUILD_TYPE=Release install
cd ~ && sudo rm -r neovim
```

## Vimwiki
If you struggle with finding a note management application, and you are not impressed with org-mode, try vimwiki. It makes managing several local and version sourced notebooks easily managed by providing a streamlined set of functions without without too much fuss, which is how I like my text editing programs personally. 

With it, I can record my notes in the heirarchical style I tend to organize my thoughts in, add to it and subtract as I feel necessary, all with the power of vim and streamlined responsive nature of this particular configuration that makes editing my notes a breeze. Because I control the content completely, I am even able to nest the pages of the wiki as I write it out and prefer it, which blows away the typical database system other note applications use that make recovering from reinstallation a bit of a nightmare. Not so with vimwiki. 

## Credit Where Due

I was inspired by two configuratons primarily in writing this one: LunarVim and NVChad. While NVChad ultimately is more like what this came to be, I was heavily inspired by and learned the way that the lua based configurations of NeoVim worked by picking apart LunarVim, both are excellent efforts tending to similar approaches, but NVChad ultimately is the one I prefer as it is not intended for a wide audience, ie more *opinionated* and as such a little more streamlined in its source code just as this has turned out to be. 
