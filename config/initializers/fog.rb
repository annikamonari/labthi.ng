CarrierWave.configure do |config|
  	config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => 'AKIAJ7S6VR4RH3HWPCCQ',                        # required
      :aws_secret_access_key  => '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',                        # required
      :region                 => 'us-west-2',                  # optional, defaults to 'us-east-1'
  }

  config.fog_directory  = 'labthing'                     # required
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end
