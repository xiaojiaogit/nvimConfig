-- 前置
-- win的配置文件是_vimrc 在vim安装目录下配置，linux的配置文件在家目录下~/.vim/vimrc下配置。
-- vimtutor官方教程。
-- 读取系统命令的返回内容：:r !ls ，执行此命令就会将命令的返回结果输入到光标所在行。
-- 键盘宏：q开启 a-z将宏录制到那个键位上 q退出录制 @a-z调用录制好的宏
-- c i w 删除一个单词并进入写入模式,c i " 删除指定符号内的东西并进入写入模式。
-- f a-z 光标跳转到指定字符下一次出现的地方。
-- 可视块批量操作 v :normal 头：xxx ，尾：A.xxx
-- 打开文件 :e 文件路径


-- 基础设置
  -- leader键 全局变量
vim.g.mapleader = " "
  -- 行号
vim.o.number = true
vim.o.relativenumber = true
  -- 制表符距离
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.showtabline = 2
  -- 自定义主题颜色
vim.o.termguicolors = true
  -- 高亮光标所在行
vim.o.cursorline = true
  -- 启用鼠标
vim.opt.mouse:append("a")
  -- 系统剪贴板
vim.opt.clipboard:append("unnamedplus")
  -- 默认窗口右和下
vim.opt.splitright = true
vim.opt.splitbelow = true
 -- 左侧多一列
vim.opt.signcolumn = 'yes'
-- 关闭文件备份
vim.opt.backup = false
-- 搜索结果高亮,n是下一个 N是上一个。
vim.opt.hlsearch = true
-- 实时高亮
vim.opt.incsearch = true
-- 搜索时忽略大小写
vim.opt.ignorecase = true
-- 搜索时智能识别大小写
vim.opt.smartcase = true
-- 文件格式
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
-- 设置当文件变化时，自动读取新文件
vim.opt.autoread = true
-- 设置保存命令的行数
vim.o.history = 700
-- 切换文件格式
vim.o.ff = unix -- win是dos,一个是以\n结尾,一个是以\r\n结尾。
-- 显示输入的命令，按q:就可以调出历史命令。
vim.o.showcmd = true
-- 命令补全，列出可选项
vim.o.wildmenu = true






--require("test")
-- 键映射：模式、改为什么键、要改的键
-- 替换ESC键为kj
vim.keymap.set('i', 'kj', '<ESC>')
-- 单行或多行移动
vim.keymap.set('v','J',":m '>+1<CR>gv=gv")
vim.keymap.set('v','K',":m '>-2<CR>gv=gv")
-- 拆分窗口
vim.keymap.set('n','<leader>cv','<C-w>v') -- 水平
vim.keymap.set('n','<leader>cs','<C-w>s') -- 垂直
-- 调整分屏大小,ctrl-hjkl切换屏幕
vim.keymap.set('n', '<up>', ':res -5<CR>')
vim.keymap.set('n', '<down>', ':res +5<CR>')
vim.keymap.set('n', '<left>', ':vertical resize +5<CR>')
vim.keymap.set('n', '<right>', ':vertical resize -5<CR>')
-- 切换分屏方向
vim.keymap.set('n','th', '<C-w>t<C-w>H')
vim.keymap.set('n','tk', '<C-w>t<C-w>K')
-- 创建标签
vim.keymap.set('n','tt', ':tabe<CR>')
-- 切换buffer
vim.keymap.set('n','<leader><leader>', ':bnext<CR>')
-- vim.keymap.set('n','<right>', ':bprevious<CR>')
-- 取消高亮
vim.keymap.set('n','<leader><CR>',':nohl<CR>')
-- 打开目录树
vim.keymap.set('n','<leader>t',':NvimTreeToggle<CR>')
-- 保存、退出、重载配置文件
vim.keymap.set('n', 'W', ':w<CR>')
vim.keymap.set('n', 'Q', ':q<CR>')
vim.keymap.set('n', 'R', ':source %<CR>')
-- 加速移动
vim.keymap.set('n', 'K', '6k')
vim.keymap.set('n', 'J', '6j')




