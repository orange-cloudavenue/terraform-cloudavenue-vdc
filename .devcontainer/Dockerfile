ARG VARIANT="1-bullseye"
FROM --platform=linux/amd64 mcr.microsoft.com/vscode/devcontainers/base:${VARIANT}

USER vscode

RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

ENV PATH="/home/linuxbrew/.linuxbrew/bin:${PATH}"

RUN brew install "go-task/tap/go-task"