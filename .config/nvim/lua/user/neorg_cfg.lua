require('neorg').setup {
    ["load"] = {
        ["core.defaults"] = {},
        ["core.concealer"] = {
            config = {
                conceal = true,
            }
        },
        ["core.dirman"] = {
            config = {
                workspaces = {
                    notes = "~/Documents/notes",
                },
                default_workspace = "notes",
            }
        },
        ["core.completion"] = {
            config = {
                engine = "nvim-cmp"
            }
        },
        ["core.qol.todo_items"] = {
            config = {
                create_todo_items = true,
                create_todo_parents = true,
            }
        },
    }
}
