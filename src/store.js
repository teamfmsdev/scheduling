import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    realSimulationTableData: []
  },
  getters: {
    realSimulationTableData: state => {
      return state.realSimulationTableData
    },
    simulatedCompleteData: state => {
      return state.simulatedComplete
    },
    currentExpandedRow: state => {
      return state.realSimulationTableData.filter(element => {
        return element.mainTableData.rowDetails == true
      })
    }
  },
  mutations: {
    addRow: (state, payload) => {
      // console.log(payload)
      let resultData = state.realSimulationTableData.find(element => {
        return (
          element.year == payload.rowData.year &&
          element.month == payload.rowData.month &&
          element.mainTableData.mainDetails.date == payload.rowData.mainTableData.mainDetails.date
        )
      })
      // console.log(resultData)
      resultData.mainTableData.childTable[payload.table].items.push(payload.data)
      // console.log(payload);
      // state.realSimulationTableData[payload.rowId].mainTableData.childTable[payload.table].items.push(payload['data'])
    },
    mainTableAddRow: (state, payload) => {
      state.mainTableData.push(payload)
    },
    realSimulationTableDataInit: (state, payload) => {
      state.realSimulationTableData.push(payload)
    },
    toggleRowDetails: (state, payload) => {
      let resultData = state.realSimulationTableData.find(element => {
        return (
          element.year == payload.year &&
          element.month == payload.month &&
          element.mainTableData.mainDetails.date == payload.mainTableData.mainDetails.date
        )
      })
      // console.log('before invert' + resultData)
      resultData.mainTableData.rowDetails = !resultData.mainTableData.rowDetails
      // console.log(resultData)
    },
    emptyMainData: (state, payload) => {
      state.realSimulationTableData = []
    }
  },
  actions: {
    addRow: (context, payload) => {
      context.commit('addRow', payload)
    },
    mainTableAddRow: (context, payload) => {
      context.commit('mainTableAddRow', payload)
    },
    realSimulationTableDataInit: (context, payload) => {
      context.commit('realSimulationTableDataInit', payload)
    },
    toggleRowDetails: (context, payload) => {
      context.commit('toggleRowDetails', payload)
    },
    emptyMainData: (context, payload) => {
      context.commit('emptyMainData')
    }
  }
})
