import { Component } from '@angular/core';
import { MatCardModule } from '@angular/material/card';
import { MatButtonModule } from '@angular/material/button';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-formation',
  imports: [
    MatCardModule,
    MatButtonModule,
    CommonModule
  ],
  standalone: true,
  templateUrl: './formation.component.html',
  styleUrls: ['./formation.component.css'] 
})
export class FormationComponent {
  courses = [
    {
      title: 'Ciclo Formativo Grado Superior Automatización y Robótica',
      where: 'Salesianos C.D.P San Luis Rey, Palma del Río.',
      during: '2020 - 2022'
    },
    {
      title: 'Curso de Especialización en Fabricación Inteligente',
      where: 'IES Zoco, Córdoba.',
      during: '2022 - 2023'
    },
    {
      title: 'Ciclo Formativo Grado Superior Desarrollo de Aplicaciones Multiplataforma',
      where: 'IES Antonio Gala, Palma del Río.',
      during: '2024 - ACTUALIDAD'
    }
  ];
}
