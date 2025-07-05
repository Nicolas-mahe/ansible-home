FROM python:3.11-slim

# Minimal system dependencies
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    ca-certificates \
    lsb-release \
    sshpass \
    git \
    nano \
    openssh-client \
    iputils-ping \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /ansible

# Copy needed files
COPY ansible /ansible
COPY python /python
COPY packages/entrypoint.sh /ansible/entrypoint.sh

# Prepare environnement
RUN chmod +x /ansible/entrypoint.sh
RUN pip install --no-cache-dir -r /python/requirements.txt
RUN ansible-galaxy install -r /ansible/requirements.yaml

# Entrypoint
ENTRYPOINT [ "/ansible/entrypoint.sh" ]
