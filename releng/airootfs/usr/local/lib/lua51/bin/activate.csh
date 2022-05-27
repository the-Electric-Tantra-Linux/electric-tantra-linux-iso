which deactivate-lua >&/dev/null && deactivate-lua

alias deactivate-lua 'if ( -x '\''/home/tlh/Samsung/Work/electric-tantra-linux-iso/releng/airootfs/etc/skel/.config/awesome/lua51/bin/lua'\'' ) then; setenv PATH `'\''/home/tlh/Samsung/Work/electric-tantra-linux-iso/releng/airootfs/etc/skel/.config/awesome/lua51/bin/lua'\'' '\''/home/tlh/Samsung/Work/electric-tantra-linux-iso/releng/airootfs/etc/skel/.config/awesome/lua51/bin/get_deactivated_path.lua'\''`; rehash; endif; unalias deactivate-lua'

setenv PATH '/home/tlh/Samsung/Work/electric-tantra-linux-iso/releng/airootfs/etc/skel/.config/awesome/lua51/bin':"$PATH"
rehash
