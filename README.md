vim-frameworkrc
===============

Define all your framework (or project) specific settings in a single 
location that is easy to keep track off and tell `vim-frameworkrc` 
which one you would like to use based on the file that you have in 
the current buffer.

## Installation

If you don't have a preferred installation method, one option is to install 
[pathogen.vim](https://github.com/tpope/vim-pathogen), and then copy and paste

```bash
cd ~/.vim/bundle
git clone git://github.com/nCrazed/vim-frameworkrc.git
```

Once help tags have been generated, you can view the manual with 
`:help Frameworkrc`

## Configuration

Example [Laravel](http://laravel.com/) based configuration based on 
[Jeffrey Way's .vimrc](https://gist.github.com/JeffreyWay/6753834)

Create a file called `laravel.vim` in plugin's `configs` directory:

```vim
nmap <leader>lr :e app/routes.php<cr>
nmap <leader>lca :e app/config/app.php<cr>81Gf(%O
nmap <leader>lcd :e app/config/database.php<cr>
nmap <leader>lc :e composer.json<cr>

" Prepare a new PHP class
function! Class()
    let name = input('Class name? ')
    let namespace = input('Any Namespace? ')

    if strlen(namespace)
        exec 'normal i<?php namespace ' . namespace . ';
    else
        exec 'normal i<?php
    endif

    " Open class
    exec 'normal iclass ' . name . ' {^M}^[O^['
    
    exec 'normal i^M    public function __construct()^M{^M ^M}^['
endfunction
nmap ,1  :call Class()<cr>
```

Now create a `.frameworkrc` file in your laravel project's root directory:

```
laravel
```

That's it! Whenever you open a file somewhere within that directory or its 
subdirectories, your `laravel.vim` will be sourced.


## License

Copyright (c) Edvin Malinovskis. Distributed under the MIT License.
