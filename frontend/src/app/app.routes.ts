import { Routes } from '@angular/router';

export const routes: Routes = [
  {
    path: 'pca',
    loadChildren: () =>
      import('./modules/pca/pca.routes').then(m => m.PCA_ROUTES)
  },
  {
    path: '',
    redirectTo: 'pca',
    pathMatch: 'full'
  }
];
