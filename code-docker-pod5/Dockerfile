# docker pod5 conversion
# out of cuhkhaosun/base image
FROM cuhkhaosun/base

# Installation dependency
RUN apt-get update && apt-get install -y \
    wget \
    git \
    build-essential \
    zlib1g-dev \
    python3-venv

# Create and activate a virtual envir
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install pod5
RUN pip install pod5

# Set working directory
WORKDIR /data

# Copy entrypoint script to container
COPY run.sh /entrypoint.sh

# Permission
RUN chmod +x /entrypoint.sh

# Entry point
ENTRYPOINT ["/entrypoint.sh"]
