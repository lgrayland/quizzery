CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider  => 'AWS',  # required
    :aws_access_key_id  => ENV['AWS_ACCESS_KEY_ID'],  # required
    :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],  # required
    :endpoint => "https://s3-eu-west-1.amazonaws.com/"
  }
  config.fog_directory  = ENV['AWS_BUCKET_NAME']  # required
  config.fog_public  = true  # optional, defaults to true
end