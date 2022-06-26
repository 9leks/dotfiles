local satellite = import 'satellite'

if not satellite then
    return
end

satellite.setup {}

highlight('ScrollView', { bg = '#666666', blend = 75 })
