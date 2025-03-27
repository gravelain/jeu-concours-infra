# Jeu Concours - Infrastructure

## Description
Ce repository contient toute l'infrastructure nécessaire pour le déploiement et la gestion du projet **Jeu Concours**. Il inclut la configuration des conteneurs Docker, l'automatisation avec Ansible et les scripts de déploiement pour différents environnements (développement, préproduction, production).

## Structure du repository

```
/jeu-concours-infra
├── ansible/
│   ├── inventory/
│   │   └── hosts
│   ├── playbooks/
│   │   ├── setup_vps.yml
│   │   └── deploy.yml
│   └── roles/
│       ├── docker/
│       ├── jenkins/
│       ├── monitoring/
│       └── database/
├── docker-compose/
│   ├── dev/
│   │   └── docker-compose.yml
│   ├── preprod/
│   │   └── docker-compose.yml
│   └── prod/
│       └── docker-compose.yml
├── scripts/
│   ├── backup/
│   │   └── backup_db.sh
│   ├── restore/
│   │   └── restore_db.sh
│   ├── deploy/
│   │   ├── deploy_dev.sh
│   │   ├── deploy_preprod.sh
│   │   └── deploy_prod.sh
└── README.md
```

## Technologies utilisées
- **Docker & Docker Compose** : Conteneurisation des services
- **Ansible** : Automatisation de l'installation et de la configuration du serveur
- **Jenkins** : CI/CD pour l'automatisation du déploiement
- **SonarQube** : Analyse de qualité du code
- **Prometheus & Grafana** : Monitoring des services
- **MySQL** : Base de données pour l'application

## Installation et configuration
### Prérequis
- Un serveur VPS (ex. Contabo) avec un accès SSH
- Docker et Docker Compose installés
- Ansible installé sur votre machine locale

### Installation de l'infrastructure
1. **Configurer l'accès SSH à votre serveur :**
   ```sh
   ssh user@95.111.240.167
   ```
2. **Exécuter le playbook Ansible pour l'installation de Docker et des dépendances :**
   ```sh
   ansible-playbook -i ansible/inventory/hosts ansible/playbooks/setup_vps.yml
   ```
3. **Déployer l'environnement de développement :**
   ```sh
   cd docker-compose/dev
   docker-compose up -d
   ```

## Déploiement CI/CD avec Jenkins
1. **Créer un job Jenkins pour chaque service (frontend, backend)**
2. **Configurer les webhooks GitHub pour déclencher les pipelines CI/CD**
3. **Exécuter le pipeline Jenkins** pour tester, construire et déployer les conteneurs

## Monitoring et Logs
- **Accéder à Grafana :** `http://95.111.240:3000`
- **Accéder à Prometheus :** `http://95.111.240:9090`
- **Consulter les logs des conteneurs :**
  ```sh
  docker logs -f nom_du_conteneur
  ```

## Backup et Restauration
- **Sauvegarde de la base de données :**
  ```sh
  bash scripts/backup/backup_db.sh
  ```
- **Restauration de la base de données :**
  ```sh
  bash scripts/restore/restore_db.sh backup_file.sql
  ```

## Contribution
Les contributions sont les bienvenues ! Veuillez suivre les bonnes pratiques Git et proposer vos modifications via une Pull Request.

## Licence
Ce projet est purement fictif et académique.

