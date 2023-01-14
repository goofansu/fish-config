### GPG
function gpg-encrypt
    gpg -se -r $USER_EMAIL $argv
end

function gpg-pubkey
    gpg --armor --export $USER_EMAIL
end

function gpg-import
    gpg --import $argv
end

### Docker
function docker-rm
    docker rm (docker ps -q -f "status=exited")
end

function docker-rmi
    docker rmi (docker images --filter "dangling=true" -q --no-trunc)
end

### macOS
function reset-launchpad -d "Reset Launchpad"
    defaults write com.apple.dock ResetLaunchPad -bool true
    killall Dock
end

function toggle-dark-mode
    osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to not dark mode'
end

### Elixir
function elixir-iex-h -d 'Prints help for the given module, function or macro'
    iex -e "require IEx.Helpers; IEx.Helpers.h($argv); System.halt"
end

function elixir-iex-b -d 'Prints callbacks info and docs for a given module'
    iex -e "require IEx.Helpers; IEx.Helpers.b($argv); System.halt"
end

function elixir-hex-info -d 'Prints hex package config'
    mix hex.info $argv | grep 'Config:' | sed 's/Config: //g'
end

function elixir-compile-info -d 'Print elixir compile information'
    iex -e "IO.inspect Kernel.__info__(:compile); System.halt"
end

### Emacs
function start-emacs
    emacs --daemon=term
end

function magit -d 'Open git status in Emacs'
    emacsclient -s term -nw -u -e "(magit-status)"
end

function ediff -d 'Compare files in Emacs'
    emacsclient -s term -nw -u -e "(ediff \"$argv[1]\" \"$argv[2]\")"
end

### fzf
function fssh -d "Fuzzy-find ssh host via ag and ssh into it"
    rg --ignore-case '^host [^*]' ~/.ssh/config | cut -d ' ' -f 2 | fzf | read -l result; and ssh "$result"
end

function fco -d "Fuzzy-find and checkout a branch"
    git branch --all | grep -v HEAD | string trim | fzf | read -l result; and git checkout "$result"
end

function fcoc -d "Fuzzy-find and checkout a commit"
    git log --pretty=oneline --abbrev-commit --reverse | fzf --tac +s -e | awk '{print $1;}' | read -l result; and git checkout "$result"
end

function fcopr -d "Checkout selected pull request"
    gh pr list $argv | fzf | awk '{print $1;}' | read -l result; and gh pr checkout "$result"
end

### Rails
function kill-spring
    ps -ef | grep spring | grep -v grep | awk '{print $2}' | xargs -I {} kill -9 {}
end

function unload-puma
    launchctl unload ~/Library/LaunchAgents/io.puma.dev.plist
end

function load-puma
    launchctl load -w ~/Library/LaunchAgents/io.puma.dev.plist
end
