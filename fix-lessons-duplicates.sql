-- Script pour supprimer les doublons de leçons
-- À exécuter dans PostgreSQL pour nettoyer la base de données

-- D'abord, supprimer les doublons en gardant seulement la première leçon de chaque (course_id, order_index)
DELETE FROM lessons
WHERE id NOT IN (
    SELECT MIN(id)
    FROM lessons
    GROUP BY course_id, order_index
);

-- Ensuite, créer la contrainte unique si elle n'existe pas
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint 
        WHERE conname = 'lessons_course_order_unique'
    ) THEN
        ALTER TABLE lessons ADD CONSTRAINT lessons_course_order_unique UNIQUE (course_id, order_index);
    END IF;
END $$;

-- Vérifier le résultat
SELECT course_id, order_index, COUNT(*) as count
FROM lessons
GROUP BY course_id, order_index
HAVING COUNT(*) > 1;

-- Si cette requête ne retourne rien, tous les doublons ont été supprimés
