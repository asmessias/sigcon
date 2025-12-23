import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Demanda } from '../../../shared/models/demanda.model';
import { ApiService } from '../../../core/services/api.service';

@Injectable({
  providedIn: 'root'
})
export class DemandaService {

  constructor(private api: ApiService) {}

  listar(): Observable<Demanda[]> {
    return this.api.get<Demanda[]>('demandas');
  }
}
