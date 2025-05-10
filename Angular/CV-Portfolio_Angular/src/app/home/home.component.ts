import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { MatCardModule } from '@angular/material/card';  // Para mat-card
import { MatButtonModule } from '@angular/material/button';  // Para mat-raised-button
import { MatIconModule } from '@angular/material/icon';

@Component({
  selector: 'app-home',
  imports: [
    CommonModule,
    MatCardModule,
    MatButtonModule,
    MatIconModule
  ],
  standalone: true,
  templateUrl: './home.component.html',
  styleUrl: './home.component.css'
})
export class HomeComponent {
  projects = [
    {
      name: 'Java subject repository',
      image: '../../assets/images/java-repo.webp',
      link: 'https://github.com/JaimeBonBol/RepasoProgramacionJava'
    },
    {
      name: 'Marks Language subject repository',
      image: '../../assets/images/disenio-web.webp',
      link: 'https://github.com/JaimeBonBol/Lenguaje_de_Marcas'
    },
    {
      name: 'DataBase subject repository',
      image: '../../assets/images/mysqlrepo.webp',
      link: 'https://github.com/JaimeBonBol/BBDD'
    }
  ]
}
