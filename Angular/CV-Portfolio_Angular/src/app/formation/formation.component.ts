import { Component } from '@angular/core';
import { MatCardModule } from '@angular/material/card';
import { MatIconModule } from '@angular/material/icon';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-formation',
  imports: [
    MatCardModule,
    MatIconModule,
    CommonModule
  ],
  standalone:true,
  templateUrl: './formation.component.html',
  styleUrl: './formation.component.css'
})
export class FormationComponent {

}