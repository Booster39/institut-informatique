# Script de test pour vérifier l'API
Write-Host "=== Test de l'API de l'Institut ===" -ForegroundColor Cyan
Write-Host ""

# Test 1: Vérifier que les conteneurs sont démarrés
Write-Host "1. Vérification des conteneurs..." -ForegroundColor Yellow
docker-compose ps
Write-Host ""

# Test 2: Vérifier les logs du backend
Write-Host "2. Dernières lignes des logs du backend..." -ForegroundColor Yellow
docker-compose logs --tail=20 backend
Write-Host ""

# Test 3: Tester l'API directement
Write-Host "3. Test de l'API /api/courses..." -ForegroundColor Yellow
try {
    $response = Invoke-WebRequest -Uri "http://localhost:8080/api/courses" -Method GET -UseBasicParsing
    Write-Host "Status: $($response.StatusCode)" -ForegroundColor Green
    Write-Host "Nombre de cours: $($response.Content | ConvertFrom-Json | Measure-Object | Select-Object -ExpandProperty Count)"
    Write-Host "Réponse (premiers 500 caractères):"
    Write-Host $response.Content.Substring(0, [Math]::Min(500, $response.Content.Length))
} catch {
    Write-Host "ERREUR: Impossible de se connecter à l'API" -ForegroundColor Red
    Write-Host $_.Exception.Message
}
Write-Host ""

# Test 4: Vérifier la base de données
Write-Host "4. Vérification de la base de données..." -ForegroundColor Yellow
$dbCheck = docker exec institut-postgres psql -U institut_user -d institut_db -t -c "SELECT COUNT(*) FROM courses;"
Write-Host "Nombre de cours dans la base: $dbCheck"
Write-Host ""

# Test 5: Vérifier le frontend
Write-Host "5. Test du frontend..." -ForegroundColor Yellow
try {
    $frontendResponse = Invoke-WebRequest -Uri "http://localhost:4200" -Method GET -UseBasicParsing
    Write-Host "Frontend accessible: Status $($frontendResponse.StatusCode)" -ForegroundColor Green
} catch {
    Write-Host "ERREUR: Frontend non accessible" -ForegroundColor Red
}
Write-Host ""

Write-Host "=== Fin des tests ===" -ForegroundColor Cyan
Write-Host ""
Write-Host "Si l'API ne répond pas, essayez:" -ForegroundColor Yellow
Write-Host "  docker-compose down"
Write-Host "  docker-compose up -d --build"
Write-Host "  docker-compose logs -f backend"
