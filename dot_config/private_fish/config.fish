if status is-interactive
    # Commands to run in interactive sessions can go here

    # Better PATH handling
    set -gx PATH $HOME/.local/bin $PATH

    # Enable truecolor
    set -gx TERM xterm-256color

    # Neovim as default editor
    set -gx EDITOR nvim

end
