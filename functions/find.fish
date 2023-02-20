function find -d "Replace find with fd"
    if type -sq fd
        fd $argv
    end
end
