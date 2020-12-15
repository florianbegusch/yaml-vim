" Vim script for vim-ruby for sorting yaml collections
" Requires: yamlsort.rb
" Author:	Igor Vergeichik <iverg@mail.ru>
" Sponsor: Tom Sawyer <transami@transami.net>
" Copyright (c) 2002 Tom Saywer

" The root directory of the plugin:
" !nicked from https://github.com/carlosjhr64/vim-markdown/blob/3a1b66608c9a7905bcac2cdd4510691607557dd1/plugin/vim-markdown.vim
"
" Why do we need 'File.dirname' twice? This is beyond me but we do.
"
ruby plugin_dir = File.dirname File.dirname Vim.evaluate('expand("<sfile>")')
ruby load File.join(plugin_dir, 'lib', 'yamlsort.rb')


" Direct sort
function! YamlSort()
	ruby YCollection.new lambda{|a,b| a<=>b}
endfunction
" Reverse sort
function! YamlRSort()
	ruby YCollection.new lambda{|a,b| b<=>a}
endfunction

map <F5> :call YamlSort()<CR>
map <F6> :call YamlRSort()<CR>
