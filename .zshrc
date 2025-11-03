[[ -z "$HOSTNAME" ]] && export HOSTNAME=$(hostname)

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/steffen/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# Source zinit (Zsh plugin manager)
if [[ ! -f ~/.local/share/zinit/zinit.git/zinit.zsh ]]; then
  mkdir -p ~/.local/share/zinit
  git clone https://github.com/zdharma-continuum/zinit.git ~/.local/share/zinit/zinit.git
fi
source ~/.local/share/zinit/zinit.git/zinit.zsh

# Plugins
zinit light zsh-users/zsh-history-substring-search
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

# Oh-My-Posh
export PATH=$PATH:/home/steffen/.local/bin
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/omp.toml)"

# ~/.zshrc — interactive shell startup
# TODO: check why this is not working
# source "${ASDF_DATA_DIR}/asdf.sh"

# ls colors
eval "$(dircolors)"
alias ls="ls --color=auto"
alias ll="ls -lh --color=auto"
alias la="ls -lah --color=auto"

# Enable completions if you want
fpath=("${ASDF_DATA_DIR}/completions" $fpath)
autoload -Uz compinit && compinit


# fnm
FNM_PATH="/home/steffen/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi
