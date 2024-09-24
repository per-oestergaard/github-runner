FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    jq \
    git \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Create a user for the runner
RUN useradd -m runner

# Switch to the runner user
USER runner
WORKDIR /home/runner

# Download and configure the GitHub runner
RUN curl -o actions-runner-linux-x64.tar.gz -L https://github.com/actions/runner/releases/download/v2.391.1/actions-runner-linux-x64-2.391.1.tar.gz \
    && ( echo "3f6efb7488a183e291fc2c62876e14c9ee732864173734facc85a1bfb1744464 actions-runner-linux-x64.tar.gz" | shasum -a 256 -c )
    && tar xzf ./actions-runner-linux-x64.tar.gz \
    && rm -f ./actions-runner-linux-x64.tar.gz

# Copy the entrypoint script
COPY entrypoint.sh /home/runner/entrypoint.sh
RUN chmod +x /home/runner/entrypoint.sh

ENTRYPOINT ["/home/runner/entrypoint.sh"]
