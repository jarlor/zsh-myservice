# zsh-myservice

`zsh-myservice` is a zsh plugin designed to help you manage custom systemd services and Docker containers more conveniently. This plugin provides user-friendly commands to list and check the status of your custom services and Docker containers straight from your command line.

## Features

- **List Custom Services (llcs)**: Displays custom systemd services with their names, statuses, and descriptions.
- **List Docker Containers (lldc)**: Lists Docker containers with their names, statuses, and images.

## Installation

You can install `zsh-myservice` in a few simple steps. The installation involves cloning the plugin into your Zsh custom plugins directory and configuring `.zshrc` to load the plugin.

### Using Oh My Zsh

1. **Clone the Repository**

   First, clone the `zsh-myservice` repository into your custom plugins directory (e.g., `~/.oh-my-zsh/custom/plugins`):

   ```sh
   git clone https://github.com/yourusername/zsh-myservice.git ~/.oh-my-zsh/custom/plugins/zsh-myservice
   ```

2. **Activate the Plugin**

   Open your `.zshrc` file and add `zsh-myservice` to the list of plugins:

   ```sh
   plugins=(... zsh-myservice)
   ```

3. **Source the `.zshrc` file**

   Apply the changes by sourcing your `.zshrc` file:

   ```sh
   source ~/.zshrc
   ```

   Now, the `zsh-myservice` plugin should be active.

## Usage

Once the plugin is installed and active, you can use the following commands:

- **llcs**: Lists custom systemd services with their names, statuses, and descriptions.

  ```sh
  llcs
  ```

  **Example Output:**

  ```
  Custom Services:
  ----------------
  Service                  Status          Description
  myservice                active          My custom service description
  another-service          inactive        Another custom service description
  ```

- **lldc**: Lists Docker containers with their names, statuses, and images.

  ```sh
  lldc
  ```

  **Example Output:**

  ```
  Docker Containers:
  ------------------
  NAMES                STATUS                    IMAGE
  mydocker1            Up 3 minutes              ubuntu:latest
  mydocker2            Exited (0) 5 minutes ago  nginx:latest
  ```

### Custom Service Directory

If your custom services are not in the default directory (`/root/.service`), the plugin will prompt you to specify the custom service directory. Once specified, the directory is saved in a configuration file for future use.

## Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](https://github.com/yourusername/zsh-myservice/issues).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.