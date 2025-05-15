import { Component } from '@angular/core';
import { MatCardModule } from '@angular/material/card';
import { MatButtonModule } from '@angular/material/button';
import { MatTableModule } from '@angular/material/table';
import { CommonModule } from '@angular/common';
import { Course } from '../course';
import { MatExpansionModule } from '@angular/material/expansion';

@Component({
  selector: 'app-formation',
  imports: [
    MatCardModule,
    MatButtonModule,
    CommonModule,
    MatTableModule,
    MatExpansionModule
  ],
  standalone: true,
  templateUrl: './formation.component.html',
  styleUrls: ['./formation.component.css'] 
})
export class FormationComponent {

  displayedColumns: string[] = ['title', 'where', 'during'];

  course1 = new Course('Ciclo Formativo Grado Superior Automatización y Robótica', 'Salesianos C.D.P San Luis Rey, Palma del Río.', '2020 - 2022');
  course2 = new Course('Curso de Especialización en Fabricación Inteligente', 'IES Zoco, Córdoba.', '2022 - 2023');
  course3 = new Course('Ciclo Formativo Grado Superior Desarrollo de Aplicaciones Multiplataforma', 'IES Antonio Gala, Palma del Río.', '2024 - ACTUALIDAD');
  
  courses: Course[] = [this.course1, this.course2, this.course3];
}
