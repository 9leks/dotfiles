local leap = import 'leap'

if not leap then
    return
end

leap.setup {
    case_sensitive = true,
}

leap.set_default_keymaps()
