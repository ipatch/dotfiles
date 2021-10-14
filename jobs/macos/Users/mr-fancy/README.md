this dir is just a little dumping ground for me experimenting with neovim ≥ 0.5.0 features.

inside the local `XDG_CONFIG_HOME` dir there is a `nvim` dir that contains `init.lua` that uses newer than rather than older plugins written in lua to work with the latest features of neovim. the primary purpose of this configuration is to get a working **nvim-dap** setup going.

my personal use case, i created a new user on my local system to experiment with the new neovim features without having to destroy my current bloated 🤢 vim & neovim setup. the goal is to archive my current setup and use this new `init.lua` as my primary setup, and attempt to keep the configuration in a single file or at least maintain a single file setup so i can easily use this configuration on other computers ie. when i have to ssh into another computer.
