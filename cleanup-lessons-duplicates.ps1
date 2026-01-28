# Script pour nettoyer les doublons de leçons dans la base de données
Write-Host "=== Nettoyage des doublons de leçons ===" -ForegroundColor Cyan
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
$beforeCount = docker exec institut-postgres psql -U institut_user -d institut_db -t -c "SELECT COUNT(*) FROM lessons;"
$duplicates = docker exec institut-postgres psql -U institut_user -d institut_db -t -c "SELECT COUNT(*) FROM (SELECT course_id, order_index, COUNT(*) as count FROM lessons GROUP BY course_id, order_index HAVING COUNT(*) > 1) as dup;"
Write-Host "   Nombre total de leçons: $beforeCount"
Write-Host "   Nombre de (course_id, order_index) avec doublons: $duplicates"
Write-Host ""

# Nettoyer les doublons
Write-Host "3. Suppression des doublons..." -ForegroundColor Yellow
$cleanupResult = docker exec institut-postgres psql -U institut_user -d institut_db -c @"
-- D'abord, supprimer les doublons (garder le premier de chaque groupe)
DELETE FROM lessons
WHERE id NOT IN (
    SELECT MIN(id)
    FROM lessons
    GROUP BY course_id, order_index
);

-- Ensuite, créer la contrainte unique si elle n'existe pas
DO `$`$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint 
        WHERE conname = 'lessons_course_order_unique'
    ) THEN
        ALTER TABLE lessons ADD CONSTRAINT lessons_course_order_unique UNIQUE (course_id, order_index);
    END IF;
END `$`$;
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
$afterCount = docker exec institut-postgres psql -U institut_user -d institut_db -t -c "SELECT COUNT(*) FROM lessons;"
$remainingDuplicates = docker exec institut-postgres psql -U institut_user -d institut_db -t -c "SELECT COUNT(*) FROM (SELECT course_id, order_index, COUNT(*) as count FROM lessons GROUP BY course_id, order_index HAVING COUNT(*) > 1) as dup;"
Write-Host "   Nombre total de leçons après nettoyage: $afterCount"
Write-Host "   Nombre de doublons restants: $remainingDuplicates"
Write-Host ""

# Afficher quelques leçons restantes par cours
Write-Host "5. Exemple de leçons restantes (premiers cours)..." -ForegroundColor Yellow
docker exec institut-postgres psql -U institut_user -d institut_db -c "SELECT course_id, order_index, title_fr FROM lessons WHERE course_id <= 3 ORDER BY course_id, order_index LIMIT 10;"
Write-Host ""

Write-Host "=== Nettoyage terminé ===" -ForegroundColor Cyan
Write-Host ""
Write-Host "Redémarrez le backend pour que les changements prennent effet:" -ForegroundColor Yellow
Write-Host "  docker-compose restart backend"
