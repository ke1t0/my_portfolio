
# CarrierWave.configure do |config|
#     # config.storage :fog
#     config.fog_provider = 'fog/aws'
#     config.fog_credentials = {
#       provider: 'AWS',
#       aws_access_key_id: ENV['AKIAYVSE5EWMRMVB3ZUD'],
#       aws_secret_access_key: ENV['MjHz4Xrap62mvb9IOF5uA3fircAtDZ1cGzrOWZEz'],
#       region: ENV['ap-northeast-1'],
#       # path_style: true
#       #host:                  's3.example.com',             # optional, defaults to nil
#       #endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
#     }
#     config.fog_directory  = 'tenniction'
#     config.fog_public = false
#     config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
# end
 
# CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/