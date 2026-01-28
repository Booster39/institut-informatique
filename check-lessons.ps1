# Script pour vérifier les leçons manquantes par cours
Write-Host "=== Vérification des leçons par cours ===" -ForegroundColor Cyan
Write-Host ""

# Vérifier que PostgreSQL est démarré
Write-Host "1. Vérification de PostgreSQL..." -ForegroundColor Yellow
$postgresStatus = docker ps --filter "name=institut-postgres" --format "{{.Status}}"
if (-not $postgresStatus) {
    Write-Host "   ERREUR: PostgreSQL n'est pas démarré!" -ForegroundColor Red
    exit 1
}
Write-Host "   PostgreSQL: $postgresStatus" -ForegroundColor Green
Write-Host ""

# Pour chaque cours, compter les leçons
Write-Host "2. Nombre de leçons par cours..." -ForegroundColor Yellow
$courses = docker exec institut-postgres psql -U institut_user -d institut_db -t -c "SELECT id, title_fr, order_index FROM courses ORDER BY order_index;"

foreach ($line in $courses) {
    if ($line.Trim()) {
        $parts = $line -split '\|'
        if ($parts.Length -ge 3) {
            $courseId = $parts[0].Trim()
            $title = $parts[1].Trim()
            $orderIndex = $parts[2].Trim()
            
            $lessonCount = docker exec institut-postgres psql -U institut_user -d institut_db -t -c "SELECT COUNT(*) FROM lessons WHERE course_id = $courseId;"
            $lessonCount = $lessonCount.Trim()
            
            Write-Host "   Cours $orderIndex ($courseId): $title - $lessonCount leçon(s)" -ForegroundColor $(if ([int]$lessonCount -eq 0) { "Red" } elseif ([int]$lessonCount -lt 3) { "Yellow" } else { "Green" })
        }
    }
}
Write-Host ""

# Afficher les détails pour chaque cours
Write-Host "3. Détails des leçons par cours..." -ForegroundColor Yellow
for ($i = 1; $i -le 11; $i++) {
    Write-Host "   Cours $i :" -ForegroundColor Cyan
    $lessons = docker exec institut-postgres psql -U institut_user -d institut_db -t -c "SELECT order_index, title_fr FROM lessons WHERE course_id = $i ORDER BY order_index;"
    if ($lessons.Trim()) {
        foreach ($lesson in $lessons) {
            if ($lesson.Trim()) {
                $parts = $lesson -split '\|'
                if ($parts.Length -ge 2) {
                    $order = $parts[0].Trim()
                    $title = $parts[1].Trim()
                    Write-Host "     - Leçon $order : $title" -ForegroundColor White
                }
            }
        }
    } else {
        Write-Host "     Aucune leçon" -ForegroundColor Red
    }
    Write-Host ""
}

Write-Host "=== Fin de la vérification ===" -ForegroundColor Cyan
