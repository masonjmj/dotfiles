local colorscheme = "kanagawa"

local ok, result = pcall(require, colorscheme)

if not ok then
	vim.notify("Couldn't load colorscheme " .. colorscheme .. "!", "error")
	return
end

if colorscheme == "onedark" then
	result.setup {
		-- style = "dark",
		-- transparent = true,
		-- lualine = {
		-- 	transparent = false,
		-- },
		--
		colors = {}, -- Override default colors or create your own
		highlights = {}, -- Override default highlight groups or create your own
		filetypes = { -- Override which filetype highlight groups are loaded
			-- See the 'Configuring filetype highlights' section for the available list
		},
		plugins = { -- Override which plugin highlight groups are loaded
			-- See the 'Supported plugins' section for the available list
		},
		styles = { -- For example, to apply bold and italic, use "bold,italic"
			types = "NONE", -- Style that is applied to types
			numbers = "NONE", -- Style that is applied to numbers
			strings = "NONE", -- Style that is applied to strings
			comments = "NONE", -- Style that is applied to comments
			keywords = "NONE", -- Style that is applied to keywords
			constants = "NONE", -- Style that is applied to constants
			functions = "NONE", -- Style that is applied to functions
			operators = "NONE", -- Style that is applied to operators
			variables = "NONE", -- Style that is applied to variables
			conditionals = "NONE", -- Style that is applied to conditionals
			virtual_text = "NONE", -- Style that is applied to virtual text
		},
		options = {
			bold = true, -- Use bold styles?
			italic = true, -- Use italic styles?
			underline = true, -- Use underline styles?
			undercurl = true, -- Use undercurl styles?

			cursorline = false, -- Use cursorline highlighting?
			transparency = false, -- Use a transparent background?
			terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
			highlight_inactive_windows = false, -- When the window is out of focus, change the normal background?
		}
	}

elseif colorscheme == "kanagawa" then
	result.setup {
		undercurl = true, -- enable undercurls
		commentStyle = { italic = true },
		functionStyle = {},
		keywordStyle = { italic = true },
		statementStyle = { bold = true },
		typeStyle = {},
		variablebuiltinStyle = { italic = true },
		specialReturn = true, -- special highlight for the return keyword
		specialException = true, -- special highlight for exception handling keywords
		transparent = false, -- do not set background color
		dimInactive = false, -- dim inactive window `:h hl-NormalNC`
		globalStatus = true, -- adjust window separators highlight for laststatus=3
		terminalColors = true, -- define vim.g.terminal_color_{0,17}
		colors = {},
		overrides = {},
		theme = "default"
	}

elseif colorscheme == "no-clown-fiesta" then
	result.setup {
		transparent = false, -- Enable this to disable the bg color
		styles = {
			-- You can set any of the style values specified for `:h nvim_set_hl`
			comments = {italic = true},
			keywords = {},
			functions = {},
			variables = {},
			type = { bold = true },
		}
	}
end
result.load()
vim.cmd("colorscheme " .. colorscheme)
