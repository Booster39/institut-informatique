-- Script pour supprimer les doublons de cours
-- À exécuter dans PostgreSQL pour nettoyer la base de données

-- Supprimer les doublons en gardant seulement le premier cours de chaque order_index
DELETE FROM courses
WHERE id NOT IN (
    SELECT MIN(id)
    FROM courses
    GROUP BY order_index
);

-- Vérifier le résultat
SELECT order_index, COUNT(*) as count
FROM courses
GROUP BY order_index
HAVING COUNT(*) > 1;

-- Si cette requête ne retourne rien, tous les doublons ont été supprimés
