require("autocommands")
require("options")
require("mappings")
require("utils")
require("highlights")
require("pluginList")
require("plugins.bufferline")
require("packerInit")
require("plugins.dashboard")
local modules = {
    "pluginList",
    "plugins.bufferline",
    "mappings",
    "options",
    "utils"
}

local async
async =
    vim.loop.new_async(
    vim.schedule_wrap(
        function()
            for i = 1, #modules, 1 do
                local ok, res = xpcall(require, debug.traceback, modules[i])
                if not (ok) then
                    print("Error loading module : " .. modules[i])
                    print(res) -- print stack traceback of the error
                end
            end
            async:close()
        end
    )
)
async:send()

for i = 1, #modules, 1 do
    pcall(require, modules[i])
end
