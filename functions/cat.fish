function cat --description 'A cat(1) clone with wings.'
    if type -sq bat
        bat $argv
    end
end
