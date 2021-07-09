
case "$OSTYPE" in
# Mac
darwin*)
  # Add nix configuration if available
  if [ -e /Users/benwinding/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/benwinding/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
  ;;
esac


