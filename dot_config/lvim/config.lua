--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "n"

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = false

-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  pattern = "*.lua",
  timeout = 1000,
}
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- lvim.keys.normal_mode["<leader>`"] = ":lua vim.diagnostic.hide()<CR>"
lvim.keys.normal_mode["<leader>`"] = ":lua vim.diagnostic.disable()<CR>"
-- lvim.keys.normal_mode["<leader>1"] = ":lua vim.diagnostic.show()<CR>"
lvim.keys.normal_mode["<leader>1"] = ":lua vim.diagnostic.enable()<CR>"
lvim.keys.normal_mode["<leader>2"] = ":set nonu<CR> :set signcolumn=no<CR> :IndentBlanklineToggle<CR>"
lvim.keys.normal_mode["<leader>3"] = ":set nu<CR> :set signcolumn=yes<CR> :IndentBlanklineToggle<CR>"
lvim.keys.normal_mode["<leader>o"] = ":SymbolsOutline<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- -- Change theme settings
-- lvim.colorscheme = "lunar"
lvim.colorscheme = "carbonfox"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.nvimtree.setup.view.adaptive_size = true

-- Automatically install missing parsers when entering buffer
--lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.auto_install = true

lvim.builtin.treesitter.highlight.enable = true

lvim.builtin.bufferline.options.always_show_bufferline = true
lvim.builtin.bufferline.options.max_name_length = 28
lvim.builtin.bufferline.options.max_prefix_length = 25
lvim.builtin.bufferline.options.hover.delay = true
lvim.builtin.bufferline.options.diagnostics_indicator = false

--lvim.builtin.bufferline.highlights.buffer_visible.fg = "#f2f4f8"
--lvim.builtin.bufferline.highlights.buffer_visible.bg = "#486599"
lvim.builtin.bufferline.highlights.buffer_visible.fg = "#ffa61a"
lvim.builtin.bufferline.highlights.buffer_visible.bg = "#0c0c0c"
lvim.builtin.bufferline.highlights.background.fg = "#25be6a"

--lvim.builtin.bufferline.highlights.buffer_selected.fg = "#f2f4f8"
--lvim.builtin.bufferline.highlights.buffer_selected.bg = "#486599"
lvim.builtin.bufferline.highlights.buffer_selected.fg = "#0c0c0c"
lvim.builtin.bufferline.highlights.buffer_selected.bg = "#ffa61a"

--lvim.builtin.bufferline.highlights.duplicate_selected.fg = "#f2f4f8"
--lvim.builtin.bufferline.highlights.duplicate_selected.bg = "#486599"
lvim.builtin.bufferline.highlights.duplicate_selected.fg = "#ffa61a"
lvim.builtin.bufferline.highlights.duplicate_selected.bg = "#0c0c0c"
lvim.builtin.bufferline.highlights.duplicate_selected.bold = false


lvim.builtin.bufferline.options.sort_by = "insert_at_end"

lvim.builtin.project.manual_mode = true

-- -- always installed on startup, useful for parsers without a strict filetype
-- lvim.builtin.treesitter.ensure_installed = { "comment", "markdown_inline", "regex" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)
require("lvim.lsp.manager").setup("marksman")

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "stylua" },
--   {
--     command = "prettier",
--     extra_args = { "--print-width", "100" },
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
-- }

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
-- lvim.plugins = {
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
-- }
-- Additional Plugins
lvim.plugins = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "EdenEast/nightfox.nvim",
    config = function()
      require('nightfox').setup {
        options = {
          styles = {
            strings = "NONE",
          },
        },
      }
    end
  },
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit"
    },
    ft = { "fugitive" }
  },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require('symbols-outline').setup({
        symbols = {
          File = { hl = "@text.uri" },
          Module = { hl = "@namespace" },
          Namespace = { hl = "@namespace" },
          Package = { hl = "@namespace" },
          Class = { hl = "@type" },
          Method = { hl = "@method" },
          Property = { hl = "@method" },
          Field = { hl = "@field" },
          Constructor = { hl = "@constructor" },
          Enum = { hl = "@type" },
          Interface = { hl = "@type" },
          Function = { hl = "@function" },
          Variable = { hl = "@constant" },
          Constant = { hl = "@constant" },
          String = { hl = "@string" },
          Number = { hl = "@number" },
          Boolean = { hl = "@boolean" },
          Array = { hl = "@constant" },
          Object = { hl = "@type" },
          Key = { hl = "@type" },
          Null = { hl = "@type" },
          EnumMember = { hl = "@field" },
          Struct = { hl = "@type" },
          Event = { hl = "@type" },
          Operator = { hl = "@operator" },
          TypeParameter = { hl = "@parameter" },
        }
      })
    end
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
  {
    "npxbr/glow.nvim",
    ft = { "markdown" }
    -- build = "yay -S glow"
  },
}

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "Outline",
--   command = "setlocal signcolumn=no"
--})
