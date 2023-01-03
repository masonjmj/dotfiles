local ok, illuminate = pcall(require, "illuminate")
if not ok then
	vim.notify("Illuminate couldn't be installed", "error")
	return
end

illuminate.configure {
	filetypes_denylist = {
		"dirvish",
		"fugitive",
		"alpha",
		"NvimTree",
		"packer",
		"neogitstatus",
		"Trouble",
		"lir",
		"Outline",
		"spectre_panel",
		"toggleterm",
		"DressingSelect",
		"TelescopePrompt",
	},
}
