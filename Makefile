# Variables
NODE_MODULES = node_modules
DIST = dist

.DEFAULT_GOAL := help

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "%-15s %s\n", $$1, $$2}'

.PHONY: install
install: ## Install dependencies
	npm install

.PHONY: dev
dev: install ## Start development server
	npm run dev

.PHONY: build
build: install ## Build for production
	npm run build

.PHONY: preview
preview: build ## Preview production build
	npm run preview

.PHONY: lint
lint: install ## Run ESLint
	npm run lint

.PHONY: clean
clean: ## Clean build artifacts and dependencies
	rm -rf $(NODE_MODULES) $(DIST) .vite

.PHONY: reinstall
reinstall: clean install ## Clean and reinstall dependencies
