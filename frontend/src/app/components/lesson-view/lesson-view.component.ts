import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { CommonModule } from '@angular/common';
import { LessonService, Lesson } from '../../services/lesson.service';
import { LanguageService } from '../../services/language.service';
import { CodeEditorComponent } from '../code-editor/code-editor.component';

@Component({
  selector: 'app-lesson-view',
  standalone: true,
  imports: [CommonModule, CodeEditorComponent],
  template: `
    <div class="lesson-container">
      <div class="container">
        <h1>{{ getLessonTitle() }}</h1>
        
        <div class="lesson-content">
          <div class="content-section" *ngIf="lesson">
            <h2>{{ getContentTitle() }}</h2>
            <div class="content-text" [innerHTML]="getContentFormatted()"></div>
          </div>
          
          <div class="key-points" *ngIf="getKeyPoints()">
            <h2>{{ getKeyPointsTitle() }}</h2>
            <ul>
              <li *ngFor="let point of getKeyPointsArray()">{{ point }}</li>
            </ul>
          </div>
          
          <div class="analogies" *ngIf="getAnalogies()">
            <h2>{{ getAnalogiesTitle() }}</h2>
            <p class="analogies-text" [innerHTML]="getAnalogiesFormatted()"></p>
          </div>
          
          <div class="examples" *ngIf="getExamples()">
            <h2>{{ getExamplesTitle() }}</h2>
            <div class="examples-text" [innerHTML]="getExamplesFormatted()"></div>
          </div>
          
          <app-code-editor *ngIf="lesson && lesson.codeBlocks && lesson.codeBlocks.length > 0" [codeBlocks]="lesson.codeBlocks"></app-code-editor>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .lesson-container {
      padding: 2rem 0;
      min-height: calc(100vh - 200px);
    }
    
    .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 0 2rem;
    }
    
    .lesson-content {
      background: white;
      border-radius: 8px;
      padding: 2rem;
      box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    }
    
    .content-section,
    .key-points,
    .analogies,
    .examples {
      margin-bottom: 2rem;
    }
    
    h2 {
      color: #667eea;
      margin-bottom: 1rem;
    }
    
    ul {
      list-style-type: disc;
      padding-left: 2rem;
    }
    
    li {
      margin-bottom: 0.5rem;
    }
    
    .content-text,
    .analogies-text,
    .examples-text {
      white-space: pre-line;
      line-height: 1.6;
    }
  `]
})
export class LessonViewComponent implements OnInit {
  lesson: Lesson | null = null;

  constructor(
    private route: ActivatedRoute,
    private lessonService: LessonService,
    public languageService: LanguageService
  ) {}

  ngOnInit(): void {
    const id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.loadLesson(+id);
    }
  }

  loadLesson(id: number): void {
    this.lessonService.getLessonById(id).subscribe({
      next: (lesson) => {
        this.lesson = lesson;
      },
      error: (err) => {
        console.error('Error loading lesson:', err);
      }
    });
  }

  getLessonTitle(): string {
    if (!this.lesson) return '';
    return this.languageService.getText(this.lesson);
  }

  getContent(): string {
    if (!this.lesson) return '';
    return this.languageService.getContent(this.lesson);
  }

  getContentFormatted(): string {
    const content = this.getContent();
    // Convertir les sauts de ligne en <br> pour l'affichage HTML
    // Échapper d'abord les caractères HTML pour éviter les injections
    return content
      .replace(/&/g, '&amp;')
      .replace(/</g, '&lt;')
      .replace(/>/g, '&gt;')
      .replace(/\n/g, '<br>');
  }

  getKeyPoints(): string {
    if (!this.lesson) return '';
    const lang = this.languageService.getCurrentLanguage();
    const key = `keyPoints${lang.charAt(0).toUpperCase() + lang.slice(1)}` as keyof Lesson;
    const points = (this.lesson[key] as string) || '';
    // Convertir les \n littéraux en vrais sauts de ligne
    return this.languageService.convertNewlines(points);
  }

  getKeyPointsArray(): string[] {
    let points = this.getKeyPoints();
    if (!points) return [];
    
    // S'assurer que les \n sont convertis
    // Si on voit encore des \n littéraux (backslash + n), les convertir
    if (points.includes('\\n')) {
      points = this.languageService.convertNewlines(points);
    }
    
    // Diviser par les vrais sauts de ligne
    return points.split('\n').filter(p => p.trim());
  }

  getAnalogies(): string {
    if (!this.lesson) return '';
    const lang = this.languageService.getCurrentLanguage();
    const key = `analogies${lang.charAt(0).toUpperCase() + lang.slice(1)}` as keyof Lesson;
    const analogies = (this.lesson[key] as string) || '';
    // Convertir les \n littéraux en vrais sauts de ligne
    return this.languageService.convertNewlines(analogies);
  }

  getExamples(): string {
    if (!this.lesson) return '';
    const lang = this.languageService.getCurrentLanguage();
    const key = `examples${lang.charAt(0).toUpperCase() + lang.slice(1)}` as keyof Lesson;
    const examples = (this.lesson[key] as string) || '';
    // Convertir les \n littéraux en vrais sauts de ligne
    return this.languageService.convertNewlines(examples);
  }

  getAnalogiesFormatted(): string {
    let analogies = this.getAnalogies();
    if (!analogies) return '';
    
    // S'assurer que les \n sont convertis
    // Si on voit encore des \n littéraux (backslash + n), les convertir
    if (analogies.includes('\\n')) {
      analogies = this.languageService.convertNewlines(analogies);
    }
    
    // Convertir les sauts de ligne en <br> pour l'affichage HTML
    return analogies
      .replace(/&/g, '&amp;')
      .replace(/</g, '&lt;')
      .replace(/>/g, '&gt;')
      .replace(/\n/g, '<br>');
  }

  getExamplesFormatted(): string {
    let examples = this.getExamples();
    if (!examples) return '';
    
    // S'assurer que les \n sont convertis
    // Si on voit encore des \n littéraux (backslash + n), les convertir
    if (examples.includes('\\n')) {
      examples = this.languageService.convertNewlines(examples);
    }
    
    // Convertir les sauts de ligne en <br> pour l'affichage HTML
    // Préserver le formatage du code si présent
    return examples
      .replace(/&/g, '&amp;')
      .replace(/</g, '&lt;')
      .replace(/>/g, '&gt;')
      .replace(/\n/g, '<br>');
  }

  getContentTitle(): string {
    const lang = this.languageService.getCurrentLanguage();
    const titles = { fr: 'Contenu', en: 'Content', ar: 'المحتوى' };
    return titles[lang];
  }

  getKeyPointsTitle(): string {
    const lang = this.languageService.getCurrentLanguage();
    const titles = { fr: 'Points clés', en: 'Key Points', ar: 'النقاط الرئيسية' };
    return titles[lang];
  }

  getAnalogiesTitle(): string {
    const lang = this.languageService.getCurrentLanguage();
    const titles = { fr: 'Analogies', en: 'Analogies', ar: 'التشبيهات' };
    return titles[lang];
  }

  getExamplesTitle(): string {
    const lang = this.languageService.getCurrentLanguage();
    const titles = { fr: 'Exemples', en: 'Examples', ar: 'أمثلة' };
    return titles[lang];
  }
}
