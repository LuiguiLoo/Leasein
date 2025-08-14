<template>
  <div class="p-4">
    <h1>📋 Gestión de Equipos</h1>

    <DataTable 
      v-model:filters="filters" 
      :value="equipos" 
      paginator rows="5"
      :globalFilterFields="['codigo', 'cliente', 'tipo', 'estado', 'fecha_entrega']"
      :responsiveLayout="'scroll'">

      <Column field="codigo" header="Código" filter filterPlaceholder="Buscar código"></Column>
      <Column field="cliente" header="Cliente" filter filterPlaceholder="Buscar cliente"></Column>
      <Column field="tipo" header="Tipo" filter filterPlaceholder="Buscar tipo"></Column>
      <Column field="estado" header="Estado" filter filterPlaceholder="Buscar estado"></Column>
      <Column field="fecha_entrega" header="Fecha de Entrega" filter filterPlaceholder="Buscar fecha"></Column>

    </DataTable>

    <hr class="my-4" />

    <h2>📌 Filtrar por códigos pegados</h2>
    <Textarea v-model="codigosPegados" rows="5" cols="40" placeholder="Pega los códigos, uno por línea"></Textarea>
    <br /><br />
    <Button label="Filtrar por códigos" icon="pi pi-filter" @click="filtrarPorCodigos" />

    <div v-if="noEncontrados.length" class="p-mt-4 p-text-bold p-error">
      Códigos no encontrados: {{ noEncontrados.join(', ') }}
    </div>
  </div>
</template>

<script>
import axios from 'axios'

// PrimeVue Components
import DataTable from 'primevue/datatable'
import Column from 'primevue/column'
import Textarea from 'primevue/textarea'
import Button from 'primevue/button'

export default {
  name: 'App',
  components: { DataTable, Column, Textarea, Button },
  data() {
    return {
      equipos: [],
      allEquipos: [],
      codigosPegados: '',
      noEncontrados: [],
      filters: {}
    }
  },
  methods: {
    async cargarEquipos() {
      try {
        const res = await axios.get('http://127.0.0.1:8000/api/equipos')
        this.equipos = res.data
        this.allEquipos = res.data
      } catch (error) {
        console.error(error)
      }
    },
    async filtrarPorCodigos() {
      const codigosArray = this.codigosPegados
        .split('\n')
        .map(c => c.trim())
        .filter(c => c)

      if (!codigosArray.length) {
        alert('Por favor, ingresa al menos un código.')
        return
      }

      try {
        const res = await axios.post('http://127.0.0.1:8000/api/validar-equipos', {
          codigos: codigosArray
        })

        // Usamos los códigos encontrados para filtrar en la lista completa
        this.equipos = this.allEquipos.filter(e =>
          res.data.encontrados.includes(e.codigo)
        )

        this.noEncontrados = res.data.no_encontrados
      } catch (error) {
        console.error(error)
      }
    }
  },
  mounted() {
    this.cargarEquipos()
  }
}
</script>