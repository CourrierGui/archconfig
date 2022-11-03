require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.norg.concealer"] = {
            config = {
                conceal = true,
            }
        },
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    notes = "~/Documents/notes",
                }
            }
        },
        ["core.norg.completion"] = {
            config = {
                engine = "nvim-cmp"
            }
        },
        ["core.gtd.base"] = {
            config = {
            }
        },
        ["core.gtd.base"] = {
            config = {
                workspace = "notes",
            },
        },
    }
}
