# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

export anime="cd /home/netsu/Documents/Anime/"
export code="cd /home/netsu/Documents/Code/"
export cpp="cd /home/netsu/Documents/Code/C++"
export cppfun="cd /home/netsu/Documents/Code/C++/Fun"
export nim="cd /home/netsu/Documents/Code/Nim"
export nimfun="cd /home/netsu/Documents/Code/Nim/FUN"
export js="cd /home/netsu/Documents/Code/HTML-CSS-JS/JavaScript"
export jslib="cd /home/netsu/Documents/Code/HTML-CSS-JS/JavaScript/Libraries"
export py="cd /home/netsu/Documents/Code/Python"
export pylib="cd /home/netsu/Documents/Code/Python/Libraries"
export pyfun="cd /home/netsu/Documents/Code/Python/Fun"
export lua="cd /home/netsu/Documents/Code/Lua"
export luafun="cd /home/netsu/Documents/Code/Lua/Fun"
export web="cd /home/netsu/Documents/Code/HTML-CSS-JS/Webpages"
export yt="cd /home/netsu/Documents/YouTube"
export windows="cd /mnt/9A46DF2646DF0245/Users/onefa/Documents/"
export win="cd /mnt/9A46DF2646DF0245/Users/onefa/Documents/"
export work="cd /home/netsu/Documents/Work"   
export goles="cd /home/netsu/Documents/Code/Go/lessons/src/githib.com/weebnetsu"
export go="cd /home/netsu/Documents/Code/Go"
export flutter="cd /home/netsu/Documents/Code/Dart/Flutter/FUN/"

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1="\[\033[0;31m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]root\[\033[01;33m\]@\[\033[01;96m\]\h'; else echo '\[\033[0;39m\]\u\[\033[01;33m\]@\[\033[01;96m\]\h'; fi)\[\033[0;31m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;31m\]]\n\[\033[0;31m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]\[\e[01;33m\]\\$\[\e[0m\]"
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1="\[\033[0;31m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]root\[\033[01;33m\]@\[\033[01;96m\]\h'; else echo '\[\033[0;39m\]\u\[\033[01;33m\]@\[\033[01;96m\]\h'; fi)\[\033[0;31m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;31m\]]\n\[\033[0;31m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]\[\e[01;33m\]\\$\[\e[0m\]"
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\033[0;31m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]root\[\033[01;33m\]@\[\033[01;96m\]\h'; else echo '\[\033[0;39m\]\u\[\033[01;33m\]@\[\033[01;96m\]\h'; fi)\[\033[0;31m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;31m\]]\n\[\033[0;31m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]\[\e[01;33m\]\\$\[\e[0m\]"
    #PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

df -h /

echo -ne "\n\t\t\t\t\t\t\t"
date

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.nimble/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/netsu/.cache/paru/clone/distrobox/pkg/distrobox/usr/bin
export BROWSER='/usr/bin/vivaldi-stable'
export PATH=$PATH:/home/netsu/.local/share/gem/ruby/3.0.0/bin

alias img=sxiv
alias mplayer='mplayer -lavdopts threads=4 -aspect 16:9'
alias dj='python manage.py'
alias cpile='g++ main.cpp -o output && ./output'
alias frun='export FLASK_DEBUG=true && flask run'
alias workblock="export NODE_ENV=test && export PORT=5000 && nodemon"
alias docker="sudo docker"
alias kdenlive="$HOME/Documents/kdenlive/kdenlive-21.08.3-x86_64.appimage"
alias webstorm="$HOME/WebStorm-213.6777.57/bin/webstorm.sh"
# below will allow to play youtube videos in 720p (change format to 18 for 360p)
alias ympv="mpv --script-opts=ytdl_hook-ytdl_path=/usr/bin/yt-dlp --ytdl-format=22"
# alias ympv='mpv --script-opts=ytdl_hook-ytdl_path=/usr/local/bin/yt-dlp --ytdl-format="bestvideo[ext=mp4][height<=?720][fps<=30]"'
alias singlemonitor="xrandr --output DVI-I-0 --off --output DVI-I-1 --off --output HDMI-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-0 --off --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --off --output DP-5 --off"
alias multimonitor="xrandr --output DisplayPort-0 --mode 1360x768 --pos 1920x312 --rotate normal --output HDMI-A-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-A-1 --off --output HDMI-A-2 --off"
alias androidstudio="$HOME/bin/android-studio/bin/studio.sh"
alias fixperms="chmod 755 *"
alias fast="uvicorn main:app --reload"
alias bottle="flatpak run com.usebottles.bottles"
alias flutter="$HOME/flutter/bin/flutter"
alias startvirt="sudo virsh net-start default"
alias refresh="source ~/.bashrc"
alias venvstart="source venv/bin/activate"
alias intellij="~/bin/idea-IC-222.4345.14/bin/idea.sh"
alias idea="~/bin/idea-IC-222.4345.14/bin/idea.sh"
alias dubuntu="distrobox enter --root ubuntu"
alias code.="code ."
alias c="code ."
alias fbuild="flutter clean && flutter pub get && flutter build apk --release"

# replace "code ," with "code ."
code() {
    if [ "$1" = "," ]; then
        code .
    else 
        command code "$@"
    fi
}

eval `luarocks path --bin` # exports lua paths so we can use installed libraries
export PATH="$HOME/bin:$PATH"
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk/
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
[ -f "/home/netsu/.ghcup/env" ] && source "/home/netsu/.ghcup/env" # ghcup-env
# . "$HOME/.cargo/env"

export PATH="$HOME/bin:$PATH"
export PATH=/home/netsu/.meteor:$PATH
export PATH=$PATH:~/.local/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/netsu/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/netsu/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/netsu/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/netsu/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

. /opt/asdf-vm/asdf.sh

# Load Angular CLI autocompletion.
source <(ng completion script)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=/home/netsu/.nimble/bin:$PATH
