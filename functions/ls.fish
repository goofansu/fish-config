function ls --description 'A modern replacement for ‘ls’.'
    if type -sq exa
        exa $argv
    end
end
