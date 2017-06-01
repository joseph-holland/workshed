# Command Aliases
alias loadaxe='. $AXE_ROOT/etc/axerc'
alias goaxe='cd $AXE_ROOT; . etc/axerc'

# AWS Tool helpers
alias aws-session-save="env | grep '^AWS' | xargs -i echo \"export {}\" | sed -e 's/=/=\"/' | sed -e 's/$/\"/' > /tmp/aws-session-credentials"
alias aws-session-load=". /tmp/aws-session-credentials"
alias aws-session-purge="env | grep '^AWS' | awk -F'=' '{print \$1}' | xargs -i echo 'unset {}' > /tmp/aws-session-purge; . /tmp/aws-session-purge"

