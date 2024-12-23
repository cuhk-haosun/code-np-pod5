# out of cuhkhaosun/base image
FROM cuhkhaosun/base

LABEL maintainer="LYX"

# Installation the package
RUN apt-get update && apt-get install -y \
    wget \
    git \
    build-essential \
    zlib1g-dev \
    python3-venv

#Create and activate a virtual python envir
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

#Install pod5
RUN pip install pod5

# Set working directory
WORKDIR /root

# Download the set.thread.num.sh script
RUN curl -o /root/set.thread.num.sh https://raw.githubusercontent.com/cuhk-haosun/code-docker-script-lib/main/set.thread.num.sh && \
    chmod +x /root/set.thread.num.sh

# Copy entrypoint script to container
COPY entrypoint.sh /entrypoint.sh

# Permission
RUN chmod +x /entrypoint.sh

# Entry point
ENTRYPOINT ["/entrypoint.sh"]
