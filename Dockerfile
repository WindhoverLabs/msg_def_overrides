# Use the official Ubuntu 20.04 as the base image
FROM ubuntu:20.04

# Set the maintainer label (optional)
#LABEL maintainer="yourname@example.com"

# Prevents prompts during package installations
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    git \
    make \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


# Set the working directory inside the container (optional)
WORKDIR /msg_def_overrides

# Copy the current directory contents into the container at /app (optional)
COPY . /msg_def_overrides

# Install msg_def_overrides deps
RUN pip3 install -r /msg_def_overrides/requirements.txt

RUN make check_format

# Set the default command to run when the container starts (optional)
#CMD ["make", "test"]
