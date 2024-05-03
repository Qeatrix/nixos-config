local npairs = require('nvim-autopairs')
npairs.setup {}
_G.cmp_npairs_cr = function ()
  return npairs.autopairs_cr()
end

vim.api.nvim_set_keymap("i", "<cr>", "v:lua.cmp_npairs_cr()", {expr = true, noremap = true})
