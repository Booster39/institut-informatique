import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface CodeBlock {
  id?: number;
  code: string;
  language: string;
  descriptionFr?: string;
  descriptionEn?: string;
  descriptionAr?: string;
  isEditable: boolean;
  isRunnable: boolean;
  orderIndex: number;
}

export interface Lesson {
  id: number;
  courseId?: number;
  titleFr: string;
  titleEn: string;
  titleAr: string;
  contentFr: string;
  contentEn: string;
  contentAr: string;
  keyPointsFr: string;
  keyPointsEn: string;
  keyPointsAr: string;
  analogiesFr: string;
  analogiesEn: string;
  analogiesAr: string;
  examplesFr: string;
  examplesEn: string;
  examplesAr: string;
  orderIndex: number;
  estimatedDuration: number;
  codeBlocks?: CodeBlock[];
}

@Injectable({
  providedIn: 'root'
})
export class LessonService {
  // Utiliser une URL relative pour que Nginx proxy vers le backend
  private apiUrl = '/api';

  constructor(private http: HttpClient) {}

  getLessonsByCourse(courseId: number): Observable<Lesson[]> {
    return this.http.get<Lesson[]>(`${this.apiUrl}/lessons/course/${courseId}`);
  }

  getLessonById(id: number): Observable<Lesson> {
    return this.http.get<Lesson>(`${this.apiUrl}/lessons/${id}`);
  }
}
