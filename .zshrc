autoload -U promptinit
promptinit
#prompt redhat 8bit gray
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'
zstyle ':completion:*:kill:*' verbose on
zstyle ':completion:*:expand:*' tag-order all-expansions
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~''*?.old' '*?.pro'
zstyle ':completion:*:functions' ignored-patterns '_*'

zstyle ':completion:*' menu yes select

autoload -U compinit && compinit
# файл истории команд 
HISTFILE=~/.zhistory

# Число команд, сохраняемых в HISTFILE 
SAVEHIST=5000

# Дополнение файла истории 
setopt  APPEND_HISTORY

# Игнорировать все повторения команд 
setopt  HIST_IGNORE_ALL_DUPS

# Игнорировать лишние пробелы 
setopt  HIST_IGNORE_SPACE

# не пищать при дополнении или ошибках 
setopt NO_BEEP

# если набрали путь к директории без комманды CD, то перейти 
setopt AUTO_CD

# исправлять неверно набранные комманды 
setopt CORRECT_ALL

# zsh будет обращаться с пробелами так же, как и bash 
setopt SH_WORD_SPLIT

# последние комманды в начале файла и не хранить дубликаты 
setopt histexpiredupsfirst histfindnodups

# ещё всякая херь про истоию 
setopt histignoredups histnostore histverify histignorespace extended_history  share_history

# автоматическое удаление одинакового из этого массива 
typeset -U path cdpath fpath manpath

autoload promptinit
promptinit
prompt redhat

# загружаем список цветов 
autoload colors && colors

# 
# Установка PROMT 
# 
# левый 
#PROMPT="%{$fg_bold[grey]%}>>%{$reset_color%}"
#PROMPT="%{$fg_bold[white]%}%d"

export LS_COLORS='no=00;37:fi=00;37:di=01;36:ln=04;36:pi=33:so=01;35:do=01;35:bd=33;01:cd=33;01:or=31;01:su=37:sg=30:tw=30:ow=34:st=37:ex=01;31:*.cmd=01;31:*.exe=01;31:*.com=01;31:*.btm=01;31:*.sh=01;31:*.run=01;31:*.tar=33:*.tgz=33:*.arj=33:*.taz=33:*.lzh=33:*.zip=33:*.z=33:*.Z=33:*.gz=33:*.bz2=33:*.deb=33:*.rpm=33:*.jar=33:*.rar=33:*.jpg=32:*.jpeg=32:*.gif=32:*.bmp=32:*.pbm=32:*.pgm=32:*.ppm=32:*.tga=32:*.xbm=32:*.xpm=32:*.tif=32:*.tiff=32:*.png=32:*.mov=34:*.mpg=34:*.mpeg=34:*.avi=34:*.fli=34:*.flv=34:*.3gp=34:*.mp4=34:*.divx=34:*.gl=32:*.dl=32:*.xcf=32:*.xwd=32:*.flac=35:*.mp3=35:*.mpc=35:*.ogg=35:*.wav=35:*.m3u=35:';
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

export EDITOR=vim
export PAGER=vimpager
alias less=$PAGER
alias zless=$PAGER
export PATH=/opt/local/bin:$PATH
alias ls='ls -FG'
alias ll='ls -FGl'

export GOBIN=/usr/local/go/bin
export PATH=$PATH:$GOBIN
export GOPATH=~/opt/go:/opt/local/go