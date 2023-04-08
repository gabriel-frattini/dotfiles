local keymap = vim.keymap

keymap.set('n', 'x', '"_x')

keymap.set('n', 'd9', 'd$')
keymap.set('n', 'c9', 'c$')

-- delete buffer
keymap.set('n', 'bd', ':bd<CR>')

-- switch buffers
keymap.set('n','bn',':bn<CR>')
keymap.set('n','bp',':bp<CR>')

-- navigate quickfix window
keymap.set('n', 'cc', ':ccl<CR>')
keymap.set('n', 'co', ':copen<CR>')

-- native file explorer
keymap.set('n', ';ef', ':Explore<Return><Esc>')

-- exit insert mode with Ctrl+z
keymap.set('i', 'kj', '<Esc>')

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
keymap.set('n', 'sx', ':split<Return><C-w>w')
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
keymap.set('', 'ht', ':set hlsearch!<CR>')

keymap.set('n', 'Uf', ':UndotreeFocus<CR>')
keymap.set('n', 'Ut', ':UndotreeToggle<CR>')
