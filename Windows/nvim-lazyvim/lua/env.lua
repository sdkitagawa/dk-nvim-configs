return {
    load_env = function(path)
        local file = io.open(path, "r")
        if not file then
            print("Could not open .env file: " .. path)
            return {}
        end

        local env = {}
        for line in file:lines() do
            line = line:gsub("\r", "")
            local key, value = line:match('^([%w_]+)%s*=%s*"(.*)"%s*$')
            if key and value then
                env[key] = value
            end
        end

        file:close()
        return env
    end
}
