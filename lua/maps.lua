local keymap = vim.keymap

keymap.set('n', 'x', '"_x')

-- add brackets around word and put me in insert mode
keymap.set('n', 'ö', 'Bi[<esc>ea]<esc>Bi')

-- remove brackets around word
keymap.set('n', 'Ö', 'xExB')

-- exit insert mode with Ctrl+z
keymap.set('i', '<C-z>', '<Esc>')

-- stay in indent mode
keymap.set('v', '>', '>gv')
keymap.set('v', '<', '<gv')

-- move text up and down
keymap.set('n', '<C-l>', ':m .+1<CR>==')
keymap.set('n', '<C-k>', ':m .-2<CR>==')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set('n', 'te', ':tabedit')
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- Move window
keymap.set('n', '<Space>', '<C-w>W')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Navigate buffers
keymap.set('n', '<C-p>', ':bp<CR>')
--keymap.set('n', '<C-b>', ':bn<CR>')

-- toggle highligt search
keymap.set('', 'hT', ':set hlsearch!<CR>')
