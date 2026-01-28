# Dépannage : Erreur API - Aucun cours ne s'affiche

## Problème
Message d'erreur : "Erreur lors du chargement des cours. Vérifiez que le backend est démarré et que l'API répond."

## Solutions étape par étape

### 1. Vérifier que Docker Desktop est démarré

Sur Windows, assurez-vous que Docker Desktop est en cours d'exécution :
- Ouvrez Docker Desktop
- Attendez que l'icône dans la barre des tâches soit verte

### 2. Vérifier l'état des conteneurs

```powershell
docker-compose ps
```

Tous les conteneurs doivent être en état "Up" :
- `institut-postgres` : Up (healthy)
- `institut-backend` : Up
- `institut-frontend` : Up

### 3. Vérifier les logs du backend

```powershell
docker-compose logs backend
```

Recherchez :
- ✅ `Started InstitutApplication` (démarrage réussi)
- ❌ Erreurs de connexion à la base de données
- ❌ Erreurs de compilation

### 4. Tester l'API directement

Ouvrez dans votre navigateur :
```
http://localhost:8080/api/courses
```

Vous devriez voir une réponse JSON avec les cours.

### 5. Vérifier la console du navigateur

1. Ouvrez http://localhost:4200/courses
2. Appuyez sur F12
3. Allez dans l'onglet "Console"
4. Allez dans l'onglet "Network"
5. Rechargez la page
6. Cherchez la requête vers `/api/courses`
7. Cliquez dessus et vérifiez :
   - Status : doit être 200 OK
   - Response : doit contenir un tableau de cours

### 6. Vérifier la configuration Nginx

```powershell
docker exec -it institut-frontend cat /etc/nginx/conf.d/default.conf
```

Vérifiez que la section `/api` proxy vers `http://backend:8080`.

### 7. Redémarrer les services

```powershell
# Arrêter tous les services
docker-compose down

# Reconstruire et redémarrer
docker-compose up -d --build

# Suivre les logs en temps réel
docker-compose logs -f
```

### 8. Vérifier la base de données

```powershell
# Se connecter à PostgreSQL
docker exec -it institut-postgres psql -U institut_user -d institut_db

# Dans psql, vérifier les cours
SELECT COUNT(*) FROM courses;
SELECT id, title_fr, order_index FROM courses ORDER BY order_index LIMIT 5;
```

### 9. Vérifier la connexion backend -> base de données

Le backend doit se connecter à `postgres:5432` (nom du service Docker), pas à `localhost:5432`.

Vérifiez dans `docker-compose.yml` que les variables d'environnement sont correctes :
```yaml
backend:
  environment:
    SPRING_DATASOURCE_URL: jdbc:postgresql://postgres:5432/institut_db
    SPRING_DATASOURCE_USERNAME: institut_user
    SPRING_DATASOURCE_PASSWORD: institut_password
```

### 10. Erreurs courantes et solutions

#### Erreur : "Connection refused" ou "Connection timeout"
- **Cause** : Le backend ne peut pas se connecter à PostgreSQL
- **Solution** : Vérifiez que `SPRING_DATASOURCE_URL` utilise `postgres:5432` (pas `localhost`)

#### Erreur : "Unable to access jarfile app.jar"
- **Cause** : Le JAR n'est pas trouvé dans le conteneur
- **Solution** : Reconstruisez l'image : `docker-compose build backend`

#### Erreur : "404 Not Found" sur `/api/courses`
- **Cause** : Le contrôleur n'est pas accessible ou la route est incorrecte
- **Solution** : Vérifiez les logs du backend pour les erreurs de démarrage

#### Erreur : "CORS policy" dans la console
- **Cause** : Problème de configuration CORS
- **Solution** : Vérifiez `SecurityConfig.java` et `@CrossOrigin` sur les contrôleurs

## Test rapide

1. Ouvrez http://localhost:8080/api/courses dans votre navigateur
2. Si vous voyez du JSON → Le backend fonctionne
3. Ouvrez http://localhost:4200/courses
4. Ouvrez la console (F12) → Network
5. Vérifiez la requête `/api/courses` :
   - Si 200 OK → Tout fonctionne
   - Si 500/502/503 → Problème backend
   - Si 404 → Problème de route
   - Si timeout → Problème de connexion

## Corrections apportées

✅ **Configuration base de données** : Utilisation de variables d'environnement pour Docker
✅ **Logs améliorés** : Plus de détails dans la console du navigateur
✅ **Gestion d'erreurs** : Messages d'erreur plus clairs
