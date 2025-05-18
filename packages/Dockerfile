FROM python:3.11-slim

# Dépendances système minimales
RUN apt-get update && apt-get install -y \
    sshpass \
    git \
    openssh-client \
    iputils-ping \
    && rm -rf /var/lib/apt/lists/*

# Installer Ansible
RUN pip install --no-cache-dir ansible

# Définir le dossier de travail
WORKDIR /ansible

# Copier playbooks, rôles, etc.
COPY ansible/ /ansible/
COPY python/ /python/
COPY packages/entrypoint.sh /run/entrypoint.sh

RUN chmod +x /run/entrypoint.sh

# Installer les dépendances Ansible si besoin
RUN ansible-galaxy install -r requirements.txt || true

# Volume pour l'inventaire (SSH, host_vars, etc.)
VOLUME /inventories

# Point d'entrée
ENTRYPOINT [ "/run/entrypoint.sh" ]
