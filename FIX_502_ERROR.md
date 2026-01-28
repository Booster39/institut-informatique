# Résolution de l'erreur 502 Bad Gateway

## Problème
L'erreur **502 Bad Gateway** signifie que Nginx (frontend) ne peut pas se connecter au backend Spring Boot.

## Diagnostic rapide

Exécutez le script de diagnostic :
```powershell
.\check-backend.ps1
```

Ce script vérifie :
- ✅ Si le conteneur backend est en cours d'exécution
- ✅ Si le backend répond sur le port 8080
- ✅ Si le frontend peut se connecter au backend via le réseau Docker
- ✅ Si l'API `/api/courses` fonctionne

## Solutions étape par étape

### Solution 1 : Vérifier que le backend est démarré

```powershell
# Vérifier l'état des conteneurs
docker-compose ps

# Le backend doit être "Up" (pas "Exited" ou "Restarting")
```

Si le backend n'est pas démarré :
```powershell
# Redémarrer le backend
docker-compose restart backend

# Ou redémarrer tous les services
docker-compose up -d
```

### Solution 2 : Vérifier les logs du backend

```powershell
# Voir les logs du backend
docker-compose logs backend

# Suivre les logs en temps réel
docker-compose logs -f backend
```

**Recherchez :**
- ✅ `Started InstitutApplication` → Backend démarré avec succès
- ❌ `Unable to access jarfile app.jar` → Problème de build
- ❌ `Connection refused` ou `Connection timeout` → Problème de connexion à PostgreSQL
- ❌ Erreurs de compilation Java → Problème de code

### Solution 3 : Tester le backend directement

```powershell
# Tester l'endpoint de santé
curl http://localhost:8080/actuator/health

# Tester l'API des cours
curl http://localhost:8080/api/courses
```

**Si ces commandes échouent :**
- Le backend n'est pas accessible depuis l'hôte
- Vérifiez que le port 8080 n'est pas utilisé par un autre service
- Vérifiez les logs du backend pour les erreurs

### Solution 4 : Vérifier la connexion frontend → backend

```powershell
# Tester depuis le conteneur frontend
docker exec -it institut-frontend wget -O- http://backend:8080/actuator/health
```

**Si cette commande échoue :**
- Le réseau Docker ne fonctionne pas correctement
- Le backend n'est pas dans le même réseau que le frontend
- Le nom "backend" n'est pas résolu

### Solution 5 : Reconstruire et redémarrer

```powershell
# Arrêter tous les services
docker-compose down

# Reconstruire les images
docker-compose build --no-cache

# Redémarrer tous les services
docker-compose up -d

# Attendre que le backend soit prêt (environ 30-60 secondes)
Start-Sleep -Seconds 30

# Vérifier les logs
docker-compose logs backend
```

### Solution 6 : Vérifier la configuration réseau

```powershell
# Vérifier que les conteneurs sont dans le même réseau
docker network inspect institut-network

# Vous devriez voir :
# - institut-backend
# - institut-frontend
# - institut-postgres
```

Si un conteneur manque :
```powershell
# Recréer le réseau
docker-compose down
docker-compose up -d
```

### Solution 7 : Vérifier la base de données

Le backend doit pouvoir se connecter à PostgreSQL :

```powershell
# Vérifier que PostgreSQL est démarré
docker-compose ps postgres

# Tester la connexion depuis le backend
docker exec -it institut-backend sh
# Dans le conteneur :
wget -O- http://postgres:5432
```

## Erreurs courantes

### Erreur : "Connection refused" dans les logs du backend
**Cause** : Le backend ne peut pas se connecter à PostgreSQL

**Solution** :
1. Vérifiez que PostgreSQL est démarré : `docker-compose ps postgres`
2. Vérifiez la variable d'environnement `SPRING_DATASOURCE_URL` dans `docker-compose.yml`
3. Elle doit être : `jdbc:postgresql://postgres:5432/institut_db` (pas `localhost`)

### Erreur : "Unable to access jarfile app.jar"
**Cause** : Le JAR n'est pas trouvé dans le conteneur

**Solution** :
```powershell
# Reconstruire l'image backend
docker-compose build --no-cache backend
docker-compose up -d backend
```

### Erreur : Backend démarre puis s'arrête immédiatement
**Cause** : Erreur au démarrage de Spring Boot

**Solution** :
1. Vérifiez les logs : `docker-compose logs backend`
2. Recherchez les erreurs de démarrage
3. Vérifiez la configuration dans `application.yml`

### Erreur : "502 Bad Gateway" persiste après redémarrage
**Cause** : Le frontend démarre avant que le backend soit prêt

**Solution** :
- Le `depends_on` avec `condition: service_healthy` devrait résoudre cela
- Attendez 30-60 secondes après `docker-compose up -d` pour que le backend soit prêt

## Vérification finale

Une fois les corrections appliquées :

1. **Vérifiez que tous les conteneurs sont "Up"** :
   ```powershell
   docker-compose ps
   ```

2. **Testez l'API directement** :
   ```powershell
   curl http://localhost:8080/api/courses
   ```

3. **Ouvrez le frontend** :
   - Allez sur http://localhost:4200/courses
   - Ouvrez la console (F12)
   - Vérifiez qu'il n'y a plus d'erreur 502

4. **Vérifiez les logs** :
   ```powershell
   docker-compose logs -f
   ```

## Corrections apportées

✅ **Healthcheck ajouté au backend** : Le frontend attend que le backend soit prêt
✅ **Configuration Nginx améliorée** : Timeouts plus courts et meilleure gestion d'erreurs
✅ **Script de diagnostic** : `check-backend.ps1` pour diagnostiquer rapidement
