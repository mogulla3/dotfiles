-- Use <Space> as Leader key (default: '\')
vim.g.mapleader = " "

-- Disables Ex mode && For QuickFix
vim.keymap.set('n', 'Q', '<Nop>', { noremap = true })
vim.keymap.set('n', 'Qn', ':cnext<CR>', { noremap = true })
vim.keymap.set('n', 'Qp', ':cprev<CR>', { noremap = true })
vim.keymap.set('n', 'Ql', ':clist<CR>', { noremap = true })

-- For INSERT mode
vim.keymap.set('i', '<C-n>', '<Down>', { noremap = true })
vim.keymap.set('i', '<C-p>', '<Up>', { noremap = true })
vim.keymap.set('i', '<C-b>', '<Left>', { noremap = true })
vim.keymap.set('i', '<C-f>', '<Right>', { noremap = true })
vim.keymap.set('i', '<C-h>', '<BS>', { noremap = true })
vim.keymap.set('i', '<C-a>', '<C-o>^', { noremap = true })
vim.keymap.set('i', '<C-e>', '<End>', { noremap = true })
vim.keymap.set('i', '<C-k>', '<C-o>D', { noremap = true })
vim.keymap.set('i', '<C-d>', '<Del>', { noremap = true })

-- Delete from the beggining of the line till the cursor
vim.keymap.set('n', '<S-h>', 'd^', { noremap = true })

-- Toggle folding
vim.keymap.set('n', '<leader>F', 'za', { noremap = true })

-- Operate buffers
vim.keymap.set('n', '<C-l>', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-h>', ':bprevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bD', ':BufOnly<CR>', { noremap = true, silent = true })

-- Move lines
-- see: https://qiita.com/itmammoth/items/312246b4b7688875d023
vim.keymap.set('n', '<C-Up>', '"zdd<Up>"zP', { noremap = true })
vim.keymap.set('n', '<C-Down>', '"zdd"zp', { noremap = true })
vim.keymap.set('v', '<C-Up>', '"zx<Up>"zP`[V`]', { noremap = true })
vim.keymap.set('v', '<C-Down>', '"zx"zp`[V`]', { noremap = true })

-- Move jump list
-- * plusとminusを使いたかったが、ASCII standardではない文字のため割り当てられなかった
-- * see: https://vimhelp.org/vim_faq.txt.html#faq-20.5
vim.keymap.set('n', '<leader>n', '<C-I>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>p', '<C-O>', { noremap = true, silent = true })

-- Remove whitespece
vim.keymap.set('n', '<leader>fw', ':FixWhitespace<CR>', { noremap = true })

-- Toggle file explorer (NERDTree)
vim.keymap.set('n', '<C-n>', ':NERDTreeToggle<CR>')

-- Comment in / out (NERD COMMENTER)
vim.keymap.set('n', '<leader>,', '<Plug>NERDCommenterToggle')
vim.keymap.set('v', '<leader>,', '<Plug>NERDCommenterToggle')

-- Search files or buffers (fzf.vim)
-- * type `;f` to search files under git control
-- * type `;a` to search all files
-- * type `;r` to search file contents
vim.keymap.set('n', ';f', ':GFiles<CR>', { noremap = true, silent = true })
vim.keymap.set('n', ';F', ':Buffers<CR>', { noremap = true, silent = true })
vim.keymap.set('n', ';b', ':Buffers<CR>', { noremap = true, silent = true })
vim.keymap.set('n', ';U', ':GUntrackedFiles<CR>', { noremap = true, silent = true })
vim.keymap.set('n', ';a', ':Files<CR>', { noremap = true, silent = true })
vim.keymap.set('n', ';r', ':Rg<CR>', { noremap = true, silent = true })

-- Go to definition/implementation/references (coc.nvim)
vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
vim.keymap.set('n', 'gr', '<Plug>(coc-references)', { silent = true })

-- Fix linter problems (ALE)
vim.keymap.set('n', '<leader>fp', '<Plug>(ale_fix)', { silent = true })

-- " Run tests (test.vim)
vim.keymap.set('n', 'tn', ':TestNearest<CR>', { silent = true })
vim.keymap.set('n', 'tf', ':TestFile<CR>', { silent = true })
vim.keymap.set('n', 'tl', ':TestLast<CR>', { silent = true })
