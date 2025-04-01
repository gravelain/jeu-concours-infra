# Définition des chemins des fichiers docker-compose
DOCKER_COMPOSE_DEV=infrastructure/docker-compose/dev/docker-compose.dev.yml
DOCKER_COMPOSE_PREPROD=infrastructure/docker-compose/preprod/docker-compose.preprod.yml
DOCKER_COMPOSE_PROD=infrastructure/docker-compose/prod/docker-compos.prod.yml

# Commandes pour l'environnement DEV
dev up:
	@echo "🚀 Démarrage de l'environnement DEV..."
	docker compose -f $(DOCKER_COMPOSE_DEV) up -d --build

dev down:
	@echo "🛑 Arrêt de l'environnement DEV..."
	docker compose -f $(DOCKER_COMPOSE_DEV) down

dev restart: dev-down dev-up

dev logs:
	@echo "📜 Logs de l'environnement DEV..."
	docker compose -f $(DOCKER_COMPOSE_DEV) logs -f

# Commandes pour l'environnement PREPROD
preprod up:
	@echo "🚀 Démarrage de l'environnement PREPROD..."
	docker compose -f $(DOCKER_COMPOSE_PREPROD) up -d --build

preprod down:
	@echo "🛑 Arrêt de l'environnement PREPROD..."
	docker compose -f $(DOCKER_COMPOSE_PREPROD) down

preprod restart: preprod-down preprod-up

preprod logs:
	@echo "📜 Logs de l'environnement PREPROD..."
	docker compose -f $(DOCKER_COMPOSE_PREPROD) logs -f

# Commandes pour l'environnement PROD
prod up:
	@echo "🚀 Démarrage de l'environnement PROD..."
	docker compose -f $(DOCKER_COMPOSE_PROD) up -d --build

prod down:
	@echo "🛑 Arrêt de l'environnement PROD..."
	docker compose -f $(DOCKER_COMPOSE_PROD) down

prod restart: prod-down prod-up

prod logs:
	@echo "📜 Logs de l'environnement PROD..."
	docker compose -f $(DOCKER_COMPOSE_PROD) logs -f

# Commande pour afficher la liste des conteneurs en cours d'exécution
ps:
	@echo "📌 Liste des conteneurs en cours d'exécution :"
	docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}"

# Commande pour afficher l'aide
help:
	@echo "📌 Commandes disponibles dans ce Makefile:"
	@echo ""
	@echo "  dev up          -> Démarrer l'environnement DEV"
	@echo "  dev down        -> Arrêter l'environnement DEV"
	@echo "  dev restart     -> Redémarrer l'environnement DEV"
	@echo "  dev logs        -> Voir les logs de l'environnement DEV"
	@echo ""
	@echo "  preprod up      -> Démarrer l'environnement PREPROD"
	@echo "  preprod down    -> Arrêter l'environnement PREPROD"
	@echo "  preprod restart -> Redémarrer l'environnement PREPROD"
	@echo "  preprod logs    -> Voir les logs de l'environnement PREPROD"
	@echo ""
	@echo "  prod up         -> Démarrer l'environnement PROD"
	@echo "  prod down       -> Arrêter l'environnement PROD"
	@echo "  prod restart    -> Redémarrer l'environnement PROD"
	@echo "  prod logs       -> Voir les logs de l'environnement PROD"
	@echo ""
	@echo "  ps              -> Voir les conteneurs en cours d'exécution"
	@echo "  help            -> Afficher cette aide"
