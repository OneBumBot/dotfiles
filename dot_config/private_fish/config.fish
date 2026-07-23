if status is-interactive
    eval (zellij setup --generate-auto-start fish | string collect)
# Commands to run in interactive sessions can go here
end
