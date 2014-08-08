function s {
cat ~/.sdirs | grep -v "export DIR_$1=" > ~/.sdirs1
mv ~/.sdirs1 ~/.sdirs
echo "export \"DIR_$1=$PWD\"" >> ~/.sdirs
}

function l {
source ~/.sdirs
env | grep "^DIR_" | cut -c5- | grep "^.*="
}

# enable custom tab completion
shopt -s progcomp

# jump to bookmark
function g {
source ~/.sdirs
cd "$(eval $(echo echo $(echo \$DIR_$1)))"
}

# list bookmarks without dirname
function _l {
source ~/.sdirs
env | grep "^DIR_" | cut -c5- | grep "^.*=" | cut -f1 -d "="
}

# completion command for g
function _gcomp {
local curw
COMPREPLY=()
curw=${COMP_WORDS[COMP_CWORD]}
COMPREPLY=($(compgen -W '`_l`' -- $curw))
return 0
}

# bind completion command for g to _gcomp
complete -F _gcomp g
#enables color in the terminal bash shell export
CLICOLOR=1
#sets up the color scheme for list export
export LSCOLORS=gxBxhxDxfxhxhxhxhxgxgx
#sets up the prompt color (currently a green similar to linux terminal)
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '
#sets up proper alias commands when called
alias ls='ls -Gp'
alias lt='ls -tr'
alias ll='ls -hl'
#copies directory to clipboard

alias pb='pwd | tr -d "\n" | pbcopy'

bind 'set bell-style none'

#points vim to macvim
alias mvim='/Applications/MacVim.app/Contents/MacOS/mvim'
alias vi="open -a MacVim"
alias im="sips -g pixelHeight -g pixelWidth"
alias chrome="open -a \"Google Chrome\""

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
