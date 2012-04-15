Rails.application.config.middleware.use OmniAuth::Builder do

  provider :facebook, '356536331058791', 'b1487ff0b10a4214052e7a5264b29bb9',  {client_options: {ssl: {ca_file: Rails.root.join('lib/assets/cacert.pem').to_s}}}

end
