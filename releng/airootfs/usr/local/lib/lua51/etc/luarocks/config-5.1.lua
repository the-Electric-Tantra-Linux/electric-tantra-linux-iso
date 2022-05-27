-- LuaRocks configuration

rocks_trees = {
   { name = "user", root = home .. "/.luarocks" };
   { name = "system", root = "/home/tlh/Samsung/Work/electric-tantra-linux-iso/releng/airootfs/etc/skel/.config/awesome/lua51" };
}
lua_interpreter = "lua";
variables = {
   LUA_DIR = "/home/tlh/Samsung/Work/electric-tantra-linux-iso/releng/airootfs/etc/skel/.config/awesome/lua51";
   LUA_BINDIR = "/home/tlh/Samsung/Work/electric-tantra-linux-iso/releng/airootfs/etc/skel/.config/awesome/lua51/bin";
}
