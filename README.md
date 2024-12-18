<!---
Javier111228/Javier111228 is a ✨ special ✨ repository because its `README.md` (this file) appears on your GitHub profile.
You can click the Preview link to take a look at your changes.
---># Dotfiles

At Context, remote pairing is an important part of our workflow. Using a
common tools and configs enables a smoother remote pairing process.

## Tools

- [tmate](https://tmate.io/) - Instant terminal sharing
- vim - highly configurable text editor
- [gitsh](https://github.com/thoughtbot/gitsh) - interactive shell for git
- [rcm](https://github.com/thoughtbot/rcm) - dotfile management
- [rubocop](http://rubocop.readthedocs.io/en/latest/) - syntax checking for ruby
- [eslint](https://eslint.org/docs/user-guide/getting-started#installation-and-usage) - syntax checking for javascript
- [stylelint](https://stylelint.io/) - syntax checking for scss
- [powerline fonts](https://powerline.readthedocs.io/en/master/installation.html#installation-on-various-platforms) - Fonts for an awesome vim status bar
- [ag/the_silver_searcher](https://github.com/ggreer/the_silver_searcher) - for faster in-project searching
- [vundle](https://github.com/VundleVim/Vundle.vim) - Vim package manager

## Getting started

1. Clone this repo
  `git clone git@github.com:Context-Travel/dotfiles.git context-dotfiles`
1. Install the tools from the above list
1. Create a `~/.rcrc` file (NOTE: If you already use `rcm` for managing your
   personal dotfiles just added this dir to `DOTFILES_DIRS` in your existing
   `.rcrc`. Also, if you aren't using rcm for your personal dotfiles and you
   have personal dotfiles `rcm` is a powerful way to easily manage dotfiles from
   multiple sources.)
1. Ensure `~/.bin` is added to your `$PATH`
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

1. Add your own gitconfigs to `~/.gitconfig.local`

    ```
    [user]
      name = Rebecca Meritz
      email = rebecca@meritz.com
    [gitsh]
      gitCommand = /usr/bin/hub
    ```

    (Note: If you are working with exisiting configs you want to might want to `mv
    ~/.gitconfig to ~/.gitconfig.local` and then just delete anything you don't need
    anymore after you run rcup.)

1. Add shared aliases, by sourcing the `~/.sh.d/aliases` file in your bash/zsh
   config

    `source ~/.sh.d/aliases`

    Optionally add your own aliases to `~/.aliases.local`

## OSX Specific Instructions
- You will need to specify the full path to the `context-dotfiles` dir in `.rcrc`
  so it should look like:
  ```
  DOTFILES_DIRS=/Users/peter_pizza/context-dotfiles
  ```
- You'll need to install `python` from homebrew, which should install `pip`
- You'll need to use `pip2` to install python packages (powerline, tmuxp, etc)

## Linux specific instructions
- If you're running a terminal inside of gnome you may want to [follow these directions for getting the paste buffer to work in a sensible way](http://vim.wikia.com/wiki/Accessing_the_system_clipboard).

## Basic commands

- Start and attach to tmate session: `tmatey`
- Switch to an `api` window with `C-b 1`, `C-b 2`, etc.
- Switch to an `admin` window with `C-b F1`, `C-b F2`, etc.
- Switch to an `WithContext` window with `C-n 1`, `C-n 2`, etc.
- Deattach from a tmate session `C-b d`
- Kill from a tmate session `C-b K`

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

# Using other editors

If you plan on using another editor alongside vim ensure you setup the
appropriate stylechecking plugins using the linters meantioned above in the tool
list.
