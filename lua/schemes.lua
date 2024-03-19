M = {}

function M.ColorThem(config)
	if config == nil then
		config = {}
	end

	if not config.name or config.name == "" then
		config.name = "tokyodark"
	end

	local elements = {} -- store value for config.alpha_sec
	local sections = {} -- returned value is based on value of this

	if not config.alpha_enable then
		config.alpha_enable = false
	else
		elements = {
			all = {
				'Normal',
				'NormalFloat',
				'SignColumn',
				'WhichKeyFloat',
				'VertSplit',
				'TabLineSel',
				'FoldColumn',
				'Folded',
				'EndOfBuffer',
				'LineNr',
				'CursorLineNr',
			},

			basic = {
				'Normal',
				'NormalFloat',
			},

			cols = {
				'Normal',
				'NormalFloat',
				'SignColumn',
				'WhichKeyFloat',
				'VertSplit',
				'TabLineSel',
			},

			folds = {
				'Normal',
				'NormalFloat',
				'SignColumn',
				'WhichKeyFloat',
				'VertSplit',
				'TabLineSel',
				'FoldColumn',
				'Folded',
				'EndOfBuffer',
			},
		}
	end

	if not config.alpha_sec or config.alpha_sec == "" then
		sections = elements.basic
	else
		sections = elements[config.alpha_sec]
	end

	local alpha_enable = config.alpha_enable or 1
	local color = config.name or 'tokyodark'

	vim.cmd.colorscheme(color)

	if alpha_enable == true then
		for i = 1, #sections do
			vim.api.nvim_set_hl(0, sections[i], {bg = 'none'})
		end

		-- colorscheme
		vim.api.nvim_set_hl(0, "StatusLine", {bg = '#121212', fg = '#ccccce'})
		vim.api.nvim_set_hl(0, "StatusLineNC", {bg = '#777777', fg = '#121212'})
	end
end

return M
