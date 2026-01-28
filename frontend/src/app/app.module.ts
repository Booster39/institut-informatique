import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule, HttpClient } from '@angular/common/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';

import { AppComponent } from './app.component';
import { CourseListComponent } from './components/course-list/course-list.component';
import { CourseDetailComponent } from './components/course-detail/course-detail.component';
import { LessonViewComponent } from './components/lesson-view/lesson-view.component';
import { ExerciseViewComponent } from './components/exercise-view/exercise-view.component';
import { CodeEditorComponent } from './components/code-editor/code-editor.component';
import { LanguageSelectorComponent } from './components/language-selector/language-selector.component';
import { HeaderComponent } from './components/header/header.component';
import { FooterComponent } from './components/footer/footer.component';
import { HomeComponent } from './components/home/home.component';

import { routes } from './app.routes';
import { CourseService } from './services/course.service';
import { LessonService } from './services/lesson.service';
import { LanguageService } from './services/language.service';

@NgModule({
  declarations: [],
  imports: [
    BrowserModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
    RouterModule.forRoot(routes),
    // Composants standalone
    AppComponent,
    CourseListComponent,
    CourseDetailComponent,
    LessonViewComponent,
    ExerciseViewComponent,
    CodeEditorComponent,
    LanguageSelectorComponent,
    HeaderComponent,
    FooterComponent,
    HomeComponent
  ],
  providers: [
    CourseService,
    LessonService,
    LanguageService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
