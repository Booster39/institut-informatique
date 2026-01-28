package com.institut.util;

/**
 * Utilitaires pour le traitement du texte, notamment la conversion des \n littéraux
 */
public class TextUtils {
    
    /**
     * Convertit les \n littéraux (backslash + n) en vrais sauts de ligne
     * PostgreSQL stocke '\n' comme la chaîne littérale "\n" (deux caractères)
     * Cette méthode les convertit en vrais caractères de nouvelle ligne
     */
    public static String convertLiteralNewlines(String text) {
        if (text == null || text.isEmpty()) {
            return text;
        }
        
        // Convertir les séquences littérales \n en vrais sauts de ligne
        // PostgreSQL stocke '\n' comme la chaîne littérale "\n" (backslash + n)
        String result = text;
        
        // Gérer \\\\n (quatre backslashes + n - très rare, JSON double échappé)
        result = result.replace("\\\\\\\\n", "\n");
        
        // Gérer \\n (deux backslashes + n - format depuis SQL échappé dans JSON)
        result = result.replace("\\\\n", "\n");
        
        // Gérer \n (un backslash + n - format standard)
        result = result.replace("\\n", "\n");
        
        return result;
    }
}
