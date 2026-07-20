local keymap = vim.keymap

keymap.set("n", "<esc>", vim.cmd.noh, { desc = "clear search highlight" })

keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
keymap.set({ "n", "x" }, "<down>", "v:count == 0 ? 'gj' : 'j'", { expr = true })
keymap.set({ "n", "x" }, "<up>", "v:count == 0 ? 'gk' : 'k'", { expr = true })

keymap.set({ "n" }, "<leader>ss", "<Cmd>split<CR>", { desc = "Split window horizontally" })
keymap.set({ "n" }, "<leader>sv", "<Cmd>vsplit<CR>", { desc = "Split window vertically" })
keymap.set("v", "<Tab>", ">gv", { desc = "Increase indent" })
keymap.set("v", "<S-Tab>", "<gv", { desc = "Decrease indent" })
