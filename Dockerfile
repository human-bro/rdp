FROM ubuntu:latest

# Set the keyboard layout (e.g., for US layout)
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && apt-get install -y keyboard-configuration && \
    echo "keyboard-configuration keyboard-configuration/layout select USA" | debconf-set-selections && \
    dpkg-reconfigure keyboard-configuration
