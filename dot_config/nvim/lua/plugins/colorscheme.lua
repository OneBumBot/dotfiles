return {
	{
		"ellisonleao/gruvbox.nvim", 
		priority = 1000, 
		config = true, 
		opts = ...,
		config = function(_, opts)
			require("gruvbox").setup(opts)
			vim.o.background = "dark"
			vim.cmd.colorscheme("gruvbox")
		end,
	}
}

