# Overview
This document provides instructions for setting up a Docker environment that mimics an x86-64 Ubuntu system on Apple Silicon Macs. This setup allows you to compile and code as if you were using an x86-64 Ubuntu system, leveraging the power of Docker for cross-platform compatibility.

## Prerequisites
- Docker installed on your Apple Silicon Mac.
- Basic knowledge of Docker and its commands.

## Steps to Build the Docker Image

1. **Clone the Repository**: If the Dockerfile is part of a repository, clone it to your local machine. Otherwise, ensure you have the Dockerfile saved locally.

2. **Build the Docker Image**: Navigate to the directory containing the Dockerfile and run the following command to build the Docker image. Replace `<your_image_name>` with the desired name for your Docker image.
    ```sh
    docker build -t <your_image_name> .
    ```
    This command builds a Docker image from the Dockerfile in the current directory and tags it with `<your_image_name>`.

## Using the Alias
To simplify the process of running your Docker container, you can define an alias in your `.zshrc` file. Add the following line to your `.zshrc` file, replacing `<name_of_container>` with the name you used when tagging your Docker image.

```sh
alias ubuntu='sudo docker run --rm -it -v $PWD:/home/:Z -w /home <name_of_container>'
```

After adding the alias, reload your `.zshrc` file or restart your terminal session to apply the changes. You can now use the `ubuntu` command to launch your Docker container with the specified environment.

## Running Docker Without the Alias
If you prefer to run the Docker container without setting up an alias, you can use the following command. Replace `<name_of_container>` with the name of your Docker image:

```sh
sudo docker run --rm -it -v $PWD:/home/:Z -w /home <name_of_container>
```

## Additional Notes
- The Dockerfile installs essential tools for development, including GCC, G++, Valgrind, Zsh, Curl, Git, and Netcat OpenBSD.
- It configures Zsh with Oh My Zsh and a minimal OS theme for a pleasant coding experience.
- The working directory inside the container is set to `/home`, where your project files are mounted from your host machine.
- You are free to not use the version provided here and instead use it as inspiration to create your own custom setup.

By following these steps, you can efficiently develop on your Apple Silicon Mac as if you were using an x86-64 Ubuntu system, benefiting from the isolation and consistency provided by Docker.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Contributing
Contributions are welcome! Please fork the repository and submit a pull request for any enhancements or fixes.
