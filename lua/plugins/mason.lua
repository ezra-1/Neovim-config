local M = {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		"mason-org/mason.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
}

function M.config()
	local servers = {
		"lua_ls",
		"cssls",
		"html",
		"ts_ls",
		"pyright",
		"bashls",
		"jsonls",
		"jdtls",
	}

	local formatters = {
		"stylua",
		"prettier",
		"black",
		"shfmt",
		"nixfmt",
		"google-java-format",
	}

	require("mason").setup({
		ui = {
			border = "rounded",
		},
	})

	require("mason-lspconfig").setup({
		ensure_installed = servers,
	})

	require("mason-tool-installer").setup({
		ensure_installed = formatters,

		auto_update = false,
		run_on_start = true,
		start_delay = 3000,
	})
end

return M
