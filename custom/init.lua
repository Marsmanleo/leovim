-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

local opt = vim.opt
local cmd = vim.cmd
local g = vim.g
local api = vim.api
local o = vim.o

-------------------------------------- globals -----------------------------------------

-- auto less compile
cmd [[
  autocmd!
  autocmd FileWritePost,BufWritePost *.less let cwd = expand('<afile>:p:h') | let name = expand('<afile>:t:r') | if (executable('lessc')) | cal system('lessc '.cwd.'/'.name.'.less > '.cwd.'/'.name.'.css &') | endif
]]

-- loops from 1-9 tab
for i = 1, 9, 1 do
  vim.keymap.set("n", string.format("<leader>%s", i), function()
    api.nvim_set_current_buf(vim.t.bufs[i])
  end)
end

-- show only modified buffers
api.nvim_create_autocmd({ "BufAdd", "BufEnter", "tabnew" }, {
  callback = function()
    vim.t.bufs = vim.tbl_filter(function(bufnr)
      return vim.api.nvim_buf_get_option(bufnr, "modified")
    end, vim.t.bufs)
  end,
})

-------------------------------------- options -----------------------------------------

-- Numbers
opt.relativenumber = true
opt.smartindent = true

-------------------------------------- plugins-----------------------------------------

-- code folding
opt.foldlevel = 20
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
