return {
	"stevearc/conform.nvim",
	opts = {
		-- 保存時に自動フォーマット
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
		-- Python用のフォーマッター設定（ruffを使用）
		formatters_by_ft = {
			python = { "ruff_format", "ruff_organize_imports" },
		},
	},
}
