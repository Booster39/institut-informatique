# Dépannage : Aucun cours ne s'affiche

## Problèmes possibles et solutions

### 1. Vérifier que le backend est démarré

```powershell
# Vérifier les conteneurs
docker-compose ps

# Vérifier les logs du backend
docker-compose logs backend
```

Le backend doit afficher :
- `Started InstitutApplication` (démarrage réussi)
- Pas d'erreur `Unable to access jarfile app.jar`

### 2. Vérifier que les données sont chargées

Les fichiers SQL sont chargés automatiquement au démarrage. Vérifiez dans les logs :

```powershell
docker-compose logs backend | Select-String "data.sql"
```

### 3. Tester l'API directement

Ouvrez dans votre navigateur ou avec curl :

```powershell
# Depuis votre machine
curl http://localhost:8080/api/courses

# Ou depuis le conteneur frontend
docker exec -it institut-frontend wget -O- http://backend:8080/api/courses
```

### 4. Vérifier la console du navigateur

1. Ouvrez http://localhost:4200
2. Appuyez sur F12 pour ouvrir les outils développeur
3. Allez dans l'onglet "Console"
4. Allez dans l'onglet "Network"
5. Rechargez la page
6. Cherchez les requêtes vers `/api/courses`

### 5. Vérifier la configuration Nginx

Le frontend doit proxy les requêtes `/api` vers le backend. Vérifiez :

```powershell
docker exec -it institut-frontend cat /etc/nginx/conf.d/default.conf
```

### 6. Redémarrer les services

```powershell
# Arrêter
docker-compose down

# Reconstruire et redémarrer
docker-compose up -d --build

# Vérifier les logs
docker-compose logs -f
```

### 7. Vérifier la base de données

```powershell
# Se connecter à PostgreSQL
docker exec -it institut-postgres psql -U institut_user -d institut_db

# Dans psql, vérifier les cours
SELECT id, title_fr, title_en FROM courses ORDER BY order_index;
```

## Corrections apportées

✅ **URLs des services Angular corrigées** : Utilisation de `/api` au lieu de `http://localhost:8080/api`
✅ **Gestion des erreurs améliorée** : Affichage de messages d'erreur dans l'interface
✅ **État de chargement** : Indicateur de chargement pendant la récupération des données

## Test rapide

1. Ouvrez http://localhost:4200
2. Ouvrez la console du navigateur (F12)
3. Allez dans l'onglet "Network"
4. Cliquez sur "Cours" dans le menu
5. Vérifiez si une requête vers `/api/courses` apparaît
6. Vérifiez la réponse (200 OK avec des données, ou erreur)
