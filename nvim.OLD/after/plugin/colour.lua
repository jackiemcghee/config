function ColourUp(color)
	colour = colour or "github-dimmed"
	vim.cmd.colorscheme(colour)

	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColourUp()
