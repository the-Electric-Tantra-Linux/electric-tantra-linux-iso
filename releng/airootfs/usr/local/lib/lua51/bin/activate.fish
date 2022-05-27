if functions -q deactivate-lua
    deactivate-lua
end

function deactivate-lua
    if test -x '/home/tlh/Samsung/Work/electric-tantra-linux-iso/releng/airootfs/etc/skel/.config/awesome/lua51/bin/lua'
        eval ('/home/tlh/Samsung/Work/electric-tantra-linux-iso/releng/airootfs/etc/skel/.config/awesome/lua51/bin/lua' '/home/tlh/Samsung/Work/electric-tantra-linux-iso/releng/airootfs/etc/skel/.config/awesome/lua51/bin/get_deactivated_path.lua' --fish)
    end

    functions -e deactivate-lua
end

set -gx PATH '/home/tlh/Samsung/Work/electric-tantra-linux-iso/releng/airootfs/etc/skel/.config/awesome/lua51/bin' $PATH
