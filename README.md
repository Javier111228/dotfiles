# Dotfiles

At context, remote pairing is an important part of our workflow. Using a
common tools and configs enables a smoother remote pairing process.

## Tools

- [tmate](https://tmate.io/) - Instant terminal sharing
- [tmux](https://github.com/tmux/tmux/wiki) - terminal multiplexer
- [tmuxp](https://tmuxp.git-pull.com/en/latest/) - tmux session manager
- vim - highly configurable text editor
- [gitsh](https://github.com/thoughtbot/gitsh) - interactive shell for git
- [rcm](https://github.com/thoughtbot/rcm) - dotfile management
- [jshint](http://jshint.com/install/) - syntax checking for javascript

## Getting started

1. Clone this repo
  `git clone git@github.com:Context-Travel/dotfiles.git context-dotfiles`
1. Install the tools from the above list
1. Create a `~/.rcrc` file (NOTE: If you already use `rcm` for managing your
   personal dotfiles just added this dir to `DOTFILES_DIRS` in your existing
   `.rcrc`. Also, if you aren't using rcm for your personal dotfiles and you
   have personal dotfiles `rcm` is a powerful way to easily manage dotfiles from
   multiple souces.)
```
echo 'DOTFILES_DIRS="~/context-dotfiles"' > ~/.rcrc
```
1. Install the dotfiles
```
rcup
```
1. Install Vim Plugins

```
:VundleInstall
```

## Basic commands

- Start and attach to tmux sessions for admin and api:
  `tmuxp load admin api`

- Attach to already existing api and admin sessions:
  `tmux attach-session -t admin -t api`

## Vim Configs

We use Vundle to manage plugins for vim. You can find a list of plugins in
[vim/vundles](vim/vundles). You can add more plugins here to share with the team
or you can add personal plugins in your own `~/.vim/vundles.local`.
All config files are in `vim/configs`. Add personal configs by
just adding a new file to the folder. Add shared configs by editing an existing
file or adding a new file and commiting it to this repo.

## Update your local dotfiles

1. Pull the lastest changes to this repo
 `cd ~/context-dotfile; git pull origin master`
1. Run rcup
  `rcup`
1. Install the lastest plugins in vim
  `:VundleInstall`

## Contributing to dotfiles

We use `rcm` to manage dotfiles. You can find full documation of the tools
provided by `rcm` by running `man rcm`. When editing dotfiles you can use `mkrc`
to add an existing dotfile to this repo. To edit an
existing file you just edit it directly in its installed location. (`rcm` manages
dotfile by creating symlinks). Once your done making your changes, commit them
to a branch in this repo and create a PR as normal.

You can use `tmuxp load dots` to edit them in a tmux session layed out just for
this purpose.
