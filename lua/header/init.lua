local M = {}

function CreateFiles()
    CheckIfFolderExists()
    local input = vim.fn.input("Header: ")
    -- Create file in includes
    local header = io.open("includes/" .. input .. ".h", "w")

    -- Create file in src
    local src = io.open("src/" .. input .. ".c", "w")

    if header == nil or src == nil then
        print("Error creating files")
        return
    end

    -- Write header file
    header:write("#ifndef " .. input:upper() .. "_H\n")
    header:write("#define " .. input:upper() .. "_H\n\n")
    header:write("#endif\n")
end

function CheckIfFolderExists()
    -- check if the inlcudes folder exists
    if vim.fn.isdirectory("includes") == 0 then
        vim.fn.mkdir("includes")
    end

    -- check if the src folder exists
    if vim.fn.isdirectory("src") == 0 then
        vim.fn.mkdir("src")
    end
end

M.create = function()
    CreateFiles()
end

return M
