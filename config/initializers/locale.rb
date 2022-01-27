br = 'pt-BR'.to_sym

# Permitted locales available for the application
I18n.available_locales = [:en, br]

# Set default locale to something other than :en
I18n.default_locale = br