set -x EDITOR vim
set -x PAGER less
set -x GOPATH /usr/home/randy/go
set -x PATH $PATH $GOPATH/bin

# Enable ls colors The default (shown first) is changed to make directories
# brighter.
set -x CLICOLOR true
#set -x LSCOLORS exfxcxdxbxegedabagacad
set -x LSCOLORS Exfxcxdxbxegedabagacad

function ls
    command ls -GFh $argv
end

# Playing with powerline.
#set fish_function_path $fish_function_path "/usr/local/lib/python2.7/site-packages/powerline/bindings/fish"
#powerline-setup
