source_if_exists () {
  if test -r "$1"; then
    source "$1"
  fi
}

source_if_exists $DOTFILES/zsh/history.zsh
source_if_exists $DOTFILES/zsh/git.zsh
source_if_exists $DOTFILES/zsh/config.zsh
source_if_exists $DOTFILES/zsh/packages.zsh
source_if_exists $DOTFILES/zsh/functions.zsh
source_if_exists $DOTFILES/zsh/aliases.zsh
source_if_exists /usr/local/etc/profile.d/z.sh
source_if_exists /opt/homebrew/etc/profile.d/z.sh
# -----------------------

# brew
export PATH=/opt/homebrew/bin:$PATH
# -----------------------

# docker: x11
export DOCKER_DISPLAY=$(ifconfig en0 | grep inet\ | awk '{ print $2 ":0" }')
# -----------------------

# starship
eval "$(starship init zsh)"
# -----------------------

# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh
# -----------------------

# direnv
eval "$(direnv hook zsh)"
source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"
# -----------------------

# dart
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH":"$(asdf where flutter)/bin/cache/dart-sdk"
## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/admin/.dart-cli-completion/zsh-config.zsh ]] && . /Users/admin/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]
# -----------------------

# Android SDK Manager
export ANDROID_SDK_ROOT=$HOME/Library/Android/SDK
export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

# gpg
export GPG_TTY=$(tty)
