#!/command/with-contenv bashio
# ==============================================================================
# Ensure the config file exists
# ==============================================================================
readonly SNAPSERVER_CONFIG="/config"

if ! bashio::fs.directory_exists "${SNAPSERVER_CONFIG}"; then
  bashio::log.info "Creating default configuration..."
  mkdir -p "${SNAPSERVER_CONFIG}" || bashio::exit.nok "Could not create media folder: ${SNAPSERVER_CONFIG}"
  cp /etc/snapserver.conf "${SNAPSERVER_CONFIG}/snapserver.conf" || bashio::exit.nok "Could not copy default configuration to: ${SNAPSERVER_CONFIG}"
fi
