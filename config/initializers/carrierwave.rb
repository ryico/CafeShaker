# require 'carrierwave/storage/abstract'
# require 'carrierwave/storage/file'
# require 'carrierwave/storage/fog'

# CarrierWave.configure do |config|
#   config.storage = :fog
#   config.fog_credentials = {
#     provider: 'AWS',
#     aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
#     aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
#     region: ENV['AWS_REGION']
#   }
#  se

#   config.fog_directory = ENV['AWS_S3_BUCKET']
#   config.assets_host = ENV['AWS_S3_URL']
# end

#日本語の文字化けを防ぐ
# CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/