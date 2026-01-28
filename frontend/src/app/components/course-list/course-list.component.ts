import { Component, OnInit } from '@angular/core';
import { Router, RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { CourseService, Course } from '../../services/course.service';
import { LanguageService } from '../../services/language.service';
import { LessonService } from '../../services/lesson.service';

@Component({
  selector: 'app-course-list',
  standalone: true,
  imports: [CommonModule, RouterModule],
  template: `
    <div class="course-list-container">
      <div class="container">
        <h1>{{ getTitle() }}</h1>
        
        <div *ngIf="loading" class="loading">
          {{ getLoadingText() }}
        </div>
        
        <div *ngIf="error" class="error">
          {{ error }}
        </div>
        
        <div *ngIf="!loading && !error && courses.length === 0" class="no-courses">
          {{ getNoCoursesText() }}
        </div>
        
        <div class="courses-grid" *ngIf="!loading && !error && courses.length > 0">
          <div class="course-card" *ngFor="let course of courses" (click)="viewCourse(course.id)">
            <div class="course-header">
              <h2>{{ getCourseTitle(course) }}</h2>
              <span class="level-badge" [class]="'level-' + course.level.toLowerCase()">
                {{ course.level }}
              </span>
            </div>
            <p class="course-description">{{ getCourseDescription(course) }}</p>
            <div class="course-footer">
              <span class="lessons-count">{{ getLessonsText() }}</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .course-list-container {
      padding: 2rem 0;
      min-height: calc(100vh - 200px);
    }
    
    .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 0 2rem;
    }
    
    h1 {
      margin-bottom: 2rem;
      font-size: 2.5rem;
    }
    
    .courses-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
      gap: 2rem;
    }
    
    .course-card {
      background: white;
      border-radius: 8px;
      padding: 2rem;
      box-shadow: 0 4px 6px rgba(0,0,0,0.1);
      cursor: pointer;
      transition: transform 0.3s, box-shadow 0.3s;
    }
    
    .course-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 8px 12px rgba(0,0,0,0.15);
    }
    
    .course-header {
      display: flex;
      justify-content: space-between;
      align-items: flex-start;
      margin-bottom: 1rem;
    }
    
    .course-header h2 {
      margin: 0;
      flex: 1;
    }
    
    .level-badge {
      padding: 0.25rem 0.75rem;
      border-radius: 12px;
      font-size: 0.875rem;
      font-weight: bold;
    }
    
    .level-beginner {
      background: #d4edda;
      color: #155724;
    }
    
    .level-intermediate {
      background: #fff3cd;
      color: #856404;
    }
    
    .level-advanced {
      background: #f8d7da;
      color: #721c24;
    }
    
    .course-description {
      color: #666;
      margin-bottom: 1rem;
    }
    
    .loading, .error, .no-courses {
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
    
    .no-courses {
      color: #666;
    }
  `]
})
export class CourseListComponent implements OnInit {
  courses: Course[] = [];
  loading = true;
  error: string | null = null;

  constructor(
    private courseService: CourseService,
    private lessonService: LessonService,
    private router: Router,
    public languageService: LanguageService
  ) {}

  ngOnInit(): void {
    this.loadCourses();
  }

  loadCourses(): void {
    this.loading = true;
    this.error = null;
    this.courseService.getAllCourses().subscribe({
      next: (courses) => {
        console.log('Courses received from API:', courses);
        console.log('Number of courses:', courses?.length || 0);
        this.courses = courses || [];
        this.loading = false;
        if (this.courses.length === 0) {
          console.warn('No courses received from API');
        }
      },
      error: (err) => {
        console.error('Error loading courses:', err);
        console.error('Error details:', JSON.stringify(err, null, 2));
        this.loading = false;
        const lang = this.languageService.getCurrentLanguage();
        this.error = lang === 'fr' 
          ? 'Erreur lors du chargement des cours. Vérifiez que le backend est démarré et que l\'API répond.'
          : lang === 'ar'
          ? 'خطأ في تحميل الكورسات. تحقق من أن الخلفي يعمل وأن API يستجيب.'
          : 'Error loading courses. Check that the backend is running and the API is responding.';
      }
    });
  }

  getCourseTitle(course: Course): string {
    return this.languageService.getText(course);
  }

  getCourseDescription(course: Course): string {
    const lang = this.languageService.getCurrentLanguage();
    const key = `description${lang.charAt(0).toUpperCase() + lang.slice(1)}` as keyof Course;
    return (course[key] as string) || course.descriptionFr || '';
  }

  viewCourse(id: number): void {
    // Navigation vers les leçons du cours
    this.router.navigate(['/courses', id]);
  }

  getTitle(): string {
    const lang = this.languageService.getCurrentLanguage();
    const titles = {
      fr: 'Nos Cours',
      en: 'Our Courses',
      ar: 'دوراتنا'
    };
    return titles[lang];
  }

  getLessonsText(): string {
    const lang = this.languageService.getCurrentLanguage();
    const texts = {
      fr: 'Leçons disponibles',
      en: 'Lessons available',
      ar: 'دروس متاحة'
    };
    return texts[lang];
  }

  getLoadingText(): string {
    const lang = this.languageService.getCurrentLanguage();
    const texts = {
      fr: 'Chargement des cours...',
      en: 'Loading courses...',
      ar: 'جاري تحميل الكورسات...'
    };
    return texts[lang];
  }

  getNoCoursesText(): string {
    const lang = this.languageService.getCurrentLanguage();
    const texts = {
      fr: 'Aucun cours disponible pour le moment.',
      en: 'No courses available at the moment.',
      ar: 'لا توجد كورسات متاحة في الوقت الحالي.'
    };
    return texts[lang];
  }
}
