import { Component, OnInit } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { LanguageService, Language } from '../../services/language.service';

const HERO_TITLE = {
  fr: 'Développeur en 1 an : Réalise tes sites et tes applications',
  en: 'Developer in 1 year: Build your sites and your apps',
  ar: 'مطوّر في 1 سنة: أنشئ مواقعك وتطبيقاتك'
} as const;

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [RouterModule, CommonModule],
  template: `
    <div class="home-container">
      <section class="hero">
        <div class="container">
          <div class="hero-logo-wrap">
            <div class="hero-logo-glow"></div>
            <div class="hero-logo-frame">
              <img src="assets/institut-logo.png" alt="Institut de l'informatique" class="hero-logo" />
            </div>
          </div>
          <h1 class="hero-title">{{ getTitle() }}</h1>
          <p class="subtitle">{{ getSubtitle() }}</p>
          <a href="#formules" class="cta-button">{{ getCTA() }}</a>
        </div>
      </section>

      <section class="institute" id="institut">
        <div class="container">
          <h2>{{ getInstituteTitle() }}</h2>
          <p class="institute-text">{{ getInstituteDescription() }}</p>
        </div>
      </section>

      <section class="modules">
        <div class="container">
          <h2>{{ getModulesTitle() }}</h2>
          <p class="modules-intro">{{ getModulesIntro() }}</p>
          <div class="modules-grid">
            <div class="module-card" *ngFor="let m of getModules()">
              <span class="module-num">{{ m.num }}</span>
              <h3>{{ m.title }}</h3>
            </div>
          </div>
        </div>
      </section>

      <section class="benefits">
        <div class="container">
          <h2>{{ getBenefitsTitle() }}</h2>
          <div class="benefits-grid">
            <div class="benefit-item" *ngFor="let b of getBenefits()">
              <span class="benefit-icon">{{ b.icon }}</span>
              <span>{{ b.text }}</span>
            </div>
          </div>
        </div>
      </section>

      <section class="formules" id="formules">
        <div class="container">
          <h2>{{ getFormulesTitle() }}</h2>
          <div class="formules-grid">
            <div class="formule-card formule-pro">
              <h3>Pro</h3>
              <p class="formule-freq">2 {{ getCoursSemaine() }}/{{ getSemaine() }}</p>
              <p class="formule-price">160€ <span>/{{ getMois() }}</span></p>
            </div>
            <div class="formule-card formule-master">
              <span class="formule-badge">{{ getPromo() }}</span>
              <h3>Master</h3>
              <p class="formule-freq">3 {{ getCoursSemaine() }}/{{ getSemaine() }}</p>
              <p class="formule-price">200€ <span>/{{ getMois() }}</span></p>
              <p class="formule-old">240€</p>
            </div>
            <div class="formule-card formule-elite">
              <span class="formule-badge">{{ getPromo() }}</span>
              <h3>Elite</h3>
              <p class="formule-freq">4 {{ getCoursSemaine() }}/{{ getSemaine() }}</p>
              <p class="formule-price">260€ <span>/{{ getMois() }}</span></p>
              <p class="formule-old">320€</p>
            </div>
          </div>
        </div>
      </section>

      <section class="creator">
        <div class="container">
          <h2>{{ getCreatorTitle() }}</h2>
          <p class="creator-text">{{ getCreatorDescription() }}</p>
        </div>
      </section>
    </div>
  `,
  styles: [`
    .home-container { min-height: calc(100vh - 200px); }

    .hero {
      background: linear-gradient(135deg, #1a1a2e 0%, #16213e 50%, #0f3460 100%);
      color: white;
      padding: 4rem 0 5rem;
      text-align: center;
    }
    .hero-logo-wrap {
      position: relative;
      display: inline-block;
      margin-bottom: 2rem;
      animation: heroLogoFadeIn 0.8s ease-out;
    }
    .hero-logo-glow {
      position: absolute;
      inset: -20px;
      background: radial-gradient(ellipse at center, rgba(0, 212, 255, 0.15) 0%, transparent 70%);
      border-radius: 50%;
      pointer-events: none;
    }
    .hero-logo-frame {
      position: relative;
      padding: 1.25rem;
      background: rgba(255, 255, 255, 0.03);
      border: 1px solid rgba(255, 255, 255, 0.08);
      border-radius: 50%;
      overflow: hidden;
      backdrop-filter: blur(8px);
      box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2), inset 0 1px 0 rgba(255, 255, 255, 0.05);
      transition: transform 0.4s ease, box-shadow 0.4s ease;
    }
    .hero-logo-wrap:hover .hero-logo-frame {
      transform: scale(1.02);
      box-shadow: 0 12px 40px rgba(0, 0, 0, 0.3), 0 0 30px rgba(0, 212, 255, 0.15);
    }
    .hero-logo {
      display: block;
      width: 180px;
      height: 180px;
      object-fit: cover;
      filter: drop-shadow(0 4px 12px rgba(0, 0, 0, 0.3));
      transition: filter 0.3s ease;
    }
    .hero-logo-wrap:hover .hero-logo {
      filter: drop-shadow(0 4px 16px rgba(0, 212, 255, 0.25));
    }
    @keyframes heroLogoFadeIn {
      from {
        opacity: 0;
        transform: scale(0.9) translateY(10px);
      }
      to {
        opacity: 1;
        transform: scale(1) translateY(0);
      }
    }
    .hero-title {
      font-size: 2.2rem;
      margin-bottom: 1rem;
      font-weight: 600;
      animation: heroContentFadeIn 0.6s ease-out 0.2s both;
    }
    .subtitle {
      font-size: 1.2rem;
      margin-bottom: 2rem;
      opacity: 0.9;
      animation: heroContentFadeIn 0.6s ease-out 0.35s both;
    }
    .hero .cta-button { animation: heroContentFadeIn 0.6s ease-out 0.5s both; }
    @keyframes heroContentFadeIn {
      from {
        opacity: 0;
        transform: translateY(15px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }
    .cta-button {
      display: inline-block;
      padding: 1rem 2.5rem;
      background: linear-gradient(135deg, #00d4ff 0%, #0099cc 100%);
      color: white;
      text-decoration: none;
      border-radius: 50px;
      font-weight: 600;
      transition: transform 0.3s, box-shadow 0.3s;
    }
    .cta-button:hover {
      transform: translateY(-2px);
      box-shadow: 0 8px 25px rgba(0, 212, 255, 0.4);
    }

    .institute {
      padding: 4rem 0;
      background: #f8fafc;
    }
    .institute h2, .modules h2, .benefits h2, .formules h2, .creator h2 {
      text-align: center;
      font-size: 2rem;
      margin-bottom: 1.5rem;
      color: #1a1a2e;
    }
    .institute-text {
      max-width: 700px;
      margin: 0 auto;
      font-size: 1.1rem;
      line-height: 1.8;
      color: #475569;
    }

    .modules { padding: 4rem 0; }
    .modules-intro {
      text-align: center;
      max-width: 600px;
      margin: 0 auto 2.5rem;
      color: #64748b;
    }
    .modules-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
      gap: 1.25rem;
    }
    .module-card {
      background: white;
      padding: 1.5rem;
      border-radius: 12px;
      box-shadow: 0 4px 15px rgba(0,0,0,0.06);
      border-left: 4px solid #0f3460;
      transition: transform 0.2s;
    }
    .module-card:hover { transform: translateY(-2px); }
    .module-num {
      display: inline-block;
      font-size: 0.85rem;
      font-weight: 700;
      color: #0f3460;
      margin-bottom: 0.5rem;
    }
    .module-card h3 { font-size: 1rem; margin: 0; color: #334155; }

    .benefits {
      padding: 4rem 0;
      background: linear-gradient(135deg, #f1f5f9 0%, #e2e8f0 100%);
    }
    .benefits-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
      gap: 1rem;
      max-width: 900px;
      margin: 0 auto;
    }
    .benefit-item {
      display: flex;
      align-items: center;
      gap: 0.75rem;
      padding: 0.75rem 1rem;
      background: white;
      border-radius: 8px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.04);
    }
    .benefit-icon { font-size: 1.5rem; }

    .formules { padding: 4rem 0; }
    .formules-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
      gap: 1.5rem;
      max-width: 1000px;
      margin: 0 auto;
    }
    .formule-card {
      padding: 2rem;
      border-radius: 16px;
      text-align: center;
      position: relative;
      color: white;
      transition: transform 0.3s;
    }
    .formule-card:hover { transform: translateY(-5px); }
    .formule-pro {
      background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%);
      box-shadow: 0 10px 30px rgba(37, 99, 235, 0.3);
    }
    .formule-master {
      background: linear-gradient(135deg, #7c3aed 0%, #6d28d9 100%);
      box-shadow: 0 10px 30px rgba(124, 58, 237, 0.3);
    }
    .formule-elite {
      background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%);
      box-shadow: 0 10px 30px rgba(15, 23, 42, 0.4);
    }
    .formule-badge {
      position: absolute;
      top: -8px;
      right: 12px;
      font-size: 0.7rem;
      font-weight: 700;
      background: rgba(255,255,255,0.3);
      padding: 0.2rem 0.5rem;
      border-radius: 6px;
    }
    .formule-card h3 { font-size: 1.5rem; margin: 0 0 0.5rem; }
    .formule-freq { font-size: 0.95rem; opacity: 0.9; margin: 0 0 0.5rem; }
    .formule-price { font-size: 2rem; font-weight: 700; margin: 0; }
    .formule-price span { font-size: 1rem; font-weight: 400; opacity: 0.9; }
    .formule-old {
      text-decoration: line-through;
      font-size: 0.9rem;
      opacity: 0.7;
      margin-top: 0.25rem;
    }

    .creator {
      background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
      padding: 4rem 0;
      text-align: center;
    }
    .creator-text {
      max-width: 700px;
      margin: 0 auto;
      font-size: 1.1rem;
      line-height: 1.8;
      color: #475569;
    }
  `]
})
export class HomeComponent implements OnInit {
  constructor(public languageService: LanguageService) {}

