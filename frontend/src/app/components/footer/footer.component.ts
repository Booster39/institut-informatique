import { Component } from '@angular/core';

@Component({
  selector: 'app-footer',
  standalone: true,
  template: `
    <footer class="footer">
      <div class="container">
        <p>&copy; 2026 L'Institut de l'informatique - مركز الحاسوبي. Tous droits réservés.</p>
        <p>Devenez développeur full stack en 1 an</p>
      </div>
    </footer>
  `,
  styles: [`
    .footer {
      background: #333;
      color: white;
      padding: 2rem 0;
      text-align: center;
      margin-top: auto;
    }
    
    .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 0 2rem;
    }
  `]
})
export class FooterComponent {}
