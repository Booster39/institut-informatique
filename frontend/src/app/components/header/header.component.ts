import { Component } from '@angular/core';
import { RouterModule } from '@angular/router';
import { LanguageService } from '../../services/language.service';
import { LanguageSelectorComponent } from '../language-selector/language-selector.component';

@Component({
  selector: 'app-header',
  standalone: true,
  imports: [RouterModule, LanguageSelectorComponent],
  template: `
    <header class="header">
      <div class="container">
        <div class="logo">
          <h1>L'Institut de l'informatique</h1>
          <h2>مركز الحاسوبي</h2>
        </div>
        <nav class="nav">
          <a routerLink="/" routerLinkActive="active">Accueil</a>
          <a routerLink="/courses" routerLinkActive="active">Cours</a>
        </nav>
        <app-language-selector></app-language-selector>
      </div>
    </header>
  `,
  styles: [`
    .header {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
      padding: 1rem 0;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }
    
    .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 0 2rem;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    
    .logo h1 {
      margin: 0;
      font-size: 1.5rem;
    }
    
    .logo h2 {
      margin: 0;
      font-size: 1.2rem;
      font-weight: normal;
    }
    
    .nav {
      display: flex;
      gap: 2rem;
    }
    
    .nav a {
      color: white;
      text-decoration: none;
      padding: 0.5rem 1rem;
      border-radius: 4px;
      transition: background 0.3s;
    }
    
    .nav a:hover,
    .nav a.active {
      background: rgba(255,255,255,0.2);
    }
  `]
})
export class HeaderComponent {
  constructor(public languageService: LanguageService) {}
}