  ngOnInit(): void {}

  private lang(): Language { return this.languageService.getCurrentLanguage(); }

  getTitle(): string { return HERO_TITLE[this.lang()] ?? HERO_TITLE.fr; }

  getSubtitle(): string {
    const s = { fr: 'Formation complète en développement web', en: 'Complete web development training', ar: 'تدريب شامل في تطوير الويب' };
    return s[this.lang()] ?? s.fr;
  }

  getCTA(): string {
    const s = { fr: 'Voir les formules', en: 'View plans', ar: 'عرض العروض' };
    return s[this.lang()] ?? s.fr;
  }

  getInstituteTitle(): string {
    const s = { fr: "L'Institut de l'informatique", en: "The Computer Science Institute", ar: 'معهد المعلوماتية' };
    return s[this.lang()] ?? s.fr;
  }

  getInstituteDescription(): string {
    const s = {
      fr: "Un parcours structuré en 7 modules pour passer des fondations à l'architecture logicielle. Du Python à Flask, les bases de données, la sécurité JWT et le CI/CD — une formation complète pour devenir développeur web.",
      en: "A structured 7-module program from foundations to software architecture. From Python to Flask, databases, JWT security and CI/CD — complete training to become a web developer.",
      ar: 'برنامج منظم في 7 وحدات من الأساسيات إلى هندسة البرمجيات. من Python إلى Flask وقواعد البيانات وأمان JWT و CI/CD — تدريب شامل لتصبح مطور web.'
    };
    return s[this.lang()] ?? s.fr;
  }

