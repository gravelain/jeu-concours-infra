# Jeu Concours - Infrastructure

## 📌 Description
Ce repository contient l'infrastructure DevOps nécessaire pour le déploiement et la gestion du projet **Jeu Concours**. Il inclut la configuration Docker Compose pour le backend Symfony et le frontend Angular, ainsi que la mise en place des pipelines CI/CD avec Jenkins.

## 📁 Structure du Repository

```
/infrastructure
├── docker-compose/
│   ├── dev/
│   │   └── docker-compose.yml
│   ├── preprod/
│   │   └── docker-compose.yml
│   └── prod/
│       └── docker-compose.yml
├── ci-cd/
│   ├── jenkins/
│   │   ├── jenkins_home/             # Volume Jenkins
│   │   ├── Dockerfile                 # Image personnalisée pour Jenkins
│   │   ├── init.groovy.d/             # Configuration initiale
│   │   └── plugins.txt                # Plugins Jenkins
│   ├── sonarqube/
│   │   └── sonar.properties            # Configuration SonarQube
├── monitoring/
│   ├── grafana/
│   │   ├── dashboards/                 # Dashboards personnalisés
│   │   └── grafana.ini                  # Configuration Grafana
│   ├── prometheus/
│   │   └── prometheus.yml               # Configuration Prometheus
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

## 🛠 Technologies Utilisées

- **Docker & Docker Compose** : Conteneurisation et orchestration des services  
- **Jenkins** : CI/CD pour le déploiement automatique du frontend et du backend  
- **SonarQube** : Analyse de la qualité du code  
- **Prometheus & Grafana** : Monitoring des services  
- **MySQL** : Base de données du backend Symfony  

## 🚀 Installation et Configuration

### ✅ Prérequis

- Un serveur VPS (ex. Contabo) avec accès SSH  
- Docker et Docker Compose installés  
- Jenkins installé pour les pipelines CI/CD  

### ⚙️ Déploiement des Services

1. **Connexion au VPS :**  
   ```sh
   ssh user@95.111.240.167
   ```

2. **Déploiement de l'environnement souhaité :**  
   ```sh
   cd infrastructure/docker-compose/dev  # Remplacez par preprod ou prod si nécessaire
   docker compose up -d
   ```

3. **Vérification des logs :**  
   ```sh
   docker compose logs -f
   ```

## 🔄 CI/CD avec Jenkins

Chaque repository (frontend et backend) contient son propre `Jenkinsfile` pour automatiser les étapes suivantes :  

1. **Clonage du code depuis GitHub**  
2. **Exécution des tests unitaires et SonarQube**  
3. **Build et génération de l’image Docker**  
4. **Push de l’image sur un registry (ex: Docker Hub)**  
5. **Déploiement via Docker Compose sur le VPS**  

## 📊 Monitoring et Logs

- **Accéder à Grafana :** `http://95.111.240.167:3000`  
- **Accéder à Prometheus :** `http://95.111.240.167:9090`  
- **Consulter les logs d'un conteneur :**  
   ```sh
   docker logs -f nom_du_conteneur
   ```

## 🛑 Backup & Restauration

- **Sauvegarde de la base de données :**  
   ```sh
   bash scripts/backup/backup_db.sh
   ```
- **Restauration de la base de données :**  
   ```sh
   bash scripts/restore/restore_db.sh backup_file.sql
   ```

## 🤝 Contribution

Les contributions sont bienvenues ! Créez une Pull Request en suivant les bonnes pratiques Git  🚀.  

---

💡 IMPORTANT : Ceprojet est fictif et académique !
