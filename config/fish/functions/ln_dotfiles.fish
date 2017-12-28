###
# Symlink / link dotfiles from /opt/Code/dotfiles/ to $HOME directory.
###
function lndotfiles --description 'Symlink $DOTFILES to $HOME'
  ln -sf $DOTFILES/shells/bash/bash_profile $HOME/.bash_profile
  ln -sf $DOTFILES/shells/bash/bashrc $HOME/.bashrc

  if type -q nvim
    ln -sf $DOTFILES/config/nvim/init.vim $HOME/.config/nvim/init.vim
    set -x MANPAGER "nvim -c 'set ft=man' -"
  end

  if type -q vim
    ln -sf $DOTFILES/editors/vim/editorconfig $HOME/.editorconfig
    ln -sf $DOTFILES/editors/vim/vimrc $HOME/.vimrc
  end

  if type -q git
    ln -sf $DOTFILES/git/gitconfig  $HOME/.gitconfig
  end

  if type -q r2
    ln -sf $DOTFILES/radare/radare2rc  $HOME/.radare2rc
  end

  if type -q tmux
    ln -sf $DOTFILES/tmux/tmux.conf $HOME/.tmux.conf
  end

  if type -q iex
    ln -sf $DOTFILES/lang/elixir/iex.exs $HOME/.iex.exs
  end
end
