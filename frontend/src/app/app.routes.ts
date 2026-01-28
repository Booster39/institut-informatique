import { Routes } from '@angular/router';
import { HomeComponent } from './components/home/home.component';
import { CourseListComponent } from './components/course-list/course-list.component';
import { CourseDetailComponent } from './components/course-detail/course-detail.component';
import { LessonViewComponent } from './components/lesson-view/lesson-view.component';
import { ExerciseViewComponent } from './components/exercise-view/exercise-view.component';

export const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'courses', component: CourseListComponent },
  { path: 'courses/:id', component: CourseDetailComponent },
  { path: 'lessons/:id', component: LessonViewComponent },
  { path: 'exercises/:id', component: ExerciseViewComponent },
  { path: '**', redirectTo: '' }
];
