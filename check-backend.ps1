# Script pour vérifier l'état du backend
Write-Host "=== Vérification du Backend ===" -ForegroundColor Cyan
Write-Host ""

# 1. Vérifier si le conteneur backend est en cours d'exécution
Write-Host "1. État du conteneur backend..." -ForegroundColor Yellow
$backendStatus = docker ps --filter "name=institut-backend" --format "{{.Status}}"
if ($backendStatus) {
    Write-Host "   Backend: $backendStatus" -ForegroundColor Green
} else {
    Write-Host "   ERREUR: Le conteneur backend n'est pas en cours d'exécution!" -ForegroundColor Red
    Write-Host "   Essayez: docker-compose up -d backend" -ForegroundColor Yellow
    exit 1
}
Write-Host ""

# 2. Vérifier les logs récents du backend
Write-Host "2. Dernières lignes des logs du backend..." -ForegroundColor Yellow
docker-compose logs --tail=30 backend
Write-Host ""

# 3. Tester la connexion au backend depuis le conteneur frontend
Write-Host "3. Test de connexion depuis le frontend vers le backend..." -ForegroundColor Yellow
$testResult = docker exec institut-frontend wget -q -O- --timeout=5 http://backend:8080/actuator/health 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "   ✅ Le backend est accessible depuis le frontend" -ForegroundColor Green
    Write-Host "   Réponse: $testResult"
} else {
    Write-Host "   ❌ Le backend n'est PAS accessible depuis le frontend" -ForegroundColor Red
    Write-Host "   Erreur: $testResult"
}
Write-Host ""

# 4. Tester l'API directement depuis l'hôte
Write-Host "4. Test de l'API depuis l'hôte (localhost:8080)..." -ForegroundColor Yellow
try {
    $response = Invoke-WebRequest -Uri "http://localhost:8080/actuator/health" -Method GET -UseBasicParsing -TimeoutSec 5
    Write-Host "   ✅ Backend accessible: Status $($response.StatusCode)" -ForegroundColor Green
    Write-Host "   Réponse: $($response.Content)"
} catch {
    Write-Host "   ❌ Backend non accessible depuis l'hôte" -ForegroundColor Red
    Write-Host "   Erreur: $($_.Exception.Message)"
}
Write-Host ""

# 5. Tester l'endpoint /api/courses
Write-Host "5. Test de l'endpoint /api/courses..." -ForegroundColor Yellow
try {
    $response = Invoke-WebRequest -Uri "http://localhost:8080/api/courses" -Method GET -UseBasicParsing -TimeoutSec 5
    Write-Host "   ✅ API /api/courses accessible: Status $($response.StatusCode)" -ForegroundColor Green
    $courses = $response.Content | ConvertFrom-Json
    Write-Host "   Nombre de cours: $($courses.Count)"
} catch {
    Write-Host "   ❌ API /api/courses non accessible" -ForegroundColor Red
    Write-Host "   Erreur: $($_.Exception.Message)"
}
Write-Host ""

# 6. Vérifier le réseau Docker
Write-Host "6. Vérification du réseau Docker..." -ForegroundColor Yellow
$networkCheck = docker network inspect institut-network 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "   ✅ Le réseau institut-network existe" -ForegroundColor Green
    $backendInNetwork = $networkCheck | Select-String "institut-backend"
    $frontendInNetwork = $networkCheck | Select-String "institut-frontend"
    if ($backendInNetwork) {
        Write-Host "   ✅ Backend est dans le réseau" -ForegroundColor Green
    } else {
        Write-Host "   ❌ Backend n'est PAS dans le réseau" -ForegroundColor Red
    }
    if ($frontendInNetwork) {
        Write-Host "   ✅ Frontend est dans le réseau" -ForegroundColor Green
    } else {
        Write-Host "   ❌ Frontend n'est PAS dans le réseau" -ForegroundColor Red
    }
} else {
    Write-Host "   ❌ Le réseau institut-network n'existe pas" -ForegroundColor Red
    Write-Host "   Essayez: docker-compose up -d" -ForegroundColor Yellow
}
Write-Host ""

Write-Host "=== Fin de la vérification ===" -ForegroundColor Cyan
Write-Host ""
Write-Host "Si le backend n'est pas accessible, essayez:" -ForegroundColor Yellow
Write-Host "  docker-compose restart backend"
Write-Host "  docker-compose logs -f backend"
