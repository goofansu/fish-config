# LANG
set -gx LANG "en_US.UTF-8"
set -gx LC_ALL "en_US.UTF-8"

# Self-contained Emacs built with https://github.com/jimeh/build-emacs-for-macos
set -gx PATH "/Applications/Emacs.app/Contents/MacOS" "/Applications/Emacs.app/Contents/MacOS/bin" $PATH
set -gx EMACS_SERVER_NAME "gui"

# EDITOR
set -gx EDITOR "emacsclient -s term -t"
set -gx VISUAL "emacsclient -s term -t"

# compile openssl
set -gx LIBRARY_PATH $LIBRARY_PATH /opt/homebrew/opt/openssl/lib/

# rbenv
if type -q rbenv
    status --is-interactive; and source (rbenv init -|psub)
end

# asdf
if test -d $HOME/.asdf
    source /opt/homebrew/opt/asdf/libexec/asdf.fish
end

# Erlang
set -gx KERL_BUILD_DOCS yes

# Erlang shell
set -gx ERL_AFLAGS "-kernel shell_history enabled"

# Elixir shell
# See https://hexdocs.pm/plug/Plug.Debugger.html#module-links-to-the-text-editor
# emacs
set -gx ELIXIR_EDITOR "/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -c -a emacs +__LINE__ __FILE__"

# vscode
# set -gx ELIXIR_EDITOR "code --goto __FILE__:__LINE__"
set -gx PLUG_EDITOR "vscode://file/__FILE__:__LINE__"

# textmate
# set -gx ELIXIR_EDITOR "mate __FILE__ -l __LINE__"
# set -gx PLUG_EDITOR "txmt://open/?url=file://__FILE__&line=__LINE__"

# Go
set -gx GOPATH $HOME/go

# emacs-racer
if type -q rustc
    set -gx RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/src
end

### export PATH

# sbin
set -gx PATH $PATH /usr/local/sbin

# Emacs
set -gx PATH $PATH $HOME/.emacs.d/bin

# Yarn
set -gx PATH $PATH $HOME/.config/yarn/global/node_modules/.bin

# Go
# set -gx PATH $PATH $GOPATH/bin

# Rust
# set -gx PATH $PATH $HOME/.cargo/bin

# bin in current folder
set -gx PATH ./bin $PATH

# grep
set -gx PATH /opt/homebrew/opt/grep/libexec/gnubin $PATH
