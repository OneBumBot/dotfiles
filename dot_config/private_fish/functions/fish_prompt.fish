function fish_prompt
    set_color cyan
    
    if test "$PWD" = "$HOME"
        echo -n '~'
    else
        echo -n (basename "$PWD")
    end
    
    set_color green
    echo -n ' ➜ '
    set_color normal
end
