local function is_mmd(path)
    return path:match("%.mmd$") ~= nil
end

local function preview_mmd(self, path)
    local svg = "/tmp/yazi_mmd_preview.svg"
    os.execute(("mmdc -i %s -o %s --quiet"):format(path, svg))

    -- use chafa to render SVG to ANSI
    local handle = io.popen("chafa " .. svg)
    local content = handle:read("*a")
    handle:close()

    return {
        title = "Mermaid Preview",
        body = content,
    }
end

return {
    build = function(self)
        self:register("file", function(ctx)
            local path = ctx.file.url
            if is_mmd(path) then
                return preview_mmd(self, path)
            end
        end)
    end,
}

