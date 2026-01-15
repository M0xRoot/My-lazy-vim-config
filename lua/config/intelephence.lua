vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client or client.name ~= "intelephense" then
            return
        end

        local orig_handler = vim.lsp.handlers["textDocument/publishDiagnostics"]

        vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
            if result and result.diagnostics then
                result.diagnostics = vim.tbl_filter(function(diagnostic)
                    -- Intelephense "Undefined method" error code
                    return diagnostic.code ~= "P1013"
                end, result.diagnostics)
            end

            return orig_handler(err, result, ctx, config)
        end
    end,
})
