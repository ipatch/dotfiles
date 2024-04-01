## readme / tmux

my super crude readme for setting up tmux

- after copying my provided `tmux.conf` and possibly symlinking as `~/.tmux.conf`
- symlink `ln -sf /path/to/dotfiles/terms/tmux/tmux $HOME/.tmux`
- one will have to clone/install [tpm][tpm]
- then clone **tpm** within the `$HOME/.tmux` directory
  ```
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ```
- ~~symlink macos specific tmux conf, ie. related to _reattach-to-user-namespace_~~
- then run `prefix, I` to install listed plugins in `~/.tmux.conf`

### todos

<a name="todos"></a>

- [ ] [obviously][obv], this setup _would be much cooler_ if a single cmd could check, install, set things up, as opposed to the manual intervention listed above.


[tpm]: <https://github.com/tmux-plugins/tpm>
[obv]: <https://user-images.githubusercontent.com/613805/131574330-a256f3a7-3135-4bb5-aac6-959edb18ebdb.png>

