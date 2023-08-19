---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>sv"] = { "<C-w>v", "split window vertically", opts = { nowait = true } },
    ["<leader>sh"] = { "<C-w>s", "split window horizontally", opts = { nowait = true } },
    ["<leader>se"] = { "<C-w>=", "make split window equal width and height", opts = { nowait = true } },
  },
  v = {
    ["<S-j>"] = { ":m '>+1<CR>gv-gv", "option move down", opts = { nowait = true } },
    ["<S-k>"] = { ":m '<-2<CR>gv-gv", "option move up", opts = { nowait = true } },
  },
}

M.disabled = {
  -- disableed toggle in terminal mode original keybinds
  t = {
    ["<A-i>"] = "",
    ["<A-h>"] = "",
    ["<A-v>"] = "",
  },
  n = {
    ["<A-i>"] = "",
    ["<A-h>"] = "",
    ["<A-v>"] = "",
  },
}

-- more keybinds!
M.transparency = {
  n = {
    ["<leader>tt"] = {
      function()
        require("base46").toggle_transparency()
      end,
      "toggle transparency",
    },
  },
}

M.nvterm = {
  plugin = true,

  t = {
    -- toggle in terminal mode
    ["<leader>tf"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    ["<leader>t-"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<leader>t\\"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },
  },

  n = {
    -- toggle in normal mode
    ["<leader>tf"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    ["<leader>t-"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<leader>t\\"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },

    -- new
    ["<leader>h"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "New horizontal term",
    },

    ["<leader>v"] = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      "New vertical term",
    },
  },
}

-- lazygit toggle
M.lazygit = {
  n = {
    ["<leader>gl"] = {":LazyGit<CR>",
      "toggle lazygit",
    },
  },
}

return M