  getModulesTitle(): string {
    const s = { fr: 'Le programme', en: 'The program', ar: 'البرنامج' };
    return s[this.lang()] ?? s.fr;
  }

  getModulesIntro(): string {
    const s = { fr: 'Un parcours progressif, de la base au niveau avancé.', en: 'A progressive path, from basics to advanced level.', ar: 'مسار تدريجي من الأساسيات إلى المستوى المتقدم.' };
    return s[this.lang()] ?? s.fr;
  }

  getModules(): { num: string; title: string }[] {
    const modules = [
      { num: '1', title: 'Application Flask basique : routes, templates, DB' },
      { num: '2', title: 'Application Flask pro : sessions, sécurité, tests' },
      { num: '3', title: 'Base de données avancées : SQLAlchemy, migrations, optimisation' },
      { num: '4', title: 'API REST et services web : JSON, authentification API, documentation' },
      { num: '5', title: 'Interface utilisateur moderne et frameworks frontend' },
      { num: '6', title: 'Déploiement et production : Docker, cloud, CI/CD' },
      { num: '7', title: 'Projet complet et optimisation : architecture, performance, bonnes pratiques' }
    ];
    return modules;
  }

  getBenefitsTitle(): string {
    const s = { fr: 'Inclus dans toutes les formules', en: 'Included in all plans', ar: 'مشمول في جميع العروض' };
    return s[this.lang()] ?? s.fr;
  }

