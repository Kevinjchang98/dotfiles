# Vim and LaTeX

Originally at https://www.reddit.com/r/vim/comments/7c7wd9/vim_vimtex_zathura_on_macos/hk4c7x5/

This is an old thread, but it popped up when I was googling for solutions to my own vimtex/zathura MacOS setup. And I'm happy to say that I was able to get everything working in MacOS Big Sur!

Here's a list of steps I had to take to do this. It may not be exhaustive on your system.

1. `brew install macvim`. The `vim` that came with my OS (`/usr/bin/vim`) did not have the `python3` or `clientserver` features included. `macvim` is a heavier alternative with more features enabled. Run `vim --version` to check what features your `vim` includes
2. `brew tap zegervdv/zathura`, `brew install zathura --with-synctex`, and `brew install zathura-pdf-poppler`. This installs zathura and a PDF viewer plugin for zathura (it doesn't support anything by default). To get these to install, I also had to `brew install gcc` and upgrade my Xcode Command Line Tools via MacOS's software update. Make sure to follow the `zathura-pdf-poppler` caveat about symlinking it to zathura's plugin directory. 
3. `brew install mactex-no-gui`. You need some sort of TeX compiler for VimTeX to work. This is the one I installed.
4. Install [vim-plug](https://github.com/junegunn/vim-plug). Add the `call plug#begin(~/.vim/plugged')` and `call plug#end()` lines to your `.vimrc` as recommended in the README.
5. Install [VimTeX](https://github.com/lervag/vimtex) using `vim-plug` as your plugin manager. Check out my `.vimrc` code below.

6. Reload `.vimrc` and run `:PlugInstall` in `vim` to perform installation

You should *hopefully* now be able to edit a `.tex` file with vim and see zathura display the compiled PDF every time you save the file. You may have to type `\ll` to get the continuous TeX compiler to start up the first time you open the file.

`.vimrc`:

    " https://github.com/junegunn/vim-plug
    " Specify a directory for plugins
    call plug#begin('~/.vim/plugged')

    Plug 'lervag/vimtex'
        let g:tex_flavor='latex'
        let g:vimtex_view_method='zathura'
        let g:vimtex_quickfix_mode=0
        " these two lines are for a separate plugin I use: https://github.com/KeitaNakamura/tex-conceal.vim
        set conceallevel=1
        let g:tex_conceal='abdmg'

    " Initialize plugin system
    call plug#end()

**Edit:** One thing I'll note is that Inkscape runs unusably slowly on my mac. I've given up on using it the way that Castel does.
