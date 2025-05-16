import { Component } from '@angular/core';
import { CommonModule } from '@angular/common'; 
import { MatIconModule } from '@angular/material/icon';
import { MatCardModule } from '@angular/material/card';


@Component({
  selector: 'app-tech',
  imports: [
    MatIconModule,
    MatCardModule,
    CommonModule
  ],
  standalone: true,
  templateUrl: './tech.component.html',
  styleUrl: './tech.component.css'
})
export class TechComponent {

  technologies = [
    { 
      name: 'Java',
      image: '../../assets/images/java.png'
    },
    { 
      name: 'HTML5',
      image: '../../assets/images/html.png'
    },
    {
      name: 'CSS3',
      image: '../../assets/images/css.png'
      
    },
    {
      name: 'Sass',
      image: '../../assets/images/sass.png'
    },
    {
      name: 'Bootstrap-',
      image: '../../assets/images/bootstrap.png'
    },
    {
      name: 'JavaScript',
      image: '../../assets/images/javascript.png'
    },
    {
      name: 'Python',
      image: '../../assets/images/python.png'
    },
    {
      name: 'MySQL',
      image: '../../assets/images/mysql.png'
    },
    {
      name: 'MarkDown',
      image: '../../assets/images/md.png'
    },
    {
      name: 'Angular',
      image: '../../assets/images/angular.png'
    },
    {
      name: 'SpringBoot',
      image: '../../assets/images/springboot.png'
    }
  ];

  technologies2 =[
    { 
      name: 'IntelliJ IDEA',
      image: '../../assets/images/ij.png'
    },
    { 
      name: 'Visual Studio Code',
      image: '../../assets/images/vscode.png'
    },
    { 
      name: 'phpMyAdmin',
      image: '../../assets/images/phpMyAdmin.png'
    },
    { 
      name: 'Git',
      image: '../../assets/images/git.png'
    },
    { 
      name: 'GitHub',
      image: '../../assets/images/github.png'
    },
    { 
      name: 'Figma',
      image: '../../assets/images/figma.png'
    },
  ]

  operatingSystems = [
    {
      name: 'Windows',
      image: '../../assets/images/windows.png'
    },
    {
      name: 'Linux',
      image: '../../assets/images/linux.png'
    }
  ]

}
