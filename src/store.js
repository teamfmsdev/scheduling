import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    childTable: {
      biA: {
        tableName: 'biA',
        fields: { fmNo: 'FM NO', activities: 'Activities', buttons: 'Actions' },
        items: [{ fmNo: '2', activities: 'What the DDD' }, { fmNo: '4', activities: 'DUDE' }, { fmNo: '7', activities: 'Weed' }]
      },
      ptw: {
        tableName: 'ptw',
        fields: { fmNo: 'FM NO', activities: 'Activities', buttons: 'Actions' },
        items: [{ fmNo: '2', activities: 'What the DDD' }, { fmNo: '4', activities: 'DUDE' }, { fmNo: '777', activities: 'TowTruck' }]
      },
      pa: {
        tableName: 'pa',
        fields: { fmNo: 'FM NO', activities: 'Activities' },
        items: [{ fmNo: '2', activities: 'What the DDD' }, { fmNo: '4', activities: 'DUDE' }]
      }
    },
    mainTableData: []
  },
  getters: {
    biA: state => {
      return state.childTable.biA
    },
    ptw: state => {
      return state.childTable.ptw
    },
    pa: state => {
      return state.childTable.pa
    },
    mainTableData: state => {
      return state.mainTableData
    }
  },
  mutations: {
    addRow: (state, payload) => {
      // console.log(payload);
      state.childTable[payload.table].items.push(payload['data'])
    },
    mainTableAddRow: (state, payload) => {
      state.mainTableData.push(payload)
    }
  },
  actions: {
    addRow: (context, payload) => {
      context.commit('addRow', payload)
    },
    mainTableAddRow: (context, payload) => {
      context.commit('mainTableAddRow', payload)
    }
  }
})
