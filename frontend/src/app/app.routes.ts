import { Routes } from '@angular/router';

export const routes: Routes = [
  {
    path: 'pca',
    loadComponent: () =>
      import('./modules/pca/components/lista-demandas/lista-demandas.component')
        .then(m => m.ListaDemandasComponent)
  },
  {
    path: '',
    redirectTo: 'pca',
    pathMatch: 'full'
  }
];
