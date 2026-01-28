import { Component, Input } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { CodeBlock } from '../../services/lesson.service';
import { LanguageService } from '../../services/language.service';

@Component({
  selector: 'app-code-editor',
  standalone: true,
  imports: [CommonModule, FormsModule],
  template: `
    <div class="code-editor-container">
      <h3>Espace de codage</h3>
      <div class="code-block" *ngFor="let block of codeBlocks">
        <div class="code-description" *ngIf="getDescription(block)">
          {{ getDescription(block) }}
        </div>
        <textarea 
          class="code-input"
          [(ngModel)]="block.code"
          [readonly]="!block.isEditable"
          [placeholder]="'Écrivez votre code ici...'">
        </textarea>
        <button *ngIf="block.isRunnable" (click)="runCode(block)">
          Exécuter
        </button>
      </div>
    </div>
  `,
  styles: [`
    .code-editor-container {
      margin: 2rem 0;
    }
    
    .code-block {
      margin-bottom: 1.5rem;
    }
    
    .code-input {
      width: 100%;
      min-height: 200px;
      font-family: 'Courier New', monospace;
      padding: 1rem;
      border: 1px solid #ddd;
      border-radius: 4px;
      font-size: 14px;
    }
    
    button {
      margin-top: 0.5rem;
      padding: 0.5rem 1rem;
      background: #667eea;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
  `]
})
export class CodeEditorComponent {
  @Input() codeBlocks: CodeBlock[] = [];

  constructor(public languageService: LanguageService) {}

  getDescription(block: CodeBlock): string {
    const lang = this.languageService.getCurrentLanguage();
    if (lang === 'fr') return block.descriptionFr || '';
    if (lang === 'en') return block.descriptionEn || '';
    if (lang === 'ar') return block.descriptionAr || '';
    return block.descriptionFr || '';
  }

  runCode(block: CodeBlock): void {
    console.log('Running code:', block.code);
    // Implémenter l'exécution du code
  }
}
