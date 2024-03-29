local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
     return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
     defaults = {
          mappings = {
               n = {
                    ["q"] = actions.close
               },
          },
          file_ignore_patterns = { "node_modules", "package-lock.json", "yarn-lock.json", "*-lock.json",
               "__pycache__",
               "venv",
               "htmlcov", ".mypy_cache", ".tox", ".cache", ".m2", ".class" },
     },
     extensions = {
          file_browser = {
               theme = "dropdown",
               -- disables netrw and use telescope-file-browser in its place
               hijack_netrw = true,
               mappings = {
                    -- your custom insert mode mappings
                    ["i"] = {
                         ["<C-w>"] = function() vim.cmd('normal vbd') end,
                    },
                    ["n"] = {
                         -- your custom normal mode mappings
                         ["R"] = fb_actions.rename,
                         ["N"] = fb_actions.create,
                         ["h"] = fb_actions.goto_parent_dir,
                         ["D"] = fb_actions.remove,
                         ["P"] = fb_actions.create_from_prompt,
                         ["/"] = function()
                              vim.cmd('startinsert')
                         end
                    },
               },
          },
     },
}

telescope.load_extension("file_browser")

vim.keymap.set('n', ';f',
     function()
          builtin.find_files({
               no_ignore = true,
               hidden = true
          })
     end)
vim.keymap.set('n', ';r', function()
     builtin.live_grep()
end)
vim.keymap.set('n', ';s', function()
     builtin.grep_string()
end)
vim.keymap.set('n', ';gc', function()
     builtin.git_commits()
end)
vim.keymap.set('n', ';gb', function()
     builtin.git_bcommits()
end)
vim.keymap.set('n', 'bs', function()
     builtin.buffers()
end)
vim.keymap.set('n', ';t', function()
     builtin.help_tags()
end)
vim.keymap.set('n', ';;', function()
     builtin.resume()
end)
vim.keymap.set('n', ';e', function()
     builtin.diagnostics()
end)
vim.keymap.set("n", "sf", function()
     telescope.extensions.file_browser.file_browser({
          path = "%:p:h",
          cwd = telescope_buffer_dir(),
          respect_gitignore = false,
          hidden = true,
          grouped = true,
          previewer = false,
          initial_mode = "normal",
          layout_config = { height = 40 }
     })
     vim.keymap.set("n", "ss", function()
     end)
end)
