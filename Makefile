# Makefile pour ToDo App
# Variables
NODE_MODULES = node_modules
DIST = dist
PACKAGE_JSON = package.json

# Couleurs pour les messages
RED = \033[0;31m
GREEN = \033[0;32m
YELLOW = \033[1;33m
BLUE = \033[0;34m
NC = \033[0m # No Color

# Cibles par défaut
.DEFAULT_GOAL := help

# Aide
.PHONY: help
help: ## Affiche cette aide
	@echo "$(BLUE)📝 ToDo App - Commandes disponibles:$(NC)"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "$(GREEN)%-15s$(NC) %s\n", $$1, $$2}'
	@echo ""
	@echo "$(YELLOW)Usage: make <command>$(NC)"
	@echo ""

# Installation des dépendances
.PHONY: install
install: ## Installe les dépendances npm
	@echo "$(BLUE)📦 Installation des dépendances...$(NC)"
	@if [ -f "$(PACKAGE_JSON)" ]; then \
		npm install; \
		echo "$(GREEN)✅ Dépendances installées avec succès!$(NC)"; \
	else \
		echo "$(RED)❌ Fichier package.json introuvable!$(NC)"; \
		exit 1; \
	fi

# Vérification des dépendances
.PHONY: check-deps
check-deps:
	@if [ ! -d "$(NODE_MODULES)" ]; then \
		echo "$(YELLOW)⚠️  Les dépendances ne sont pas installées. Installation en cours...$(NC)"; \
		$(MAKE) install; \
	fi

# Démarrage en mode développement
.PHONY: dev
dev: check-deps ## Démarre l'application en mode développement
	@echo "$(BLUE)🚀 Démarrage en mode développement...$(NC)"
	@echo "$(YELLOW)💡 Ouvrez http://localhost:5173 dans votre navigateur$(NC)"
	@npm run dev

# Construction pour la production
.PHONY: build
build: check-deps ## Construit l'application pour la production
	@echo "$(BLUE)🏗️  Construction pour la production...$(NC)"
	@npm run build
	@echo "$(GREEN)✅ Build terminé! Fichiers dans le dossier dist/$(NC)"

# Prévisualisation de la version de production
.PHONY: preview
preview: ## Prévisualise la version de production (nécessite un build d'abord)
	@if [ ! -d "$(DIST)" ]; then \
		echo "$(YELLOW)⚠️  Aucun build trouvé. Construction en cours...$(NC)"; \
		$(MAKE) build; \
	fi
	@echo "$(BLUE)👀 Démarrage du serveur de prévisualisation...$(NC)"
	@echo "$(YELLOW)💡 Ouvrez http://localhost:4173 dans votre navigateur$(NC)"
	@npm run preview

# Vérification du code avec ESLint
.PHONY: lint
lint: check-deps ## Vérifie le code avec ESLint
	@echo "$(BLUE)🔍 Vérification du code avec ESLint...$(NC)"
	@npm run lint
	@echo "$(GREEN)✅ Code vérifié!$(NC)"

# Nettoyage
.PHONY: clean
clean: ## Nettoie les dossiers node_modules et dist
	@echo "$(BLUE)🧹 Nettoyage des dossiers...$(NC)"
	@rm -rf $(NODE_MODULES)
	@rm -rf $(DIST)
	@rm -rf .vite
	@echo "$(GREEN)✅ Nettoyage terminé!$(NC)"

# Installation complète et démarrage
.PHONY: run
run: ## Installation complète + démarrage (recommandé pour la première fois)
	@echo "$(BLUE)🎯 Démarrage complet de l'application...$(NC)"
	@echo ""
	@echo "$(YELLOW)Étape 1/2: Installation des dépendances$(NC)"
	@$(MAKE) install
	@echo ""
	@echo "$(YELLOW)Étape 2/2: Démarrage en mode développement$(NC)"
	@$(MAKE) dev

# Réinstallation complète
.PHONY: reinstall
reinstall: clean install ## Nettoie tout et réinstalle les dépendances
	@echo "$(GREEN)✅ Réinstallation terminée!$(NC)"

# Vérification de l'environnement
.PHONY: check-env
check-env: ## Vérifie que l'environnement est prêt
	@echo "$(BLUE)🔧 Vérification de l'environnement...$(NC)"
	@echo -n "Node.js: "
	@if command -v node >/dev/null 2>&1; then \
		echo "$(GREEN)✅ $$(node --version)$(NC)"; \
	else \
		echo "$(RED)❌ Non installé$(NC)"; \
		echo "$(YELLOW)💡 Installez Node.js depuis https://nodejs.org/$(NC)"; \
		exit 1; \
	fi
	@echo -n "npm: "
	@if command -v npm >/dev/null 2>&1; then \
		echo "$(GREEN)✅ $$(npm --version)$(NC)"; \
	else \
		echo "$(RED)❌ Non installé$(NC)"; \
		exit 1; \
	fi
	@echo "$(GREEN)✅ Environnement prêt!$(NC)"

# Informations sur le projet
.PHONY: info
info: ## Affiche les informations sur le projet
	@echo "$(BLUE)📋 Informations sur le projet$(NC)"
	@echo ""
	@echo "$(YELLOW)Nom:$(NC) ToDo App"
	@echo "$(YELLOW)Description:$(NC) Application de gestion des tâches"
	@echo "$(YELLOW)Technologies:$(NC) React + TypeScript + Tailwind CSS + DaisyUI"
	@echo "$(YELLOW)Bundler:$(NC) Vite"
	@echo ""
	@if [ -f "$(PACKAGE_JSON)" ]; then \
		echo "$(YELLOW)Version:$(NC) $$(grep '"version"' $(PACKAGE_JSON) | cut -d'"' -f4)"; \
		echo "$(YELLOW)Scripts disponibles:$(NC)"; \
		npm run | grep -E '^\s+[a-zA-Z]' | sed 's/^/  /'; \
	fi
	@echo ""

# Test complet
.PHONY: test
test: check-env lint ## Lance tous les tests (environnement + lint)
	@echo "$(GREEN)✅ Tous les tests sont passés!$(NC)"

# Déploiement (build + info)
.PHONY: deploy
deploy: build ## Prépare l'application pour le déploiement
	@echo "$(BLUE)🚀 Préparation pour le déploiement...$(NC)"
	@echo ""
	@echo "$(GREEN)✅ Application prête pour le déploiement!$(NC)"
	@echo "$(YELLOW)💡 Le dossier 'dist/' contient tous les fichiers nécessaires$(NC)"
	@echo "$(YELLOW)💡 Vous pouvez maintenant déployer sur:$(NC)"
	@echo "   - Vercel (vercel --prod)"
	@echo "   - Netlify (netlify deploy --prod --dir=dist)"
	@echo "   - GitHub Pages"
	@echo "   - Ou tout autre hébergeur statique"
	@echo ""

# Affichage des statistiques
.PHONY: stats
stats: ## Affiche les statistiques du projet
	@echo "$(BLUE)📊 Statistiques du projet$(NC)"
	@echo ""
	@if [ -d "src" ]; then \
		echo "$(YELLOW)Fichiers TypeScript/JavaScript:$(NC) $$(find src -name "*.ts" -o -name "*.tsx" -o -name "*.js" -o -name "*.jsx" | wc -l)"; \
		echo "$(YELLOW)Lignes de code:$(NC) $$(find src -name "*.ts" -o -name "*.tsx" -o -name "*.js" -o -name "*.jsx" -exec cat {} \; | wc -l)"; \
	fi
	@if [ -d "$(NODE_MODULES)" ]; then \
		echo "$(YELLOW)Taille node_modules:$(NC) $$(du -sh $(NODE_MODULES) | cut -f1)"; \
	fi
	@if [ -d "$(DIST)" ]; then \
		echo "$(YELLOW)Taille du build:$(NC) $$(du -sh $(DIST) | cut -f1)"; \
	fi
	@echo ""

# Développement avec auto-reload
.PHONY: watch
watch: dev ## Alias pour 'make dev' (mode développement avec auto-reload)

# Commandes courtes
.PHONY: i d b p l c r
i: install  ## Raccourci pour 'install'
d: dev      ## Raccourci pour 'dev'
b: build    ## Raccourci pour 'build'
p: preview  ## Raccourci pour 'preview'
l: lint     ## Raccourci pour 'lint'
c: clean    ## Raccourci pour 'clean'
r: run      ## Raccourci pour 'run'
