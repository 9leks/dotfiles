local satellite = import 'satellite'

if not satellite then
    return
end

satellite.setup {
    excluded_filetypes = { 'NvimTree' },
}

highlight('ScrollView', { bg = '#666666', blend = 75 })
