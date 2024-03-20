FROM --platform=linux/amd64 mcr.microsoft.com/devcontainers/base:1.0.7-bookworm

WORKDIR /utilities

RUN latest_azqr=$(curl -sL https://api.github.com/repos/Azure/azqr/releases/latest | jq -r ".tag_name" | cut -c1-) \
    && wget https://github.com/Azure/azqr/releases/download/$latest_azqr/azqr-ubuntu-latest-amd64 -O azqr
RUN chmod +x azqr