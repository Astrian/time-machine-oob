FROM ubuntu:22.04

# Environment variables
ENV TM_USERNAME=timemachine
ENV TM_UID=1000
ENV TM_GID=1000
ENV TM_PASSWORD=timemachine
ENV TM_SHARENAME=TimeMachine
ENV TM_VOL_LIMIT=0

# Create Time Machine user
RUN groupadd -g $TM_GID $TM_USERNAME
RUN useradd -u $TM_UID -g $TM_GID -d /home/$TM_USERNAME -m $TM_USERNAME

# Set password
RUN echo "$TM_USERNAME:$TM_PASSWORD" | chpasswd

# Install dependencies
RUN apt update && apt install netatalk avahi-daemon -y

# Configure Time Machine
RUN mkdir -p /timemachine_backup
RUN chown -R $TM_USERNAME:$TM_USERNAME /timemachine_backup

# Configure Netatalk
RUN echo "[${TM_SHARENAME}]" >> /etc/netatalk/afp.conf
RUN echo "path = /timemachine_backup" >> /etc/netatalk/afp.conf
RUN echo "time machine = yes" >> /etc/netatalk/afp.conf
RUN echo "vol size limit = $TM_VOL_LIMIT" >> /etc/netatalk/afp.conf

# Host services without daemonizing
RUN echo "exit 0" > /usr/sbin/policy-rc.d

# Expose AFP and SMB ports
EXPOSE 548 5353

# Start services
CMD /etc/init.d/dbus start && /etc/init.d/avahi-daemon start && /etc/init.d/netatalk start && tail -f /dev/null