-- 初始化包管理器lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 安装、配置插件
require("lazy").setup({
  --   {
  --       "NTBBloodbath/doom-one.nvim", -- 主题配色
  --       setup = function()
  --       -- Add color to cursor
		-- vim.g.doom_one_cursor_coloring = false
		-- -- Set :terminal colors
		-- vim.g.doom_one_terminal_colors = true
		-- -- Enable italic comments
		-- vim.g.doom_one_italic_comments = false
		-- -- Enable TS support
		-- vim.g.doom_one_enable_treesitter = true
		-- -- Color whole diagnostic text or only underline
  --       vim.g.doom_one_diagnostics_text_color = false
		-- -- Enable transparent background
		-- vim.g.doom_one_transparent_background = false
		--
  --       -- Pumblend transparency
		-- vim.g.doom_one_pumblend_enable = false
		-- vim.g.doom_one_pumblend_transparency = 20
		--
  --       -- Plugins integration
		-- vim.g.doom_one_plugin_neorg = true
		-- vim.g.doom_one_plugin_barbar = false
		-- vim.g.doom_one_plugin_telescope = false
		-- vim.g.doom_one_plugin_neogit = true
		-- vim.g.doom_one_plugin_nvim_tree = true
		-- vim.g.doom_one_plugin_dashboard = true
		-- vim.g.doom_one_plugin_startify = true
		-- vim.g.doom_one_plugin_whichkey = true
		-- vim.g.doom_one_plugin_indent_blankline = true
		-- vim.g.doom_one_plugin_vim_illuminate = true
		-- vim.g.doom_one_plugin_lspsaga = false
  --   	end,
  --   	config = function()
  --           vim.cmd("colorscheme doom-one")
  --       end,
  --   },
    {
        'connorholyday/vim-snazzy',
        config = function()
            vim.cmd[[colorscheme snazzy]]         
        end
    },
    {
        'vim-airline/vim-airline',
    },
    -- {
    --     'folke/tokyonight.nvim', -- 主题
    --     config = function()
    --         vim.cmd[[colorscheme tokyonight-day]] -- day、moon、night、storm
    --     end
    -- },
	-- {
	-- 	"nvim-lualine/lualine.nvim", -- 修改状态栏
	-- 	dependencies = { 'nvim-tree/nvim-web-devicons' }, -- lualine依赖的插件
	-- 	config = function() 
	-- 		require('lualine').setup{
 --                options = {
 --                    theme = 'tokyonight'
 --                }
 --            }
	-- 	end,
	-- },
	{
		"akinsho/bufferline.nvim", -- buffer样式
		config = function() 
            require('bufferline').setup{}
		end,
	},
    {
        'nvim-tree/nvim-tree.lua', -- 目录树
		dependencies = { 'nvim-tree/nvim-web-devicons' }, -- lualine依赖的插件
        config = function()
		    require('nvim-tree').setup()
        end,
    },
    {  -- 窗口切换
        'christoomey/vim-tmux-navigator' -- 使用ctrl-hjkl来定位窗口
    },
    -- {
    --     'nvim-tree/nvim-web-devicons', -- 文件图标
    --     config = function()
	   --      require('nvim-web-devicons').setup()
    --     end,
    -- },
    {
        'goolord/alpha-nvim', -- 欢迎屏幕
         dependencies= { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.startify'.config)
            -- require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end,
    },
    {
        "neovim/nvim-lspconfig", -- Lsp各种语言的支持
        dependencies = {
            'neovim/nvim-lspconfig', -- Collection of configurations for built-in LSP client
            'hrsh7th/nvim-cmp', -- Autocompletion plugin
            'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp自动补全的数据源
            'L3MON4D3/LuaSnip', -- Snippets plugin创建个人的补全脚本
            'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp和cmp结合的插件
        },
        config = function()
            -- Add additional capabilities supported by nvim-cmp
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require('lspconfig')

            -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
            local servers = { 'gopls','pyright', 'tsserver' }
            for _, lsp in ipairs(servers) do
              lspconfig[lsp].setup {
                -- on_attach = my_custom_on_attach,
                capabilities = capabilities,
              }
            end

            -- luasnip setup
            local luasnip = require 'luasnip'

            -- nvim-cmp setup
            local cmp = require 'cmp'
            cmp.setup {
              snippet = {
                expand = function(args)
                  luasnip.lsp_expand(args.body)
                end,
              },
              mapping = cmp.mapping.preset.insert({
                ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
                ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
                -- C-b (back) C-f (forward) for snippet placeholder navigation.
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<CR>'] = cmp.mapping.confirm {
                  behavior = cmp.ConfirmBehavior.Replace,
                  select = true,
                },
                ['<Tab>'] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                    cmp.select_next_item()
                  elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                  else
                    fallback()
                  end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                 if cmp.visible() then
                   cmp.select_prev_item()
                  elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                  else
                    fallback()
                 end
                end, { 'i', 's' }),
              }),
              sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
              },
            }
        end,
    },
    {
        'toppair/peek.nvim', -- markdown
        ft = 'markdown',
        config = function()
            require("peek").setup({
                auto_load = true, -- whether to automatically load preview when
                -- entering another markdown buffer
                close_on_bdelete = true, -- close preview window on buffer delete
                syntax = true, -- enable syntax highlighting, affects performance
                theme = "dark", -- 'dark' or 'light'
                update_on_change = true,
                -- relevant if update_on_change is true
                throttle_at = 200000, -- start throttling when file exceeds this
                -- amount of bytes in size
                throttle_time = "auto", -- minimum amount of time in milliseconds
                -- that has to pass before starting new render
            })
            vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
            vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
        end,
        build = "deno task --quiet build:fast"
    },
    {
        "nvim-telescope/telescope.nvim", -- 搜索
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
            defaults = {
                path_display = { "smart" },
            },
        },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        end
    },
    {
        'numToStr/Comment.nvim', -- 注释插件 gcc单行注释 gc多方注释
        config = function()
		    require('Comment').setup{}
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter', -- 代码高亮
        opts = function(_, opts)
          opts.matchup = { enable = true }
          if type(opts.ensure_installed) == "table" then
            vim.list_extend(opts.ensure_installed, {
                "bash",
                "c",
                "vim",
                "sql",
                "help",
                "json",
                "cmake",
                "cpp",
                "css",
                "go",
                "html",
                "java",
                "json5",
                "jsonc",
                "kotlin",
                "rust",
                "scheme",
                "scss",
                "svelte",
                "typescript",
                "vue",
                "javascript",
                "lua",
                "python"
            })
          end	
        end,
       dependencies = {
          "andymass/vim-matchup",
       },
    },
    {
        "windwp/nvim-autopairs", -- 自动补全括号
        config = function() 
            require("nvim-autopairs").setup{} 
        end
    },
    {
        'lewis6991/gitsigns.nvim', -- 左侧git提示
        config = function()
            require('gitsigns').setup{
                signs = {
                    add = {text = '+'},
                    change = {text = '~'},
                    delete = {text = '_'},
                    topdelete = {text = '-'},
                    changedlete = {text = '~'},
                }
            }
        end,
    },

  
})


