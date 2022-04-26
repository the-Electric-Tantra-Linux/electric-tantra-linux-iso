#!/bin/sh

# Create localized well-known user dirs before trying to hide irrelevant icons.
# Not a separate script, to avoid running into race conditions.

desktop="$HOME/Desktop"
i18n_desktop=$(xdg-user-dir DESKTOP)
cd "${i18n_desktop}"

if [ -f $HOME/.first-login ]; then
    xdg-user-dirs-update --force
    rm -f $HOME/.first-login &

    # Move stuff out of standard C locale Desktop and delete it
    if [ "${i18n_desktop}" != "$desktop" ]; then
        mv -f $desktop/.hidden* .
        mv -f $desktop/* .
        rmdir "$desktop" &
    fi
fi

# Currently LXDE (i.e. pcmanfm) doesn't seem to support .hidden
case $XDG_CURRENT_DESKTOP in
  KDE) [[ -f .hidden-kde ]] && ln -sf .hidden-kde .hidden
        ;;
  MATE) [[ -f .hidden-mate ]] && ln -sf .hidden-mate .hidden
        ;;
  LXDE) rm -f org.kde.konversation.desktop
        ;;
  LXQt) [[ -f .hidden-lxqt ]] && ln -sf .hidden-lxqt .hidden
        ;;
  *)    false
        ;;
esac
