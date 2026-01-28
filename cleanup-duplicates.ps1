# Script pour nettoyer les doublons de cours dans la base de données
Write-Host "=== Nettoyage des doublons de cours ===" -ForegroundColor Cyan
Write-Host ""

# Vérifier que PostgreSQL est démarré
Write-Host "1. Vérification de PostgreSQL..." -ForegroundColor Yellow
$postgresStatus = docker ps --filter "name=institut-postgres" --format "{{.Status}}"
if (-not $postgresStatus) {
    Write-Host "   ERREUR: PostgreSQL n'est pas démarré!" -ForegroundColor Red
    Write-Host "   Démarrez d'abord: docker-compose up -d postgres" -ForegroundColor Yellow
    exit 1
}
Write-Host "   PostgreSQL: $postgresStatus" -ForegroundColor Green
Write-Host ""

# Compter les doublons avant nettoyage
Write-Host "2. Comptage des doublons avant nettoyage..." -ForegroundColor Yellow
$beforeCount = docker exec institut-postgres psql -U institut_user -d institut_db -t -c "SELECT COUNT(*) FROM courses;"
$duplicates = docker exec institut-postgres psql -U institut_user -d institut_db -t -c "SELECT COUNT(*) FROM (SELECT order_index, COUNT(*) as count FROM courses GROUP BY order_index HAVING COUNT(*) > 1) as dup;"
Write-Host "   Nombre total de cours: $beforeCount"
Write-Host "   Nombre de order_index avec doublons: $duplicates"
Write-Host ""

# Nettoyer les doublons
Write-Host "3. Suppression des doublons..." -ForegroundColor Yellow
$cleanupResult = docker exec institut-postgres psql -U institut_user -d institut_db -c @"
DELETE FROM courses
WHERE id NOT IN (
    SELECT MIN(id)
    FROM courses
    GROUP BY order_index
);
"@

if ($LASTEXITCODE -eq 0) {
    Write-Host "   ✅ Doublons supprimés avec succès" -ForegroundColor Green
} else {
    Write-Host "   ❌ Erreur lors de la suppression" -ForegroundColor Red
    exit 1
}
Write-Host ""

# Compter après nettoyage
Write-Host "4. Vérification après nettoyage..." -ForegroundColor Yellow
$afterCount = docker exec institut-postgres psql -U institut_user -d institut_db -t -c "SELECT COUNT(*) FROM courses;"
$remainingDuplicates = docker exec institut-postgres psql -U institut_user -d institut_db -t -c "SELECT COUNT(*) FROM (SELECT order_index, COUNT(*) as count FROM courses GROUP BY order_index HAVING COUNT(*) > 1) as dup;"
Write-Host "   Nombre total de cours après nettoyage: $afterCount"
Write-Host "   Nombre de doublons restants: $remainingDuplicates"
Write-Host ""

# Afficher les cours restants
Write-Host "5. Liste des cours restants..." -ForegroundColor Yellow
docker exec institut-postgres psql -U institut_user -d institut_db -c "SELECT id, order_index, title_fr FROM courses ORDER BY order_index;"
Write-Host ""

Write-Host "=== Nettoyage terminé ===" -ForegroundColor Cyan
Write-Host ""
Write-Host "Redémarrez le backend pour que les changements prennent effet:" -ForegroundColor Yellow
Write-Host "  docker-compose restart backend"
