import { Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { FormationComponent } from './formation/formation.component';
import { ExperienceComponent } from './experience/experience.component';
import { TechComponent } from './tech/tech.component';
import { MoreComponent } from './more/more.component';
import { SecundariaComponent } from './secundaria/secundaria.component';

export const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'home', component: HomeComponent },
  { path: 'formation', component: FormationComponent, children: [{path: 'pagsecundaria', component: SecundariaComponent}] },
  { path: 'experience', component: ExperienceComponent },
  { path: 'tech', component: TechComponent },
  { path: 'more', component: MoreComponent },

];
