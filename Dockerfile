# Use a base image with a minimal Linux distribution (e.g., Ubuntu)
FROM ubuntu:latest

# Install necessary software and Xfce desktop environment
RUN apt-get update && apt-get install -y \
    xfce4 \
    xrdp \
    dbus-x11 \
    x11-xserver-utils

# Install additional tools (optional)
RUN apt-get install -y \
    firefox \
    nano

# Create a user for RDP access (customize as needed)
RUN useradd <your-username> -m -s /bin/bash && \
    echo "<your-username>:<your-password>" | chpasswd

# Start the RDP server on port 3389
EXPOSE 3389

# Set the default command to start the RDP server
CMD ["/usr/sbin/xrdp", "-n"]
