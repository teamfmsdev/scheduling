import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    mainData: []
  },
  getters: {
    currentExpandedRow: state => {
      return state.mainData.filter(element => {
        return element.rowDetails == true;
      });
    }
  },
  mutations: {
    addChildTableRow: (state, payload) => {
      let { rowData, table: childTableName, data } = payload;
      let affectedData = state.mainData.find(element => {
        return (
          element.year == rowData.year &&
          element.month == rowData.month &&
          element.mainTable.date == rowData.mainTable.date
        );
      });
      let { childTable } = affectedData;
      childTable[childTableName].items.push(data);
    },
    deleteChildTableRow: (state, payload) => {
      // Destructure
      let { rowData, table: childTableName, data } = payload;
      // Find rows that are affected
      let affectedData = state.mainData.find(element => {
        return (
          element.year == rowData.year &&
          element.month == rowData.month &&
          element.mainTable.date == rowData.mainTable.date
        );
      });

      let { childTable } = affectedData;
      // Splice childTable items with index that match // childTableRowId
      childTable[childTableName].items.splice(data.childTableRowId, 1);
    },
    editChildTableData: (state, payload) => {
      // Destructuring
      let { rowData, table, affectedRow, data } = payload;
      // Finding affected mainData
      let affectedData = state.mainData.find(element => {
        return (
          element.year == rowData.year &&
          element.month == rowData.month &&
          element.mainTable.date == rowData.mainTable.date
        );
      });
      // Destructuring
      let { childTable } = affectedData;
      // Assigning new value to affected childTable
      // column
      childTable[table].items[affectedRow][data.dataType] = data.newValue;
    },
    mainTableAddRow: (state, payload) => {
      state.push(payload);
    },
    mainDataInit: (state, payload) => {
      state.mainData.push(payload);
    },
    toggleRowDetails: (state, payload) => {
      // Affected mainData row
      let affectedData = state.mainData.find(element => {
        return (
          element.year == payload.year &&
          element.month == payload.month &&
          element.mainTable.date == payload.mainTable.date
        );
      });

      // Inverse rowDetails
      affectedData.rowDetails = !affectedData.rowDetails;
    },
    emptyMainData: (state, payload) => {
      state.mainData = [];
    }
  },
  actions: {
    addChildTableRow: (context, payload) => {
      context.commit("addChildTableRow", payload);
    },
    mainTableAddRow: (context, payload) => {
      context.commit("mainTableAddRow", payload);
    },
    mainDataInit: (context, payload) => {
      context.commit("mainDataInit", payload);
    },
    toggleRowDetails: (context, payload) => {
      context.commit("toggleRowDetails", payload);
    },
    emptyMainData: (context, payload) => {
      context.commit("emptyMainData");
    },
    deleteChildTableRow: (context, payload) => {
      context.commit("deleteChildTableRow", payload);
    },
    editChildTableData: (context, payload) => {
      context.commit("editChildTableData", payload);
    }
  }
});
