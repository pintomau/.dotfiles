# My awesome bash prompt
#
# Copyright (c) 2012 "Cowboy" Ben Alman
# Licensed under the MIT license.
# http://benalman.com/about/license/
#
# Example:
# [master:!?][cowboy@CowBook:~/.dotfiles]
# [11:14:45] $
#
# Read more (and see a screenshot) in the "Prompt" section of
# https://github.com/cowboy/dotfiles

# ANSI CODES - SEPARATE MULTIPLE VALUES WITH ;
#
#  0  reset          4  underline
#  1  bold           7  inverse
#
# FG  BG  COLOR     FG  BG  COLOR
# 30  40  black     34  44  blue
# 31  41  red       35  45  magenta
# 32  42  green     36  46  cyan
# 33  43  yellow    37  47  white

if [[ ! "${prompt_colors[@]}" ]]; then
  prompt_colors=(
    "36" # information color
    "37" # bracket color
    "31" # error color
  )

  if [[ "$SSH_TTY" ]]; then
    # connected via ssh
    prompt_colors[0]="32"
  elif [[ "$USER" == "root" ]]; then
    # logged in as root
    prompt_colors[0]="35"
  fi
fi

prompt_command() {
  local DEF="\[\033[0;00m\]"
  local W="\[\033[0;37m\]"
  local R="\[\033[0;31m\]"
  local O="\[\033[0;33m\]"
  local StartSymbol="\342\200\272" # ›
  PS1="$R$StartSymbol$O\w $R\$(__git_ps1 "%s"' ')$DEF"
}

PROMPT_COMMAND="prompt_command"
