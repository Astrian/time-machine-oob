FROM ubuntu:22.04

# Copy install.sh
ADD install.sh /install.sh
RUN chmod +x /install.sh

# Install dependencies
RUN apt update && apt install netatalk avahi-daemon -y

# Host services without daemonizing
RUN echo "exit 0" > /usr/sbin/policy-rc.d

# Expose AFP and SMB ports
EXPOSE 548 5353

# Start services
ENTRYPOINT ["/install.sh"]
CMD ["/install.sh"]