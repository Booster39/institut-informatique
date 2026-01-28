import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

export type Language = 'fr' | 'en' | 'ar';

@Injectable({
  providedIn: 'root'
})
export class LanguageService {
  private currentLanguageSubject = new BehaviorSubject<Language>('fr');
  public currentLanguage$ = this.currentLanguageSubject.asObservable();

  constructor() {
    const savedLang = localStorage.getItem('language') as Language;
    if (savedLang && ['fr', 'en', 'ar'].includes(savedLang)) {
      this.currentLanguageSubject.next(savedLang);
    }
  }

  setLanguage(lang: Language): void {
    this.currentLanguageSubject.next(lang);
    localStorage.setItem('language', lang);
    this.updateDocumentDirection(lang);
  }

  getCurrentLanguage(): Language {
    return this.currentLanguageSubject.value;
  }

  private updateDocumentDirection(lang: Language): void {
    document.documentElement.dir = lang === 'ar' ? 'rtl' : 'ltr';
    document.documentElement.lang = lang;
  }

  getText(obj: any): string {
    const lang = this.getCurrentLanguage();
    const key = `title${lang.charAt(0).toUpperCase() + lang.slice(1)}` as keyof typeof obj;
    return obj[key] || obj.titleFr || '';
  }

  getContent(obj: any): string {
    const lang = this.getCurrentLanguage();
    const key = `content${lang.charAt(0).toUpperCase() + lang.slice(1)}` as keyof typeof obj;
    const content = obj[key] || obj.contentFr || '';
    // Convertir les \n littéraux (chaînes de caractères) en vrais sauts de ligne
    return this.convertNewlines(content);
  }
  
  /**
   * Convertit les \n littéraux en vrais sauts de ligne
   * Gère plusieurs formats : \n, \\n, \\\\n
   * PostgreSQL stocke \n comme la chaîne littérale "\n" (backslash + n)
   * JSON peut les échapper différemment selon le contexte
   */
  convertNewlines(text: string): string {
    if (!text || typeof text !== 'string') return '';
    
    // Convertir les séquences littérales \n en vrais sauts de ligne
    // L'ordre est important : d'abord les plus complexes, puis les simples
    let result = text;
    
    // Vérifier si on a des \n littéraux (backslash + n comme chaîne)
    // En JavaScript, quand JSON.parse reçoit "\\n", il devient "\n" (littéral)
    // Mais si PostgreSQL stocke '\n' (littéral SQL), JSON le sérialise comme "\\n"
    // Angular reçoit alors la chaîne "\\n" (deux caractères: backslash + n)
    
    // Méthode robuste : remplacer toutes les occurrences de backslash suivi de n
    // On utilise une regex globale pour capturer tous les cas
    
    // D'abord, gérer les cas avec plusieurs backslashes (échappement multiple)
    // \\\\n -> \n (quatre backslashes)
    while (result.includes('\\\\\\\\n')) {
      result = result.replace(/\\\\\\\\n/g, '\n');
    }
    
    // Ensuite, gérer \\n -> \n (deux backslashes, le cas le plus courant depuis SQL)
    // Ceci correspond à la chaîne littérale "\n" échappée dans JSON
    // On fait une boucle pour gérer les cas multiples
    while (result.includes('\\\\n')) {
      result = result.replace(/\\\\n/g, '\n');
    }
    
    // Enfin, gérer \n -> \n (un backslash, format JavaScript littéral)
    // Si jamais il reste des \n non échappés (peu probable mais possible)
    while (result.includes('\\n')) {
      result = result.replace(/\\n/g, '\n');
    }
    
    return result;
  }
}
