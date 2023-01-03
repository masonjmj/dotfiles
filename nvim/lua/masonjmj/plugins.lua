local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({ function(use)
	use 'wbthomason/packer.nvim'
	use 'lewis6991/impatient.nvim'

	-- My plugins here
	-- Colour Schemes
	-- use 'navarasu/onedark.nvim'
	use { 'olimorris/onedarkpro.nvim', as = 'onedark' }
	use 'rebelot/kanagawa.nvim'
	use 'aktersnurra/no-clown-fiesta.nvim'

	use 'nvim-lua/plenary.nvim'
	use 'mbbill/undotree'

	use {
		'nvim-lualine/lualine.nvim',
	}

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}

	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
	}

	use {
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup {}
		end
	}

	use "williamboman/mason.nvim"
	use "williamboman/mason-lspconfig.nvim"
	use "neovim/nvim-lspconfig"

	use "L3MON4D3/LuaSnip"
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-nvim-lua"
	use "saadparwaiz1/cmp_luasnip"
	use "onsails/lspkind.nvim"

	use "lewis6991/gitsigns.nvim"
	use "numToStr/Comment.nvim"
	use "RRethy/vim-illuminate"
	use "lukas-reineke/indent-blankline.nvim"

	use { 'rcarriga/nvim-notify', config = function()
		vim.notify = require("notify")
	end
	}
	use 'stevearc/dressing.nvim'


	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end,
	config = {
		display = {
			open_fn = function()
				return require('packer.util').float({ border = 'rounded' })
			end
		}
	}
}
)
