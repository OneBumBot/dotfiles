if status is-interactive
    if not set -q SSH_CONNECTION
        eval (zellij setup --generate-auto-start fish | string collect)
    end
# Commands to run in interactive sessions can go here
end
