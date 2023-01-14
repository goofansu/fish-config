function vi -d "Edit in the default Emacs daemon"
    emacsclient -s term -nw $argv
end
