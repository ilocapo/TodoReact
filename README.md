# ToDo App

Une application de gestion des tâches construite avec React, TypeScript, Tailwind CSS et DaisyUI.

![React](https://img.shields.io/badge/React-19.1.0-blue.svg)
![TypeScript](https://img.shields.io/badge/TypeScript-5.8.3-blue.svg)
![Tailwind CSS](https://img.shields.io/badge/Tailwind%20CSS-4.1.11-blue.svg)
![DaisyUI](https://img.shields.io/badge/DaisyUI-5.0.50-green.svg)

## Description

Application web permettant de gérer une liste de tâches avec système de priorités. Les données sont sauvegardées automatiquement dans le navigateur.

## Fonctionnalités

- Ajout de tâches avec priorités (Urgente, Moyenne, Basse)
- Filtrage par priorité
- Sélection multiple des tâches
- Suppression individuelle ou en lot
- Sauvegarde automatique en local
- Interface responsive avec thème sombre

## Installation

### Prérequis
- Node.js (version 18+)
- npm

### Démarrage rapide
```bash
git clone <repository>
cd ToDo
make run
```

### Installation manuelle
```bash
npm install
npm run dev
```

L'application sera accessible sur http://localhost:5173

## Commandes

### Makefile
```bash
make install    # Installer les dépendances
make dev        # Mode développement
make build      # Build production
make preview    # Prévisualiser le build
make lint       # Vérifier le code
make clean      # Nettoyer les fichiers
```

### npm
```bash
npm install     # Installer les dépendances
npm run dev     # Mode développement
npm run build   # Build production
npm run preview # Prévisualiser le build
npm run lint    # Vérifier le code
```

## Utilisation

1. **Ajouter une tâche** : Saisir le texte, choisir la priorité, cliquer "Ajouter"
2. **Filtrer** : Utiliser les boutons de filtre par priorité
3. **Sélectionner** : Cocher les tâches pour les sélectionner
4. **Supprimer** : Cliquer sur l'icône de suppression ou utiliser la sélection multiple

## Technologies

- **Frontend** : React 19.1.0, TypeScript 5.8.3
- **Build** : Vite 7.0.6
- **Styling** : Tailwind CSS 4.1.11, DaisyUI 5.0.50
- **Icons** : Lucide React
- **Linting** : ESLint

## Structure

```
src/
├── App.tsx          # Composant principal
├── TodoItem.tsx     # Composant de tâche
├── index.css        # Styles Tailwind
└── main.tsx         # Point d'entrée

config/
├── tailwind.config.ts
├── vite.config.ts
└── tsconfig.json
```

## Déploiement

### Build local
```bash
make build
```

Le dossier `dist/` contient l'application prête pour le déploiement.

### GitHub Pages

#### Configuration automatique
1. **Pousser le code sur GitHub** dans le branch `main`
2. **Activer GitHub Pages** :
   - Aller dans Settings > Pages de votre repository
   - Source : "GitHub Actions"
   - Le déploiement se fera automatiquement à chaque push

#### Configuration manuelle
1. **Builder l'application** :
   ```bash
   npm run build
   ```

2. **Déployer** :
   ```bash
   # Installer gh-pages si pas déjà fait
   npm install -g gh-pages
   
   # Déployer le dossier dist
   gh-pages -d dist
   ```

3. **Accéder au site** : `https://votre-username.github.io/ToDo/`

#### Diagnostic si le site ne s'affiche pas

1. **Vérifier que GitHub Pages est activé** :
   - Repository Settings > Pages
   - Source doit être "GitHub Actions"

2. **Vérifier le workflow** :
   - Onglet "Actions" de votre repository
   - Le workflow "Deploy to GitHub Pages" doit être vert

3. **Vérifier l'URL** :
   - Format : `https://votre-username.github.io/nom-du-repository/`
   - Remplacer `votre-username` et `nom-du-repository` par vos valeurs

4. **Forcer un nouveau déploiement** :
   ```bash
   # Faire un petit changement et pusher
   git commit --allow-empty -m "Redeploy"
   git push
   ```

5. **Vérifier les logs** :
   - Onglet Actions > Dernière exécution
   - Regarder les erreurs dans "build" et "deploy"

#### URLs communes
- **Repository nommé "ToDo"** : `https://username.github.io/ToDo/`
- **Repository nommé "todo"** : `https://username.github.io/todo/`
- **Repository avec espaces** : Remplacer par des tirets dans l'URL
