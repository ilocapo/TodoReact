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

```bash
make build
```

Le dossier `dist/` contient l'application prête pour le déploiement.
# TodoReact
