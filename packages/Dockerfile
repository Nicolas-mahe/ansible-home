FROM python:3.11-slim

# Dépendances système minimales
RUN apt-get update && apt-get install -y \
    sshpass \
    git \
    openssh-client \
    && rm -rf /var/lib/apt/lists/*

# Installer Ansible
RUN pip install --no-cache-dir ansible

# Copier playbooks, rôles, etc.
COPY ansible/ /ansible/
COPY python/ /python/

# Définir le dossier de travail
WORKDIR /ansible

# Installer les dépendances Ansible si besoin
RUN ansible-galaxy install -r requirements.txt || true

# Volume pour l'inventaire (SSH, host_vars, etc.)
VOLUME /inventories

# Point d'entrée
# ENTRYPOINT [ "ansible-playbook" ]
# CMD [ "--version" ]
