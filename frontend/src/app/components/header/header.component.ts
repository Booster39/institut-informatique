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
        <a routerLink="/" class="logo">
          <div class="logo-img-wrap">
            <img src="assets/institut-logo.png" alt="Institut" class="logo-img" />
          </div>
          <div class="logo-text">
            <h1>L'Institut de l'informatique</h1>
            <h2>مركز الحاسوبي</h2>
          </div>
        </a>
        <app-language-selector></app-language-selector>
      </div>
    </header>
  `,
  styles: [`
    .header {
      background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
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
    
    .logo {
      display: flex;
      align-items: center;
      gap: 0.75rem;
      text-decoration: none;
      color: inherit;
    }
    .logo-img-wrap {
      display: flex;
      align-items: center;
      justify-content: center;
      width: 64px;
      height: 64px;
      padding: 8px;
      background: rgba(255, 255, 255, 0.06);
      border: 1px solid rgba(255, 255, 255, 0.1);
      border-radius: 50%;
      overflow: hidden;
      transition: background 0.3s, border-color 0.3s, transform 0.2s;
    }
    .logo:hover .logo-img-wrap {
      background: rgba(255, 255, 255, 0.1);
      border-color: rgba(255, 255, 255, 0.15);
      transform: scale(1.03);
    }
    .logo-img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }
    .logo-text { line-height: 1.2; }
    .logo h1 {
      margin: 0;
      font-size: 1.25rem;
    }
    .logo h2 {
      margin: 0;
      font-size: 1rem;
      font-weight: normal;
      opacity: 0.9;
    }
    
  `]
})
export class HeaderComponent {
  constructor(public languageService: LanguageService) {}
}
