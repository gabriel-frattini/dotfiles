local keymap = vim.keymap

keymap.set('n', 'x', '"_x')

-- exit insert mode with capslock
keymap.set('i', '<C-^>', '<Esc>')

-- stay in indent mode
keymap.set('v', '>', '>gv')
keymap.set('v', '<', '<gv')

-- move text up and down
keymap.set('n', '<C-l>', ':m .+1<CR>==')
keymap.set('n', '<C-k>', ':m .-2<CR>==')

-- keep paste mode
keymap.set('v', 'p', '"_dP')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set('n', 'te', ':tabedit')
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- toggle highligt search
keymap.set('', 'hT', ':set hlsearch!<CR>')
