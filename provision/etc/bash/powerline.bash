# ----------------------------------------------------------------------
# Configure PROMPT
# ----------------------------------------------------------------------

_YELLOW='\[\e[33m\]'
_GREEN='\[\e[32m\]'
_GREY='\[\e[30;1m\]'
_DEFAULT='\[\e[0m\]'
_RED='\[\e[31m\]'

# Adds a red line after each command
# PS1="\e]2;\$(pwd)\a\e]1;\$(pwd)\a\e[31;1m\$(s=\$(printf "%*s" \$COLUMNS); echo \${s// /―})\n)\e[0m ";

# Adds ':)' or ':(' after a command is run to show return code status
# export PS1="\[\e[01;32m\]\u@\h \[\e[01;34m\]\W \`if [ \$? = 0 ]; then echo -e '\e[01;32m:)'; else echo -e '\e[01;31m:('; fi\`

UID_KEY='\$'
STATUS_MARKER="\`if [ \$? = 0 ]; then echo -e '\e[01;32m:)'; else echo -e '\e[01;31m:('; fi\`"
WHICHBRANCH="\$(G=\$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p'); NB=\$(echo \$G | grep \"Not a git repository\" | wc -l | awk '{ print \$1 }'); if [ \$NB -eq 0 ]; then echo -e \"${_RED}(\$G)${_DEFAULT}\";fi)"

export WHICHBRANCH STATUS_MARKER UID_KEY

TERMINAL_TITLE="\[\e]0;\u@\h:\w\a\]"
TERMINAL_PROMPT="${_YELLOW}[\d \t] ${_GREEN}\u@\h${_DEFAULT} ${WHICHBRANCH} ${_GREY}\w\n${_DEFAULT}${UID_KEY}"

function _update_ps1() {
    PS1="$(~/bin/powerline-shell.py --mode flat $? 2> /dev/null)"
    PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
    PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv AWS_DEFAULT_REGION "$AWS_DEFAULT_REGION")'
    PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv AWS_ID_NAME "$AWS_ID_NAME")'
    PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv VIRTUAL_ENV "$VIRTUAL_ENV")'
    export PS1
}

function _prompt_default() {
    unset PROMPT_COMMAND
    export PS1="${TERMINAL_PROMPT} "
}

function _prompt_power() {
    export PROMPT_COMMAND="_update_ps1;"
}

function _update_ps1_powerline() {
    export PS1="$(~/bin/powerline-shell.py.new --mode patched $? 2> /dev/null)"
}

function _prompt_powerline() {
    export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
}

_prompt_powerline
# _update_ps1_powerline

export PS2="continue-> "
export PS4='$0.$LINENO+ '
