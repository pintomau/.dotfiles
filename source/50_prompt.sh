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

# if [[ ! "${prompt_colors[@]}" ]]; then
#   prompt_colors=(
#     "36" # information color
#     "37" # bracket color
#     "31" # error color
#   )
#
#   if [[ "$SSH_TTY" ]]; then
#     # connected via ssh
#     prompt_colors[0]="32"
#   elif [[ "$USER" == "root" ]]; then
#     # logged in as root
#     prompt_colors[0]="35"
#   fi
# fi

# Returns "*" if the current git branch is dirty.
function parse_git_dirty {
  [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]] && echo "*"
}

# Returns "|shashed:N" where N is the number of stashed states (if any).
function parse_git_stash {
  local stash=`expr $(git stash list 2>/dev/null| wc -l)`
  if [ "$stash" != "0" ]
  then
    echo "|stashed:$stash"
  fi
}

# Returns "|unmerged:N" where N is the number of unmerged local and remote
# branches (if any).
function parse_git_unmerged {
  local unmerged=`expr $(git branch --no-color -a --no-merged | wc -l)`
  if [ "$unmerged" != "0" ]
  then
    echo "|unmerged:$unmerged"
  fi
}

# Returns "|unpushed:N" where N is the number of unpushed local and remote
# branches (if any).
function parse_git_unpushed {
  local unpushed=`expr $( (git branch --no-color -r --contains HEAD; \
    git branch --no-color -r) | sort | uniq -u | wc -l )`
  if [ "$unpushed" != "0" ]
  then
    echo "|unpushed:$unpushed"
  fi
}

# Get the current git branch name (if available)
git_prompt() {
  local ref=$(git symbolic-ref HEAD 2>/dev/null | cut -d'/' -f3)
  if [ "$ref" != "" ]
  then
    echo "($ref$(parse_git_dirty)$(parse_git_stash)$(parse_git_unmerged)$(parse_git_unpushed)) "
  fi
}

prompt_command() {
  local none="\[\033[0m\]"

  local black="\[\033[0;30m\]"
  local dark_gray="\[\033[1;30m\]"
  local blue="\[\033[0;34m\]"
  local light_blue="\[\033[1;34m\]"
  local green="\[\033[0;32m\]"
  local light_green="\[\033[1;32m\]"
  local cyan="\[\033[0;36m\]"
  local light_cyan="\[\033[1;36m\]"
  local red="\[\033[0;31m\]"
  local light_red="\[\033[1;31m\]"
  local purple="\[\033[0;35m\]"
  local light_purple="\[\033[1;35m\]"
  local brown="\[\033[0;33m\]"
  local yellow="\[\033[1;33m\]"
  local light_gray="\[\033[0;37m\]"
  local white="\[\033[1;37m\]"

  local current_tty=`tty | sed -e "s/\/dev\/\(.*\)/\1/"`

  local u_color=$purple
  id -u > /dev/null 2>&1 &&           #Cross-platform hack.

  if [ `id -u` -eq 0 ] ; then
    local u_color=$yellow
  fi

  PS1="$light_blue> $u_color\u$brown@${purple}\h$brown:\
$light_blue\w$cyan$(__git_ps1)\n$light_blue> $light_red\$?"\
"$brown"' \$'"$none "

  PS2="$dark_gray>$none "
}

PROMPT_COMMAND="prompt_command"
