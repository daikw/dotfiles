local ok, ibl = pcall(require, "ibl")
if not ok then
	return
end

ibl.setup({
	scope = {
		enabled = true,
		show_start = true,
		show_end = false,
	},
})
