import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { DemandaService } from '../../services/demanda.service';
import { Demanda } from '../../models/demanda.model';

@Component({
  standalone: true,
  selector: 'app-lista-demandas',
  imports: [CommonModule],
  templateUrl: './lista-demandas.component.html'
})
export class ListaDemandasComponent implements OnInit {

  demandas: Demanda[] = [];
  carregando = true;
  erro = false;

  constructor(private demandaService: DemandaService) {}

  ngOnInit(): void {
    this.demandaService.listarDemandas().subscribe({
      next: (dados: Demanda[]) => {
        this.demandas = dados ?? [];
        this.carregando = false;
      },
      error: (err: unknown) => {
        console.error('Erro ao carregar demandas', err);
        this.erro = true;
        this.carregando = false;
      }
    });
  }
}
