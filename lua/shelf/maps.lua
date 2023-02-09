vim.g.mapleader = "," -- Map leader key to be ,
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex) -- To open file explorer

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Move selected text down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- Move selected text up

vim.keymap.set("n", "J", "mzJ`z") -- Append below line to the end of the current line without changing the cursor position
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Half page jump down
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- Half page jump up
vim.keymap.set("n", "n", "nzzzv") -- Keep the cursor in the middle in case of searching next
vim.keymap.set("n", "N", "Nzzzv") -- Keep the cursor in the middle in case of searching previous

-- greatest remap ever, delete highlighted word without coping it to the buffer and paset your current buffer.
-- Basically this is for keeping your buffer after pasing on slected word
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format) -- Format code

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- Replace current word in all the file
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }) -- Make current file excutable

vim.keymap.set("n", "<C-b>", "<cmd>:NvimTreeToggle<CR>")

-- Close current buffer
--vim.keymap.set("n", "<C-w>", "<cmd>:bdelete<CR>")

-- Save current buffer
vim.keymap.set("n", "<C-s>", "<cmd>:w<CR>", { silent = true })

-- Cut & Delete lines => <leader> + d will cut | but d will just delte
vim.keymap.set("n", "dd", "\"_dd") -- dd will just delete without coping to buffer
vim.keymap.set("n", "<leader>dd", "\"+dd") -- will cut
vim.keymap.set("v", "d", "\"_dd") -- dd will just delete without coping to buffer
vim.keymap.set("v", "x", "\"+dd") -- dd cut
vim.keymap.set("v", "<leader>d", "dd") -- will cut

-- bufferline mapgin
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>") -- Tab navigate to next tab
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>") -- Shift + Tab navigate to previous tab

-- copy to global clipboard -- XClip
vim.keymap.set("n", "p", "\"+p")
vim.keymap.set("v", "p", "\"+p")
vim.keymap.set("n", "P", "\"+P")
vim.keymap.set("v", "P", "\"+P")

vim.keymap.set("n", "yy", "\"+yy")
vim.keymap.set("n", "Y", "\"+y$")

vim.keymap.set("v", "y", "\"+y")

vim.keymap.set("n", "yi{", "\"+yi{")
vim.keymap.set("n", "yiw", "\"+yiw")
vim.keymap.set("n", "yi<", "\"+yi<")
vim.keymap.set("n", "yi(", "\"+yi(")
vim.keymap.set("n", "yi'", "\"+yi'")
vim.keymap.set("n", "yi\"", "\"+yi\"")

-- Folding
vim.keymap.set("n", "<C-]>", "zfa}")
vim.keymap.set("n", "<C-[>", "zo")

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")
vim.keymap.set("v", "<C-a>", "gg<S-v>G")

-- Spliting
-- vim.keymap.set("n", "sv", ":vsplit<CR>")
-- vim.keymap.set("n", "sh", ":split<CR>")
vim.keymap.set('n', "<C-c>", "<cmd>:q<CR>")
-- New tab
vim.keymap.set('n', 'te', ':tabedit<Return>')
-- Split window
vim.keymap.set('n', 'ss', ':split<Return><C-w>w')
vim.keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- Move window
vim.keymap.set('n', '<Space>', '<C-w>w')
vim.keymap.set('', '<C-h>', '<C-w>h')
vim.keymap.set('', '<C-k>', '<C-w>k')
vim.keymap.set('', '<C-j>', '<C-w>j')
vim.keymap.set('', '<C-l>', '<C-w>l')

-- Resize window
vim.keymap.set('n', '<C-left>', '<C-w>5>')
vim.keymap.set('n', '<C-right>', '<C-w>5<')
vim.keymap.set('n', '<C-up>', '<C-w>5+')
vim.keymap.set('n', '<C-down>', '<C-w>5-')
