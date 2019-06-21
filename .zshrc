# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
#

eval "$(rbenv init -)"
export EDITOR=vim

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/jakew/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/jakew/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/jakew/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/jakew/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

__add_sys_prefix_to_path # Fix conda

unsetopt CORRECT # Remove auto correct
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export PATH="/usr/local/opt/scala@2.12/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
