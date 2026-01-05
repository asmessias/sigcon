import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Demanda } from '../models/demanda.model';

@Injectable({
  providedIn: 'root'
})
export class DemandaService {

  private readonly API_URL = '/api/v1/demandas';

  constructor(private http: HttpClient) {}

  listarDemandas(): Observable<Demanda[]> {
    return this.http.get<Demanda[]>(this.API_URL);
  }
}
