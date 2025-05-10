import { Component } from '@angular/core';
import { MatIconModule } from '@angular/material/icon';
import { CommonModule } from '@angular/common';


@Component({
  selector: 'app-experience',
  imports: [
    MatIconModule,
    CommonModule
  ],
  standalone: true,
  templateUrl: './experience.component.html',
  styleUrl: './experience.component.css'
})
export class ExperienceComponent {
  jobs = [
    {
      title: 'Junior developer',
      company: 'Vicerrectorado Universidad de Córdoba, Dpto Transformación Digital',
      dates: 'January 2025 - March 2025',
      description: 'Internship in UCO as a junior developer.',
      icon: 'code'
    },
    {
      title: 'Automation technician',
      company: 'Automatismos Brenton S.L',
      dates: 'September 2023 - August 2024',
      description: 'Making work of wiring automated industrial fuse boxs with PLCs and installing them in an industrial environment, connecting them to external elements.',
      icon: 'flash_on'
    },
    {
      title: 'Automation and programming technician',
      company: 'Inelsoft S.L',
      dates: 'June 2023 - July 2023',
      description: 'Internship in the company Inelsoft S.L realising the work of programming..',
      icon: 'computer'
    },
    {
      title: 'Automation and maintenance technician',
      company: 'Bronpi S.L',
      dates: 'April 2022 - July 2022',
      description: 'Internship in the company Bronpi S.L realising the work of maintenance, programming and start up..',
      icon: 'build'
    },
  ];
}
