# Guide de dépannage Docker

## Problème : Les conteneurs se sont arrêtés

### Solution 1 : Vérifier que Docker Desktop est démarré

1. **Ouvrir Docker Desktop** :
   - Recherchez "Docker Desktop" dans le menu Démarrer
   - Lancez l'application
   - Attendez que l'icône Docker dans la barre des tâches soit verte

2. **Vérifier l'état** :
   ```powershell
   docker ps -a
   ```

### Solution 2 : Redémarrer les services

Une fois Docker Desktop démarré, exécutez :

```powershell
# Arrêter tous les conteneurs
docker-compose down

# Redémarrer tous les services
docker-compose up -d

# Vérifier l'état
docker-compose ps
```

### Solution 3 : Vérifier les logs en cas d'erreur

```powershell
# Logs du backend
docker-compose logs backend

# Logs du frontend
docker-compose logs frontend

# Logs de PostgreSQL
docker-compose logs postgres
```

### Solution 4 : Reconstruire les images si nécessaire

```powershell
# Reconstruire et redémarrer
docker-compose up -d --build
```

### Solution 5 : Nettoyer et redémarrer

Si les problèmes persistent :

```powershell
# Arrêter et supprimer les conteneurs
docker-compose down

# Supprimer les volumes (attention : supprime les données)
docker-compose down -v

# Reconstruire et redémarrer
docker-compose up -d --build
```

## Accès aux services

Une fois démarrés, les services sont accessibles sur :

- **Frontend** : http://localhost:4200
- **Backend API** : http://localhost:8080/api
- **Prometheus** : http://localhost:9090
- **PostgreSQL** : localhost:5432

## Commandes utiles

```powershell
# Voir tous les conteneurs
docker ps -a

# Voir les logs en temps réel
docker-compose logs -f

# Redémarrer un service spécifique
docker-compose restart backend
docker-compose restart frontend

# Entrer dans un conteneur
docker exec -it institut-backend sh
docker exec -it institut-frontend sh
```
