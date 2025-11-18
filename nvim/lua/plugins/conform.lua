return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" }, -- Conform will run multiple formatters sequentially
				-- You can customize some of the format options for the filetype (:help conform.format)
				rust = { "rustfmt", lsp_format = "fallback" },
				-- Conform will run the first available formatter
				javascript = { "prettier", stop_after_first = true },

				c = { "clang-format" },
			},
		},
	},
}
