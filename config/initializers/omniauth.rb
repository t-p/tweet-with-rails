Rails.application.config.middleware.use OmniAuth::Builder do
   use OmniAuth::Strategies::Twitter, '7ff8zzrVNj6eAdBeZAxJSA', 'A4PZaWMF9urlyjhvBe8esGSJZlCRH6gCzPjWrcoOKs'
end
