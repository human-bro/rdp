# Use an official Ubuntu base image
FROM ubuntu:latest

# Update the package lists and install xrdp (RDP server)
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y xrdp

# Expose RDP port
EXPOSE 3389

# Install Ngrok (download the Linux version)
RUN apt-get install -y unzip
RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip -O ngrok.zip && unzip ngrok.zip && chmod +x ngrok && mv ngrok /usr/local/bin/

# Start xrdp (note: this is a simplified example)
CMD ["xrdp"]
