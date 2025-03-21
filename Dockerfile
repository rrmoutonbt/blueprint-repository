FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    libssl-dev \
    git \
    pkg-config \
    wget \
    nlohmann-json3-dev \
    libboost-all-dev

# Set up directory structure
WORKDIR /app

# Add scripts
COPY setup.sh /app/setup.sh
COPY build-and-run.sh /app/build-and-run.sh
COPY CMakeLists.txt /app/CMakeLists.txt
COPY src/ /app/src/

# Make scripts executable
RUN chmod +x /app/setup.sh /app/build-and-run.sh

# Expose necessary ports
EXPOSE 8080 9000
