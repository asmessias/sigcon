import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { DemandaService } from '../../services/demanda.service';
import { Demanda } from '../../../../shared/models/demanda.model';

@Component({
  selector: 'app-lista-demandas',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './lista-demandas.component.html'
})

export class ListaDemandasComponent implements OnInit {

  demandas: Demanda[] = [];

  constructor(private demandaService: DemandaService) {}

  ngOnInit(): void {
    this.demandaService.listar().subscribe({
      next: (dados: Demanda[]) => this.demandas = dados,
      error: (erro: any) => console.error('Erro ao buscar demandas', erro)
    });
  }
}
