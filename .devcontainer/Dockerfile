# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.205.2/containers/python-3/.devcontainer/base.Dockerfile

# [Choice] Python version (use -bullseye variants on local arm64/Apple Silicon): 3, 3.10, 3.9, 3.8, 3.7, 3.6, 3-bullseye, 3.10-bullseye, 3.9-bullseye, 3.8-bullseye, 3.7-bullseye, 3.6-bullseye, 3-buster, 3.10-buster, 3.9-buster, 3.8-buster, 3.7-buster, 3.6-buster
ARG VARIANT="3.10-bullseye"
FROM mcr.microsoft.com/vscode/devcontainers/python:0-${VARIANT}

# [Choice] Node.js version: none, lts/*, 16, 14, 12, 10
# ARG NODE_VERSION="none"
# RUN if [ "${NODE_VERSION}" != "none" ]; then su vscode -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"; fi

# [Optional] If your pip requirements rarely change, uncomment this section to add them to the image.
RUN python3 -m pip install --upgrade pip
COPY ./requirements.txt /tmp/pip-tmp/
COPY ./bin/build_requirements.txt /tmp/pip-tmp/bin/
RUN pip3 --disable-pip-version-check --no-cache-dir install -r /tmp/pip-tmp/bin/build_requirements.txt \
   && rm -rf /tmp/pip-tmp

# [Optional] Uncomment this section to install additional OS packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends colordiff

# [Optional] Uncomment this line to install global node packages.
# RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g <your-package-here>" 2>&1

# [Optional] User venv mode initialization
# RUN wget -q https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.sh
# RUN ./dotnet-install.sh --channel LTS

# PowerShell 7.2.0
RUN wget https://github.com/PowerShell/PowerShell/releases/download/v7.2.0/powershell-lts_7.2.0-1.deb_amd64.deb -O /tmp/powershell_7.2.0-1.deb_amd64.deb
RUN dpkg -i /tmp/powershell_7.2.0-1.deb_amd64.deb
RUN apt-get install -f

# .NET SDK
RUN wget https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.sh -O /tmp/dotnet-install.sh
RUN chmod +x /tmp/dotnet-install.sh && /tmp/dotnet-install.sh
