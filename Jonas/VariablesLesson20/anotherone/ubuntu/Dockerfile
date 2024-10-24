# Use Ubuntu 24.04 as the base image
FROM ubuntu:24.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install SSH server and other necessary utilities
RUN apt-get update && \
    apt-get install -y openssh-server sudo && \
    mkdir /var/run/sshd

# Set root password (change it if necessary)
RUN echo 'root:password' | chpasswd

# Allow root login over SSH
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Avoid DNS resolution to speed up SSH connections
RUN echo "UseDNS no" >> /etc/ssh/sshd_config

# Create a new user 'ansible'
RUN useradd -m -s /bin/bash ansible

# Set password for 'ansible' (optional, passwordless SSH will be used)
RUN echo 'ansible:password' | chpasswd

# Add 'ansible' user to sudoers for passwordless sudo access
RUN echo 'ansible ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Create .ssh directory for the ansible user and set permissions
RUN mkdir -p /home/ansible/.ssh && \
    chown ansible:ansible /home/ansible/.ssh && \
    chmod 700 /home/ansible/.ssh

# Copy the host's public SSH key to the container (make sure to have id_ed25519.pub available)
# Assuming that you are copying your SSH public key from the build context
COPY ./id_ed25519.pub /home/ansible/.ssh/authorized_keys

# Set the correct ownership and permissions for the authorized_keys file
RUN chown ansible:ansible /home/ansible/.ssh/authorized_keys && \
    chmod 600 /home/ansible/.ssh/authorized_keys

# Expose SSH port
EXPOSE 22

# Start SSH service and keep the container running
CMD ["/usr/sbin/sshd", "-D"]

