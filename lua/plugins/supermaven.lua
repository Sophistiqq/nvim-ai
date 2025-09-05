return {
  {
    "supermaven-inc/supermaven-nvim",
    event = "BufRead",
    config = function()
      require("supermaven-nvim").setup({
        disable_inline_completion = false, -- disables inline completion for use with cmp
        disable_keymaps = false,           -- disables built in keymaps for more manual control
        keymaps = {
          -- using alt + enter
          -- accept_suggestion = "<M-Tab>",
          accept_suggestion = "<A-CR>",
        },
      })
    end,
  },
}
