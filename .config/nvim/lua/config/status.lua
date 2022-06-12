function line()
    local left = {
        vim.fn.mode(),
        '%f %m%r',
    }

    local right = {
        '%y',
        '%l:%c',
    }

    return string.format(
        ' %s %%= %s ',
        table.concat(left, ' | '),
        table.concat(right, ' | ')
    )
end

vim.o.statusline = '%!luaeval("line()")'
