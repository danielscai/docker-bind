#
# Bind9 Dockerfile
#
# https://github.com/danielscai/docker-bind9
#

# Pull base images.
FROM ubuntu:14.04

# Install Bind9
RUN \
  sed -i 's/^# \(.*-backports\s\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get install -y bind9 && \
  rm -rf /var/lib/apt/lists/*

# Add files.
ADD start.bash /bind-start

# Define mountable directories.
VOLUME ["/bind-override"]

# Define default command. 
CMD ["bash","/bind-start"]

# Expose ports.
EXPOSE 53
