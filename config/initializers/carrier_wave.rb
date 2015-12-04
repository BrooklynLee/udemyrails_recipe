if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog.credentials = {
      :provider => 'AWS',
      :aws_access_key_id => ENV['S3_ACCESS_KEY'],
      :aws_secret_access_key_id => ENV['S3_SECRET_KEY'],
    }
    
    config.fog.directory = ENV['S3_BUCKET']
    
  end
end