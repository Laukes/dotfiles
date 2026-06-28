# Dotfiles

Managed with [GNU Stow](https://www.gnu.org/software/stow/). Files live in `~/dotfiles/` and are symlinked into the home directory.

## What's tracked

| File in repo | Symlinked to |
|---|---|
| `.zshrc` | `~/.zshrc` |
| `.tmux.conf` | `~/.tmux.conf` |
| `spaceship.zsh` | `~/spaceship.zsh` |
| `aerospace/dot-aerospace.toml` | `~/.aerospace.toml` |
| `.config/nvim/` | `~/.config/nvim/` |

The `--dotfiles` flag tells Stow to rename `dot-` prefixed files to `.` on symlink creation (e.g. `dot-aerospace.toml` → `.aerospace.toml`).

## Pulling updates

```bash
cd ~/dotfiles
git pull
```

Symlinks already point into the repo — no re-stowing needed.

## Pushing changes

Edit files normally (e.g. `~/.zshrc`), which writes through the symlink directly into the repo. Then:

```bash
cd ~/dotfiles
git add .zshrc
git commit -m "your message"
git push
```

## Adding a new dotfile

```bash
mv ~/.yournewfile ~/dotfiles/.yournewfile
cd ~/dotfiles
stow . --dotfiles
git add .yournewfile
git commit -m "add yournewfile"
git push
```

## Stow individual packages

```bash
stow aerospace --dotfiles
```
