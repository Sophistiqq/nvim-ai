-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "material-deep-ocean",
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    Variable = { bold = true },
    ["@variable"] = { bold = true },
  },
  termguicolors = true,
  -- transparency = true,
}

-- M.nvdash = { load_on_startup = true }

M.term = {
  sizes = { sp = 0.2, float = 0.8, vsplit = 0.2 },
}
return M
