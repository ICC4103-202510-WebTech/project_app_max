# Desactivar completamente la verificación de hosts en Rails
Rails.application.config.action_dispatch.ip_spoofing_check = false
Rails.application.config.hosts = nil
Rails.application.config.host_authorization = { exclude: ->(_) { true } }

# Configuración adicional para asegurar que no se bloqueen hosts
if Rails.application.config.respond_to?(:hosts_response_app)
  Rails.application.config.hosts_response_app = nil
end

# Desactivar middleware de autorización de hosts si existe
if defined?(ActionDispatch::HostAuthorization)
  Rails.application.config.middleware.delete ActionDispatch::HostAuthorization
end
