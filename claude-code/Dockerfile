# Use official Node.js Alpine image
FROM node:22-alpine

# Install git and su-exec (required by Claude Code and entrypoint)
RUN apk add --no-cache git su-exec bash curl zip github-cli

# Use bash
SHELL ["/bin/bash", "-c"]

# Install SDKMAN!, JDK, SBT
RUN curl -s "https://get.sdkman.io?ci=true" | bash && \
    source "/root/.sdkman/bin/sdkman-init.sh" && \
    sdk install java && \
    sdk install sbt

# Install Claude Code globally
RUN npm install -g @anthropic-ai/claude-code@~2.0.0

# Create directories
RUN mkdir -p /claude /workspace

# Copy entrypoint script
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set working directory
WORKDIR /workspace

# Set entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["sh", "-c", "echo 'Claude Code container is ready!'"]
