
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
ZSH=/home/raahim/.oh-my-zsh
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME=""
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

alias ls=exa
alias spotify=spt
alias mount_uni="~/scripts/university_fs.sh"
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias zhcn="~/projects/Personal/english-to-chinese/main.py"
alias new-eth="~/projects/NodeJs/Web3Js/new-blockchain-account-eth/app.js"
alias l-serve="php artisan serve"
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
alias sublime=subl
alias bt-connect="~/scripts/bluetooth-connect.sh"
alias dog='pygmentize -g'
alias supdate="sudo pacman -Syu"
alias cal="cal -m"
alias sdl-init="~/scripts/sdl2-init.sh"
alias leetcode-init="~/scripts/leetcode-init.sh"
alias cpi="~/scripts/comp-programming-init.sh"
alias cpx="~/scripts/comp-programming-cpp-compile.sh"
alias xcopy="~/scripts/xcopy.sh"
alias clone="~/scripts/clone.sh"
alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'
alias vim=nvim
alias cd=z
# alias code="echo '' > /dev/null"

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$HOME/.config/composer/vendor/bin
# export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1

export PROJECTS="/home/raahim/projects"

[ -f "/home/yeet/.ghcup/env" ] && source "/home/yeet/.ghcup/env" # ghcup-env

function initial_command() {
    commands_list=(
            "pfetch"
            "toilet -f mono12 -F metal Raahim"
            "cowsay \"Why are we here? Just to suffer?\""
            "cowsay \"I'm not sure what I'm doing here...\""
            "cowsay \"Who am I?\""
            "cowsay \"Linux is better than Windows, right?\""
            "cowsay \"C++ > Python\""
            "cowsay \"Rust is cool\""
            "cal"
            "cowsay \"i use arch btw\""
            "cowsay \":(){ :|:& }:\""
            "toilet -F border -F rainbow \"Why are you gae?\""
            "printf \"i UsE LiNuX, iM sO eDgY\\n\""
        )

        index=$(((RANDOM % ${#commands_list[@]}) + 1))
        c="${commands_list[$index]}"
        eval " $c"
}

# initial_command

# Created by `pipx` on 2024-04-11 08:07:21
export PATH="$PATH:/home/raahim/.local/bin"
eval "$(zoxide init zsh)"

NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="$PATH:$NPM_PACKAGES/bin"

# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
# source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
