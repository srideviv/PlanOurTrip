Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '356536331058791', 'b1487ff0b10a4214052e7a5264b29bb9', { :scope => 'email, offline_access'}
end
