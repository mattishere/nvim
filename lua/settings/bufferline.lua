require('bufferline').setup{
    options = {
        mode = "buffers",

        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        diagnostics = 'nvim_lsp',
        indicator = {
            style = 'none',
        },
        show_close_icon = false,
        color_icons = true,
        max_name_length = 20,
        max_prefix_length = 15,
        separator_style = "thin",
    }
}
