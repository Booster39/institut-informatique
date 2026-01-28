# Script pour ajouter ON CONFLICT à tous les INSERT INTO lessons
$sqlFiles = @(
    "backend\src\main\resources\lessons_exercises_data.sql",
    "backend\src\main\resources\complete_course_content.sql",
    "backend\src\main\resources\generate_full_content.sql",
    "backend\src\main\resources\all_courses_complete_content.sql",
    "backend\src\main\resources\courses_6_to_11_content.sql",
    "backend\src\main\resources\missing_content_completion.sql"
)

Write-Host "=== Ajout de ON CONFLICT aux INSERT INTO lessons ===" -ForegroundColor Cyan
Write-Host ""

foreach ($file in $sqlFiles) {
    if (Test-Path $file) {
        Write-Host "Traitement de $file..." -ForegroundColor Yellow
        $content = Get-Content $file -Raw
        
        # Remplacer ); suivi d'une nouvelle ligne par ) ON CONFLICT (course_id, order_index) DO NOTHING;
        # Mais seulement pour les INSERT INTO lessons
        $pattern = '(INSERT INTO lessons[^;]+VALUES[^;]+\);)'
        $replacement = '$1 ON CONFLICT (course_id, order_index) DO NOTHING;'
        
        $newContent = $content -replace $pattern, $replacement
        
        # Si le contenu a changé, sauvegarder
        if ($newContent -ne $content) {
            Set-Content -Path $file -Value $newContent -NoNewline
            Write-Host "  ✅ Modifié" -ForegroundColor Green
        } else {
            Write-Host "  ⚠️  Aucun changement (peut-être déjà modifié)" -ForegroundColor Yellow
        }
    } else {
        Write-Host "  ❌ Fichier non trouvé: $file" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "=== Terminé ===" -ForegroundColor Cyan
Write-Host ""
Write-Host "Note: Ce script utilise une regex simple. Vérifiez manuellement les fichiers si nécessaire."
