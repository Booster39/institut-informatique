import { Component, OnInit } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { LanguageService } from '../../services/language.service';

const HERO_TITLE = {
  fr: 'Développeur en 9 modules : Réalise ton site et ton application',
  en: 'Developer in 9 modules: Build your site and your app',
  ar: 'مطوّر في 9 وحدات: أنشئ موقعك وتطبيقك'
} as const;

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [RouterModule, CommonModule],
  template: `
    <div class="home-container">
      <section class="hero">
        <div class="container">
          <h1>{{ getTitle() }}</h1>
          <p class="subtitle">{{ getSubtitle() }}</p>
          <a routerLink="/courses" class="cta-button">{{ getCTA() }}</a>
        </div>
      </section>
      
      <section class="features">
        <div class="container">
          <h2>{{ getFeaturesTitle() }}</h2>
          <div class="features-grid">
            <div class="feature-card" *ngFor="let feature of getFeatures()">
              <div class="feature-icon">{{ feature.icon }}</div>
              <h3>{{ feature.title }}</h3>
              <p>{{ feature.description }}</p>
            </div>
          </div>
        </div>
      </section>
    </div>
  `,
  styles: [`
    .home-container {
      min-height: calc(100vh - 200px);
    }
    
    .hero {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
      padding: 5rem 0;
      text-align: center;
    }
    
    .hero h1 {
      font-size: 3rem;
      margin-bottom: 1rem;
    }
    
    .subtitle {
      font-size: 1.5rem;
      margin-bottom: 2rem;
    }
    
    .cta-button {
      display: inline-block;
      padding: 1rem 2rem;
      background: white;
      color: #667eea;
      text-decoration: none;
      border-radius: 8px;
      font-weight: bold;
      transition: transform 0.3s;
    }
    
    .cta-button:hover {
      transform: scale(1.05);
    }
    
    .features {
      padding: 4rem 0;
    }
    
    .features h2 {
      text-align: center;
      margin-bottom: 3rem;
      font-size: 2.5rem;
    }
    
    .features-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
      gap: 2rem;
    }
    
    .feature-card {
      padding: 2rem;
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0,0,0,0.1);
      text-align: center;
    }
    
    .feature-icon {
      font-size: 3rem;
      margin-bottom: 1rem;
    }
  `]
})
export class HomeComponent implements OnInit {
  constructor(public languageService: LanguageService) {}

  ngOnInit(): void {}

  getTitle(): string {
    const lang = this.languageService.getCurrentLanguage();
    return HERO_TITLE[lang] ?? HERO_TITLE.fr;
  }

  getSubtitle(): string {
    const lang = this.languageService.getCurrentLanguage();
    const subtitles = {
      fr: 'Apprenez Java Spring Boot, Angular, Docker, Kubernetes, AWS et plus encore',
      en: 'Learn Java Spring Boot, Angular, Docker, Kubernetes, AWS and more',
      ar: 'تعلم Java Spring Boot و Angular و Docker و Kubernetes و AWS والمزيد'
    };
    return subtitles[lang];
  }

  getCTA(): string {
    const lang = this.languageService.getCurrentLanguage();
    const ctas = {
      fr: 'Commencer l\'apprentissage',
      en: 'Start Learning',
      ar: 'ابدأ التعلم'
    };
    return ctas[lang];
  }

  getFeaturesTitle(): string {
    const lang = this.languageService.getCurrentLanguage();
    const titles = {
      fr: 'Pourquoi choisir notre plateforme ?',
      en: 'Why choose our platform?',
      ar: 'لماذا تختار منصتنا؟'
    };
    return titles[lang];
  }

  getFeatures(): any[] {
    const lang = this.languageService.getCurrentLanguage();
    const features = {
      fr: [
        { icon: '📚', title: 'Cours Complets', description: 'Parcours structuré en 9 modules' },
        { icon: '💻', title: 'Pratique', description: 'Exercices et projets réels' },
        { icon: '🌍', title: 'Multilingue', description: 'Français, Anglais, Arabe' },
        { icon: '✅', title: 'QCM & Corrigés', description: 'Évaluation continue' }
      ],
      en: [
        { icon: '📚', title: 'Complete Courses', description: 'Structured 9-module program' },
        { icon: '💻', title: 'Hands-on', description: 'Real exercises and projects' },
        { icon: '🌍', title: 'Multilingual', description: 'French, English, Arabic' },
        { icon: '✅', title: 'Quizzes & Solutions', description: 'Continuous assessment' }
      ],
      ar: [
        { icon: '📚', title: 'دورات كاملة', description: 'برنامج منظم في 9 وحدات' },
        { icon: '💻', title: 'عملي', description: 'تمارين ومشاريع حقيقية' },
        { icon: '🌍', title: 'متعدد اللغات', description: 'الفرنسية والإنجليزية والعربية' },
        { icon: '✅', title: 'اختبارات وحلول', description: 'تقييم مستمر' }
      ]
    };
    return features[lang];
  }
}
