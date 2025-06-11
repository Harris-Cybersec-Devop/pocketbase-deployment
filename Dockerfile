FROM alpine

# Download PocketBase
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v0.22.1/pocketbase_0.22.1_linux_amd64.zip && \
    unzip pocketbase_0.22.1_linux_amd64.zip && \
    rm pocketbase_0.22.1_linux_amd64.zip

# Make executable
RUN chmod +x pocketbase

# Expose the default port
EXPOSE 8090

# Run PocketBase
CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]

