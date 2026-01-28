import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface Course {
  id: number;
  titleFr: string;
  titleEn: string;
  titleAr: string;
  descriptionFr?: string;
  descriptionEn?: string;
  descriptionAr?: string;
  level: string;
  orderIndex: number;
  createdAt?: string;
  updatedAt?: string;
}

@Injectable({
  providedIn: 'root'
})
export class CourseService {
  // Utiliser une URL relative pour que Nginx proxy vers le backend
  private apiUrl = '/api';

  constructor(private http: HttpClient) {}

  getAllCourses(): Observable<Course[]> {
    return this.http.get<Course[]>(`${this.apiUrl}/courses`);
  }

  getCourseById(id: number): Observable<Course> {
    return this.http.get<Course>(`${this.apiUrl}/courses/${id}`);
  }
}
