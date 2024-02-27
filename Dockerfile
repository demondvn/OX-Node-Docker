FROM u1ih/ubuntu-novnc

# Switch to root user for installation
USER root

# Set working directory
WORKDIR /app

# Download the OXNodeApp binary
RUN wget https://github.com/Oxoa-Networks/OX-Node/raw/main/OXNodeApp-Linux-4.6.0.AppImage \
    && chmod +x OXNodeApp-Linux-4.6.0.AppImage \
    && apt-get update \
    && apt-get install -y fuse libfuse2
RUN groupadd fuse && user="$(whoami)" && usermod -a -G fuse $user
# Change back to default user

USER 1000
