import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    simulatedComplete: [
      {
        month: "Apr",
        year: "2018",
        mainTableData: [
          {
            mainDetails: {
              day: "Fri",
              date: "2",
              biActivities: "",
              permitToWork: "",
              projectActivities: "",
              n1: "",
              n2: "",
              n3: "",
              n4: "",
              n5: "",
              n6: "",
              n7: "",
              n8: "",
              contractorManagement: ""
            },
            childTable: {
              biA: {
                tableName: "biA",
                fields: {
                  fmNo: "FM NO",
                  activities: "Activities",
                  buttons: "Actions"
                },
                items: [
                  { fmNo: "2", activities: "What the DDD" },
                  { fmNo: "4", activities: "DUDE" },
                  { fmNo: "7", activities: "Weed" }
                ]
              },
              ptw: {
                tableName: "ptw",
                fields: {
                  fmNo: "FM NO",
                  activities: "Activities",
                  buttons: "Actions"
                },
                items: [
                  { fmNo: "2", activities: "What the DDD" },
                  { fmNo: "4", activities: "DUDE" },
                  { fmNo: "777", activities: "TowTruck" }
                ]
              },
              pa: {
                tableName: "pa",
                fields: { fmNo: "FM NO", activities: "Activities" },
                items: [
                  { fmNo: "2", activities: "What the DDD" },
                  { fmNo: "4", activities: "DUDE" }
                ]
              }
            },
            rowDetails: false
          },
          {
            mainDetails: {
              day: "Fri",
              date: "2",
              biActivities: "",
              permitToWork: "",
              projectActivities: "",
              n1: "",
              n2: "",
              n3: "",
              n4: "",
              n5: "",
              n6: "",
              n7: "",
              n8: "",
              contractorManagement: ""
            },
            childTable: {
              biA: {
                tableName: "biA",
                fields: {
                  fmNo: "FM NO",
                  activities: "Activities",
                  buttons: "Actions"
                },
                items: [
                  { fmNo: "2", activities: "What the DDD" },
                  { fmNo: "4", activities: "DUDE" },
                  { fmNo: "7", activities: "Weed" }
                ]
              },
              ptw: {
                tableName: "ptw",
                fields: {
                  fmNo: "FM NO",
                  activities: "Activities",
                  buttons: "Actions"
                },
                items: [
                  { fmNo: "2", activities: "What the DDD" },
                  { fmNo: "4", activities: "DUDE" },
                  { fmNo: "777", activities: "TowTruck" }
                ]
              },
              pa: {
                tableName: "pa",
                fields: { fmNo: "FM NO", activities: "Activities" },
                items: [
                  { fmNo: "2", activities: "What the DDD" },
                  { fmNo: "4", activities: "DUDE" }
                ]
              }
            },
            rowDetails: false
          }
        ]
      }
    ],
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
      // console.log(payload);
      state.realSimulationTableData[payload.rowId].mainTableData.childTable[
        payload.table
      ].items.push(payload["data"]);
    },
    mainTableAddRow: (state, payload) => {
      state.mainTableData.push(payload);
    },
    realSimulationTableDataInit: (state, payload) => {
      state.realSimulationTableData.push(payload);
    },
    toggleRowDetails: (state, payload) => {
      state.realSimulationTableData[payload].mainTableData.rowDetails = !state
        .realSimulationTableData[payload].mainTableData.rowDetails;
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
    }
  }
});
