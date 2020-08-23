  
resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

description "Car name"

files {
    'data/handling.meta',
    'data/vehiclelayouts.meta',
    'data/vehicles.meta', 
    'data/carcols.meta',
    'data/carvariations.meta',
--    'data/contentunlocks.meta',
}

data_file 'HANDLING_FILE' 'data/handling.meta'
data_file 'VEHICLE_LAYOUTS_FILE' 'data/vehiclelayouts.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/carvariations.meta'
-- data_file 'VEHICLE_SHOP_DLC_FILE' 'data/'
--data_file 'CONTENT_UNLOCKING_META_FILE' 'data/contentunlocks.meta'

client_script {
    'data/vehicle_names.lua' 
}