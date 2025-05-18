FROM python:3.11-slim

# Minimal system dependencies
RUN apt-get update && apt-get install -y \
    sshpass \
    git \
    openssh-client \
    iputils-ping \
    && rm -rf /var/lib/apt/lists/*

# Install Ansible
RUN pip install --no-cache-dir ansible

# Set working directory
WORKDIR /ansible

# Copy needed files
COPY ansible/ /ansible/
COPY python/ /python/
COPY packages/entrypoint.sh /run/entrypoint.sh

# Prepare environnement
RUN chmod +x /run/entrypoint.sh
RUN ansible-galaxy install -r /ansible/requirements.txt || true
RUN pip install -r /python/requirements.txt || true

# Volume for inventories
VOLUME /inventories

# Entrypoint
ENTRYPOINT [ "/run/entrypoint.sh" ]
