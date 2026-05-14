-- ~/.config/nvim/lua/plugins/mason_tool_installer.lua
-- C:/Users/user_name/AppData/Local/nvim/lua/plugins/mason_tool_installer.lua
-- Mason LSPs, Formatters, Linters and DAPs
return {
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = {
            "mason-org/mason.nvim",
        },
        lazy = false,
        config = function()
            local mason_tool_installer = require("mason-tool-installer")

            mason_tool_installer.setup({
                ensure_installed = {
                    -- LSP servers
                    "arduino-language-server",
                    "clangd",
                    "cmake-language-server",
                    "cobol-language-support",
                    "copilot-language-server",
                    "css-lsp",
                    "css-variables-language-server",
                    "cssmodules-language-server",
                    "django-template-lsp",
                    "docker-compose-language-service",
                    "docker-language-server",
                    "dockerfile-language-server",
                    "kotlin-language-server",
                    "laravel-ls",
                    "lua-language-server",
                    "postgres-language-server",
                    "python-lsp-server",
                    "terraform-ls",
                    "typescript-language-server",
                    "vim-language-server",
                    "yaml-language-server",

                    -- Formatters
                    "asmfmt",
                    "djlint",
                    "jq",
                    "json-repair",
                    "markdown-toc",
                    "prettier",
                    "pretty-php",
                    "prettydiff",
                    "stylua",
                    "yamlfmt",

                    -- Linters
                    "cmakelang",
                    "cmakelint",
                    "codespell",
                    "cpplint",
                    "dotenv-linter",
                    "eslint_d",
                    "gitlint",
                    "htmlhint",
                    "jsonlint",
                    "ktlint",
                    "markdownlint",
                    "phpcs",
                    "phpmd",
                    "phpstan",
                    "pylint",
                    "shellcheck",
                    "sqlfluff",
                    "standardjs",
                    "stylelint",
                    "stylelint-lsp",
                    "textlint",
                    "ts-standard",
                    "yamllint",

                    -- DAPs
                    "cpptools",
                    "go-debug-adapter",
                    "java-debug-adapter",
                    "java-test",
                    "js-debug-adapter",
                    "kotlin-debug-adapter",
                    "local-lua-debugger-vscode",
                    "perl-debug-adapter",
                    "php-debug-adapter",
                },
                run_on_start = true,
                auto_update = false,
            })
        end,
    },
}

