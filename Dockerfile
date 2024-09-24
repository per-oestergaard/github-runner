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
RUN curl -o actions-runner-linux-x64.tar.gz -L https://github.com/actions/runner/releases/download/v2.283.1/actions-runner-linux-x64-2.283.1.tar.gz \
    && tar xzf ./actions-runner-linux-x64.tar.gz \
    && rm -f ./actions-runner-linux-x64.tar.gz

# Copy the entrypoint script
COPY entrypoint.sh /home/runner/entrypoint.sh
RUN chmod +x /home/runner/entrypoint.sh

ENTRYPOINT ["/home/runner/entrypoint.sh"]