  getBenefits(): { icon: string; text: string }[] {
    const lang = this.lang();
    const items = {
      fr: [
        { icon: '📄', text: 'PDF fournis gratuitement' },
        { icon: '👤', text: 'Cours privé, élève seul' },
        { icon: '📚', text: 'Pédagogie claire' },
        { icon: '✏️', text: 'Exercices pratiques' },
        { icon: '🎓', text: 'Formateur diplômé Master' },
        { icon: '📹', text: 'Cours en direct sur Google Meet' },
        { icon: '⏰', text: 'Horaires flexibles' }
      ],
      en: [
        { icon: '📄', text: 'Free PDF materials' },
        { icon: '👤', text: 'Private lessons, one-on-one' },
        { icon: '📚', text: 'Clear pedagogy' },
        { icon: '✏️', text: 'Practical exercises' },
        { icon: '🎓', text: 'Master-degree instructor' },
        { icon: '📹', text: 'Live classes on Google Meet' },
        { icon: '⏰', text: 'Flexible schedule' }
      ],
      ar: [
        { icon: '📄', text: 'ملفات PDF مجانية' },
        { icon: '👤', text: 'دروس خاصة، طالب واحد' },
        { icon: '📚', text: 'منهجية واضحة' },
        { icon: '✏️', text: 'تمارين عملية' },
        { icon: '🎓', text: 'مدرب حاصل على الماجستير' },
        { icon: '📹', text: 'دروس مباشرة على Google Meet' },
        { icon: '⏰', text: 'جدول مرن' }
      ]
    };
    return items[lang] ?? items.fr;
  }

  getFormulesTitle(): string {
    const s = { fr: 'Choisissez votre formule', en: 'Choose your plan', ar: 'اختر عرضك' };
    return s[this.lang()] ?? s.fr;
  }

  getCoursSemaine(): string {
    const s = { fr: 'cours', en: 'classes', ar: 'دروس' };
    return s[this.lang()] ?? s.fr;
  }
  getSemaine(): string {
    const s = { fr: 'semaine', en: 'week', ar: 'أسبوع' };
    return s[this.lang()] ?? s.fr;
  }
  getMois(): string {
    const s = { fr: 'mois', en: 'month', ar: 'شهر' };
    return s[this.lang()] ?? s.fr;
  }
  getPromo(): string {
    const s = { fr: 'Promo', en: 'Offer', ar: 'عرض' };
    return s[this.lang()] ?? s.fr;
  }

  getCreatorTitle(): string {
    const s = { fr: 'Qui conçoit cette plateforme ?', en: "Who's behind this platform?", ar: 'من يصمم هذه المنصة؟' };
    return s[this.lang()] ?? s.fr;
  }

  getCreatorDescription(): string {
    const s = {
      fr: 'Un développeur full stack basé en France, passé par l\'algorithmique, la data science et le web. Il conçoit des applications cartographiques, des tableaux de bord analytiques et cette plateforme d\'apprentissage pour partager son parcours. Convaincu qu\'on apprend en faisant et en transmettant.',
      en: 'A full stack developer based in France, from algorithms and data science to the web. He builds mapping applications, analytics dashboards and this learning platform to share his journey. Believing that we learn by doing and by teaching.',
      ar: 'مطوّر full stack مقيم في فرنسا، من الخوارزميات وعلوم البيانات إلى الويب. يبني تطبيقات خرائط ولوحات تحليلات وهذه المنصة التعليمية لمشاركة مساره. مقتنع بأننا نتعلم بالممارسة والنقل.'
    };
    return s[this.lang()] ?? s.fr;
  }
}
