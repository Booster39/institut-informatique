import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { LanguageService } from '../../services/language.service';

@Component({
  selector: 'app-exercise-view',
  standalone: true,
  template: `
    <div class="exercise-container">
      <div class="container">
        <h1>Exercice</h1>
        <p>Composant d'exercice à implémenter</p>
      </div>
    </div>
  `,
  styles: [`
    .exercise-container {
      padding: 2rem 0;
    }
  `]
})
export class ExerciseViewComponent implements OnInit {
  constructor(public languageService: LanguageService) {}

  ngOnInit(): void {}
}
