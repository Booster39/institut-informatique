#!/bin/bash

echo "🚀 Initialisation du projet L'Institut de l'informatique"

# Vérifier les prérequis
echo "📋 Vérification des prérequis..."

command -v java >/dev/null 2>&1 || { echo "❌ Java n'est pas installé"; exit 1; }
command -v node >/dev/null 2>&1 || { echo "❌ Node.js n'est pas installé"; exit 1; }
command -v docker >/dev/null 2>&1 || { echo "❌ Docker n'est pas installé"; exit 1; }

echo "✅ Tous les prérequis sont installés"

# Backend
echo "🔧 Configuration du backend..."
cd backend
if [ ! -f "mvnw" ]; then
    echo "Téléchargement de Maven Wrapper..."
fi
cd ..

# Frontend
echo "🔧 Configuration du frontend..."
cd frontend
if [ ! -d "node_modules" ]; then
    echo "Installation des dépendances npm..."
    npm install
fi
cd ..

echo "✅ Projet initialisé avec succès!"
echo ""
echo "Pour démarrer:"
echo "  Backend:  cd backend && ./mvnw spring-boot:run"
echo "  Frontend: cd frontend && npm start"
echo "  Docker:   docker-compose up -d"
