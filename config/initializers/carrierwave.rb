require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: 'ap-northeast-1'
    }
    config.fog_directory  = ENV['AMAZON_S3_BUCKET_NAME']
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/aws-petdiary'
  else
    config.storage :file
    config.enable_processing = false if Rails.env.test? 
  end  
end