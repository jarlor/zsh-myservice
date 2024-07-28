#!/bin/zsh

# Determine plugin directory
if [[ -z $PLUGIN_DIR ]]; then
  PLUGIN_DIR=$(dirname "$0")
fi

# Configuration file to store custom service directory
CONFIG_FILE="$PLUGIN_DIR/.custom_service_config"

# Function to prompt user for action
prompt_user() {
  echo "Service directory not found or not set"
  echo "Please specify the custom service directory:"
  read -r specified_dir
  if [[ -d $specified_dir ]]; then
    echo "Using specified directory: $specified_dir"
    echo "SERVICE_DIR=\"$specified_dir\"" > "$CONFIG_FILE"
    service_dir="$specified_dir"
  else
    echo "Invalid directory: $specified_dir"
    return 1
  fi
}

# Function to load configuration
load_config() {
  if [[ -f $CONFIG_FILE ]]; then
    source "$CONFIG_FILE"
  fi
}

# Function to list custom services
list_custom_services() {
  load_config
  local service_dir="${SERVICE_DIR:-/root/.service}"

  if [[ ! -d $service_dir ]]; then
    prompt_user
    if [[ $? -ne 0 ]]; then
      return 1
    fi
  fi

  echo "Custom Services:"
  echo "----------------"
  printf "%-25s %-15s %s\n" "Service" "Status" "Description"  # Header

  for service_file in "$service_dir"/*.service; do
    if [[ -f $service_file ]]; then
      local service_name=$(basename "$service_file" .service)
      local service_status=$(systemctl is-active "$service_name" 2>/dev/null || echo "unknown")
      local service_description=$(grep -i '^Description=' "$service_file" | cut -d '=' -f 2-)

      printf "%-25s %-15s %s\n" "$service_name" "$service_status" "$service_description"
    fi
  done
}

# Function to list Docker containers
list_docker_containers() {
  if ! command -v docker &> /dev/null; then
    echo "Docker command not found"
    return 1
  fi

  echo "Docker Containers:"
  echo "------------------"
  docker ps -a --format "table {{.Names}}\t{{.Status}}\t{{.Image}}"
}

# Aliases to easily call these functions
alias llcs='list_custom_services'
alias lldc='list_docker_containers'