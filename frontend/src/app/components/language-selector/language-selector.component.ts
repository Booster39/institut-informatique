import { Component, HostListener } from '@angular/core';
import { CommonModule } from '@angular/common';
import { LanguageService, Language } from '../../services/language.service';

@Component({
  selector: 'app-language-selector',
  standalone: true,
  imports: [CommonModule],
  template: `
    <div class="language-selector">
      <button 
        class="lang-btn"
        (click)="open = !open"
        [attr.aria-label]="'Langue: ' + getCurrentLang().name">
        🌐
      </button>
      <div class="lang-dropdown" *ngIf="open">
        <button 
          *ngFor="let lang of languages" 
          [class.active]="currentLanguage === lang.code"
          (click)="selectLanguage(lang.code); open = false"
          [attr.aria-label]="lang.name">
          <span class="lang-flag">{{ lang.flag }}</span>
          <span class="lang-name">{{ lang.name }}</span>
        </button>
      </div>
    </div>
  `,
  styles: [`
    .language-selector {
      position: relative;
    }
    
    .lang-btn {
      width: 44px;
      height: 44px;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 1.5rem;
      border: 1px solid rgba(255, 255, 255, 0.2);
      background: rgba(255, 255, 255, 0.08);
      border-radius: 50%;
      cursor: pointer;
      transition: background 0.2s, transform 0.2s;
    }
    
    .lang-btn:hover {
      background: rgba(255, 255, 255, 0.15);
      transform: scale(1.05);
    }
    
    .lang-dropdown {
      position: absolute;
      top: calc(100% + 8px);
      right: 0;
      display: flex;
      flex-direction: column;
      gap: 4px;
      padding: 6px;
      background: rgba(26, 26, 46, 0.98);
      border: 1px solid rgba(255, 255, 255, 0.1);
      border-radius: 12px;
      box-shadow: 0 8px 24px rgba(0, 0, 0, 0.3);
    }
    
    .lang-dropdown button {
      display: flex;
      align-items: center;
      gap: 0.5rem;
      padding: 0.5rem 1rem;
      min-width: 140px;
      border: none;
      background: transparent;
      border-radius: 10px;
      cursor: pointer;
      font-size: 0.95rem;
      color: white;
      transition: background 0.2s;
    }
    
    .lang-dropdown button:hover {
      background: rgba(255, 255, 255, 0.1);
    }
    
    .lang-dropdown button.active {
      background: rgba(0, 212, 255, 0.2);
    }
    
    .lang-flag { font-size: 1.3rem; }
  `]
})
export class LanguageSelectorComponent {
  open = false;
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

  getCurrentLang() {
    return this.languages.find(l => l.code === this.currentLanguage) ?? this.languages[0];
  }

  selectLanguage(lang: Language): void {
    this.languageService.setLanguage(lang);
  }

  @HostListener('document:click', ['$event'])
  onDocumentClick(event: Event): void {
    const target = event.target as HTMLElement;
    if (!target.closest('.language-selector')) {
      this.open = false;
    }
  }
}
