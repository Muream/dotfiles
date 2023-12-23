if vim.fn.has("Windows_NT") then
    -- Ruff fails to install because it is confused by pyenv's shims
    -- We need to explicitely point to them
    vim.g.python_host_prog = "C:/Users/muream/.pyenv/pyenv-win/shims/python.bat"
    vim.g.python3_host_prog = "C:/Users/muream/.pyenv/pyenv-win/shims/python3.bat"
end

require("muream")
