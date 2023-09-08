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
  
 require("lazy").setup({
 "navarasu/onedark.nvim",        

 "nvim-lua/plenary.nvim",

-- file explorer
 "nvim-tree/nvim-tree.lua",

-- vs-code like icons
 "nvim-tree/nvim-web-devicons",

-- statusline
 "nvim-lualine/lualine.nvim",

-- Colorizer
 "norcalli/nvim-colorizer.lua",

 "goolord/alpha-nvim",

 "nvim-telescope/telescope.nvim",

 "ahmedkhalf/project.nvim",

 "nvim-treesitter/nvim-treesitter",

 "lukas-reineke/indent-blankline.nvim",

 "RRethy/vim-illuminate",

        -- Snippet 
         "L3MON4D3/LuaSnip", 
         "rafamadriz/friendly-snippets", 
         "mlaursen/vim-react-snippets", 
         "SirVer/ultisnips", 
  
         -- Cmp completion 
         "hrsh7th/cmp-buffer", 
         "hrsh7th/cmp-path", 
         "saadparwaiz1/cmp_luasnip", 
         "hrsh7th/cmp-nvim-lsp", 
         "hrsh7th/cmp-nvim-lua",
         "hrsh7th/nvim-cmp",

            -- Mason 
         "neovim/nvim-lspconfig", 
         "williamboman/mason.nvim", 
         "williamboman/mason-lspconfig.nvim", 
         "jay-babu/mason-null-ls.nvim", 
         "jose-elias-alvarez/null-ls.nvim", 
  
         -- Dapnstall and dapui 
         "rcarriga/nvim-dap-ui", 
         "ravenxrz/DAPInstall.nvim",

})

