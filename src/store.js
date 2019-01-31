import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    realSimulationTableData: []
  },
  getters: {
    realSimulationTableData: state => {
      return state.realSimulationTableData;
    },
    simulatedCompleteData: state => {
      return state.simulatedComplete;
    },
    currentExpandedRow: state => {
      return state.realSimulationTableData.filter(element => {
        return element.mainTableData.rowDetails == true;
      });
    }
  },
  mutations: {
    addRow: (state, payload) => {
      let resultData = state.realSimulationTableData.find(element => {
        return (
          element.year == payload.rowData.year &&
          element.month == payload.rowData.month &&
          element.mainTableData.mainDetails.date ==
            payload.rowData.mainTableData.mainDetails.date
        );
      });

      resultData.mainTableData.childTable[payload.table].items.push(
        payload.data
      );
    },
    deleteChildTableRow: (state, payload) => {
      // console.log(payload);
      let resultData = state.realSimulationTableData.find(element => {
        return (
          element.year == payload.rowData.year &&
          element.month == payload.rowData.month &&
          element.mainTableData.mainDetails.date ==
            payload.rowData.mainTableData.mainDetails.date
        );
      });
      resultData.mainTableData.childTable[payload.table].items.splice(
        [payload.data["childTableRowId"]],
        1
      );
    },
    mainTableAddRow: (state, payload) => {
      state.mainTableData.push(payload);
    },
    realSimulationTableDataInit: (state, payload) => {
      state.realSimulationTableData.push(payload);
    },
    toggleRowDetails: (state, payload) => {
      let resultData = state.realSimulationTableData.find(element => {
        return (
          element.year == payload.year &&
          element.month == payload.month &&
          element.mainTableData.mainDetails.date ==
            payload.mainTableData.mainDetails.date
        );
      });

      resultData.mainTableData.rowDetails = !resultData.mainTableData
        .rowDetails;
    },
    emptyMainData: (state, payload) => {
      state.realSimulationTableData = [];
    }
  },
  actions: {
    addRow: (context, payload) => {
      context.commit("addRow", payload);
    },
    mainTableAddRow: (context, payload) => {
      context.commit("mainTableAddRow", payload);
    },
    realSimulationTableDataInit: (context, payload) => {
      context.commit("realSimulationTableDataInit", payload);
    },
    toggleRowDetails: (context, payload) => {
      context.commit("toggleRowDetails", payload);
    },
    emptyMainData: (context, payload) => {
      context.commit("emptyMainData");
    },
    deleteChildTableRow: (context, payload) => {
      context.commit("deleteChildTableRow", payload);
    }
  }
});
