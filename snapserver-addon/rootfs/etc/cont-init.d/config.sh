#!/command/with-contenv bashio
# ==============================================================================
# Ensure the config file exists
# ==============================================================================
readonly SNAPSERVER_CONFIG_DIR="/config"
readonly SNAPSERVER_CONFIG="${SNAPSERVER_CONFIG_DIR}/snapserver.conf"

# if ! bashio::fs.file_exists "${SNAPSERVER_CONFIG}"; then
#   bashio::log.info "Creating default configuration..."
#   mkdir -p "${SNAPSERVER_CONFIG_DIR}" || bashio::exit.nok "Could not create config folder: ${SNAPSERVER_CONFIG}"
#   cp /etc/snapserver.conf "${SNAPSERVER_CONFIG}" || bashio::exit.nok "Could not copy default configuration to: ${SNAPSERVER_CONFIG}"
# fi
