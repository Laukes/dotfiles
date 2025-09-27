# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# other fav theme: powerlevel10k/powerlevel10k

# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ZSH_THEME="powerlevel10k/powerlevel10k"

[[ -r ~/Repos/znap/znap.zsh ]] ||
    git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git ~/Repos/znap
source ~/Repos/znap/znap.zsh

#znap prompt sindresorhus/pure
znap source zsh-users/zsh-syntax-highlighting
znap source valentinocossar/vscode
znap source zsh-users/zsh-autosuggestions

#znap source zsh-users/zsh-completions
#znap source zdharma-continuum/fast-syntax-highlighting
# i load this one th good old way bc i dont know how to do it via znap
 plugins=(zsh-history-substring-search)
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

eval "$(direnv hook zsh)"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"
# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Enable shell completions
# Set Homebrew Path
export PATH=/opt/homebrew/bin/:$PATH
autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit && compinit

## History Configuration
export HISTSIZE=99999
export SAVEHIST=10000
HISTFILE=$HOME/.zhistory
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY

## Auto-Suggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#999999"
export ZSH_AUTOSUGGEST_STRATEGY=(history)
export ZSH_AUTOSUGGEST_USE_ASYNC=true
#complete -C '/opt/homebrew/bin/aws_completer' aws
#source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

### substring reverse history search using arrow keys (based on history)
### needs zsh-history-substring-search 
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

### use alt+arrow the right way
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word

## Aliases and more
alias pycharm='open -b com.jetbrains.pycharm'
alias tf='terraform'

# Carapace
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)

source /opt/homebrew/opt/spaceship/spaceship.zsh
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
