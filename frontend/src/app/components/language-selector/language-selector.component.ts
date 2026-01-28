import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { LanguageService, Language } from '../../services/language.service';

@Component({
  selector: 'app-language-selector',
  standalone: true,
  imports: [CommonModule],
  template: `
    <div class="language-selector">
      <button 
        *ngFor="let lang of languages" 
        [class.active]="currentLanguage === lang.code"
        (click)="selectLanguage(lang.code)"
        [attr.aria-label]="lang.name">
        {{ lang.flag }} {{ lang.name }}
      </button>
    </div>
  `,
  styles: [`
    .language-selector {
      display: flex;
      gap: 0.5rem;
    }
    
    button {
      padding: 0.5rem 1rem;
      border: 1px solid #ddd;
      background: white;
      cursor: pointer;
      border-radius: 4px;
      transition: all 0.3s;
    }
    
    button:hover {
      background: #f0f0f0;
    }
    
    button.active {
      background: #007bff;
      color: white;
      border-color: #007bff;
    }
  `]
})
export class LanguageSelectorComponent {
  languages = [
    { code: 'fr' as Language, name: 'Français', flag: '🇫🇷' },
    { code: 'en' as Language, name: 'English', flag: '🇬🇧' },
    { code: 'ar' as Language, name: 'العربية', flag: '🇸🇦' }
  ];
  
  currentLanguage: Language = 'fr';

  constructor(private languageService: LanguageService) {
    this.languageService.currentLanguage$.subscribe(lang => {
      this.currentLanguage = lang;
    });
  }

  selectLanguage(lang: Language): void {
    this.languageService.setLanguage(lang);
  }
}
