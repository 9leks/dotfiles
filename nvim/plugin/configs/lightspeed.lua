local lightspeed = import 'lightspeed'

if not lightspeed then
    return
end

lightspeed.setup {
    exit_after_idle_msecs = { unlabeled = nil },
}
