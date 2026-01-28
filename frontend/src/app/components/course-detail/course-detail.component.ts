import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router, RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { CourseService, Course } from '../../services/course.service';
import { LessonService, Lesson } from '../../services/lesson.service';
import { LanguageService } from '../../services/language.service';

@Component({
  selector: 'app-course-detail',
  standalone: true,
  imports: [CommonModule, RouterModule],
  template: `
    <div class="course-detail-container">
      <div class="container">
        <button class="back-button" (click)="goBack()">← {{ getBackText() }}</button>
        
        <div *ngIf="loading" class="loading">
          {{ getLoadingText() }}
        </div>
        
        <div *ngIf="error" class="error">
          {{ error }}
        </div>
        
        <div *ngIf="!loading && !error && course">
          <h1>{{ getCourseTitle() }}</h1>
          <p class="course-description">{{ getCourseDescription() }}</p>
          
          <div class="lessons-section">
            <h2>{{ getLessonsTitle() }}</h2>
            
            <div *ngIf="lessonsLoading" class="loading">
              {{ getLoadingLessonsText() }}
            </div>
            
            <div *ngIf="!lessonsLoading && lessons.length === 0" class="no-lessons">
              {{ getNoLessonsText() }}
            </div>
            
            <div class="lessons-list" *ngIf="!lessonsLoading && lessons.length > 0">
              <div 
                class="lesson-card" 
                *ngFor="let lesson of lessons" 
                (click)="viewLesson(lesson.id)">
                <div class="lesson-header">
                  <h3>{{ getLessonTitle(lesson) }}</h3>
                  <span class="lesson-duration" *ngIf="lesson.estimatedDuration">{{ lesson.estimatedDuration }} min</span>
                </div>
                <p class="lesson-content-preview">{{ getLessonContentPreview(lesson) }}</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .course-detail-container {
      padding: 2rem 0;
      min-height: calc(100vh - 200px);
    }
    
    .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 0 2rem;
    }
    
    .back-button {
      background: #667eea;
      color: white;
      border: none;
      padding: 0.75rem 1.5rem;
      border-radius: 8px;
      cursor: pointer;
      margin-bottom: 2rem;
      font-size: 1rem;
      transition: background 0.3s;
    }
    
    .back-button:hover {
      background: #5568d3;
    }
    
    h1 {
      font-size: 2.5rem;
      margin-bottom: 1rem;
      color: #333;
    }
    
    .course-description {
      font-size: 1.2rem;
      color: #666;
      margin-bottom: 3rem;
      line-height: 1.6;
    }
    
    .lessons-section {
      margin-top: 3rem;
    }
    
    .lessons-section h2 {
      font-size: 2rem;
      margin-bottom: 2rem;
      color: #667eea;
    }
    
    .lessons-list {
      display: grid;
      gap: 1.5rem;
    }
    
    .lesson-card {
      background: white;
      border-radius: 8px;
      padding: 1.5rem;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
      cursor: pointer;
      transition: transform 0.3s, box-shadow 0.3s;
      border-left: 4px solid #667eea;
    }
    
    .lesson-card:hover {
      transform: translateX(5px);
      box-shadow: 0 4px 8px rgba(0,0,0,0.15);
    }
    
    .lesson-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 0.5rem;
    }
    
    .lesson-header h3 {
      margin: 0;
      font-size: 1.3rem;
      color: #333;
    }
    
    .lesson-duration {
      background: #f0f0f0;
      padding: 0.25rem 0.75rem;
      border-radius: 12px;
      font-size: 0.875rem;
      color: #666;
    }
    
    .lesson-content-preview {
      color: #666;
      margin: 0;
      line-height: 1.5;
      display: -webkit-box;
      -webkit-line-clamp: 2;
      -webkit-box-orient: vertical;
      overflow: hidden;
    }
    
    .loading, .error, .no-lessons {
      text-align: center;
      padding: 2rem;
      font-size: 1.2rem;
    }
    
    .error {
      color: #d32f2f;
      background: #ffebee;
      border-radius: 8px;
      margin: 2rem 0;
    }
    
    .loading {
      color: #667eea;
    }
    
    .no-lessons {
      color: #666;
    }
  `]
})
export class CourseDetailComponent implements OnInit {
  course: Course | null = null;
  lessons: Lesson[] = [];
  loading = true;
  lessonsLoading = false;
  error: string | null = null;
  courseId: number | null = null;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private courseService: CourseService,
    private lessonService: LessonService,
    public languageService: LanguageService
  ) {}

  ngOnInit(): void {
    this.route.paramMap.subscribe(params => {
      const id = params.get('id');
      if (id) {
        this.courseId = +id;
        this.loadCourse(+id);
        this.loadLessons(+id);
      }
    });
  }

  loadCourse(id: number): void {
    this.loading = true;
    this.error = null;
    this.courseService.getCourseById(id).subscribe({
      next: (course) => {
        this.course = course;
        this.loading = false;
      },
      error: (err) => {
        console.error('Error loading course:', err);
        this.loading = false;
        const lang = this.languageService.getCurrentLanguage();
        this.error = lang === 'fr' 
          ? 'Erreur lors du chargement du cours.'
          : lang === 'ar'
          ? 'خطأ في تحميل الكورس.'
          : 'Error loading course.';
      }
    });
  }

  loadLessons(courseId: number): void {
    this.lessonsLoading = true;
    console.log('Loading lessons for course:', courseId);
    this.lessonService.getLessonsByCourse(courseId).subscribe({
      next: (lessons) => {
        console.log('Lessons received:', lessons);
        console.log('Number of lessons:', lessons?.length || 0);
        this.lessons = lessons ? lessons.sort((a, b) => (a.orderIndex || 0) - (b.orderIndex || 0)) : [];
        this.lessonsLoading = false;
        console.log('Lessons after sorting:', this.lessons);
      },
      error: (err) => {
        console.error('Error loading lessons:', err);
        console.error('Error details:', JSON.stringify(err, null, 2));
        this.lessonsLoading = false;
        this.lessons = [];
      }
    });
  }

  viewLesson(lessonId: number): void {
    this.router.navigate(['/lessons', lessonId]);
  }

  goBack(): void {
    this.router.navigate(['/courses']);
  }

  getCourseTitle(): string {
    if (!this.course) return '';
    return this.languageService.getText(this.course);
  }

  getCourseDescription(): string {
    if (!this.course) return '';
    const lang = this.languageService.getCurrentLanguage();
    const key = `description${lang.charAt(0).toUpperCase() + lang.slice(1)}` as keyof Course;
    return (this.course[key] as string) || this.course.descriptionFr || '';
  }

  getLessonTitle(lesson: Lesson): string {
    if (!lesson) return '';
    return this.languageService.getText(lesson);
  }

  getLessonContentPreview(lesson: Lesson): string {
    if (!lesson) return '';
    const lang = this.languageService.getCurrentLanguage();
    const key = `content${lang.charAt(0).toUpperCase() + lang.slice(1)}` as keyof Lesson;
    const content = (lesson[key] as string) || lesson.contentFr || '';
    // Remplacer \n et \\n par des espaces pour l'aperçu
    const cleanContent = content.replace(/\\n/g, ' ').replace(/\n/g, ' ').replace(/\s+/g, ' ').trim();
    return cleanContent.length > 150 ? cleanContent.substring(0, 150) + '...' : cleanContent;
  }

  getBackText(): string {
    const lang = this.languageService.getCurrentLanguage();
    const texts = { fr: 'Retour aux cours', en: 'Back to courses', ar: 'العودة إلى الكورسات' };
    return texts[lang];
  }

  getLoadingText(): string {
    const lang = this.languageService.getCurrentLanguage();
    const texts = { fr: 'Chargement du cours...', en: 'Loading course...', ar: 'جاري تحميل الكورس...' };
    return texts[lang];
  }

  getLessonsTitle(): string {
    const lang = this.languageService.getCurrentLanguage();
    const texts = { fr: 'Leçons', en: 'Lessons', ar: 'الدروس' };
    return texts[lang];
  }

  getLoadingLessonsText(): string {
    const lang = this.languageService.getCurrentLanguage();
    const texts = { fr: 'Chargement des leçons...', en: 'Loading lessons...', ar: 'جاري تحميل الدروس...' };
    return texts[lang];
  }

  getNoLessonsText(): string {
    const lang = this.languageService.getCurrentLanguage();
    const texts = { fr: 'Aucune leçon disponible pour ce cours.', en: 'No lessons available for this course.', ar: 'لا توجد دروس متاحة لهذا الكورس.' };
    return texts[lang];
  }
}
