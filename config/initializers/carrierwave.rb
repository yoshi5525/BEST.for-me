require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test?
    config.storage = :file
  else
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      region: ENV['AWS_S3_REGION'],
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    }
    config.fog_directory     =  ENV['AWS_S3_BUCKET']
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/chat-space55555'
  end
end
# if Rails.env.production?
#   CarrierWave.configure do |config|
#     config.fog_provider = 'fog/aws'
#     config.fog_credentials = {
#       provider: 'AWS',
#       region: ENV['AWS_S3_REGION'],
#       aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
#       aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
#     }
#     config.fog_directory     =  ENV['AWS_S3_BUCKET']
#     config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
#   end

#   CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
# end