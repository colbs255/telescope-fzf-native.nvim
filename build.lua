local uv = vim.loop

-- Create a handle for executing the make command
local handle,pid = uv.spawn("make", { cwd = vim.fn.getcwd() }, function(code, signal)
    if code ~= 0 then
        vim.schedule(function()
            vim.api.nvim_err_writeln("Unable to build telescope-fzf-native: " .. code)
        end)
    end
end)
