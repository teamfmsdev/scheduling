import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
import dayjs from 'dayjs'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    mainData: []
  },
  getters: {
    currentExpandedRow: state => {
      return state.mainData.filter(element => {
        return element.rowDetails == true
      })
    }
  },
  mutations: {
    addChildTableRow: (state, payload) => {
      let { rowData, table: childTableName, data } = payload
      let affectedData = state.mainData.find(element => {
        return (
          element.year == rowData.year &&
          element.month == rowData.month &&
          element.mainTable.date == rowData.mainTable.date
        )
      })
      let { childTable } = affectedData
      childTable[childTableName].items.push(data)

      let date = dayjs(
        new Date(`${rowData.mainTable.date}/${rowData.month}/${rowData.year}`)
      ).format('YYYY-MM-DD')
      axios
        .get('http://localhost/Schdeuling/public/server/updateData.php', {
          params: {
            date: date,
            table: table,
            row: childTable[childTableName].length - 1,
            $column: '',
            $newValue: '',
            operation: 'addChildTableRow'
          }
        })
        .then(response => console.log(response.data))
    },
    deleteChildTableRow: (state, payload) => {
      // Destructure
      let { rowData, table: childTableName, data } = payload
      // Find rows that are affected
      let affectedData = state.mainData.find(element => {
        return (
          element.year == rowData.year &&
          element.month == rowData.month &&
          element.mainTable.date == rowData.mainTable.date
        )
      })

      let { childTable } = affectedData
      // Splice childTable items with index that match // childTableRowId
      childTable[childTableName].items.splice(data.childTableRowId, 1)
    },
    editChildTableData: (state, payload) => {
      // Destructuring
      let { rowData, table, affectedRow, data } = payload
      // Finding affected mainData
      let affectedData = state.mainData.find(element => {
        return (
          element.year == rowData.year &&
          element.month == rowData.month &&
          element.mainTable.date == rowData.mainTable.date
        )
      })
      // Destructuring
      let { childTable } = affectedData
      // Assigning new value to affected childTable
      // column
      childTable[table].items[affectedRow][data.dataType] = data.newValue
      // DATABASE UPDATING
      let date = dayjs(
        new Date(`${rowData.mainTable.date}/${rowData.month}/${rowData.year}`)
      ).format('YYYY-MM-DD')
      axios
        .get('http://localhost/Schdeuling/public/server/updateData.php', {
          params: {
            date: date,
            table: table,
            row: affectedRow,
            type: data.dataType,
            data: data.newValue,
            operation: 'editChildTabledata'
          }
        })
        .then(response => console.log(response.data))
    },
    mainTableAddRow: (state, payload) => {
      state.push(payload)
    },
    // Color rotation function for parentRow
    mainTableEditRow: (state, payload) => {
      let { rowData, tData, data } = payload

      let affectedData = state.mainData.find(element => {
        return (
          element.year == rowData.year &&
          element.month == rowData.month &&
          element.mainTable.date == rowData.mainTable.date
        )
      })

      let { mainTable } = affectedData
      switch (tData) {
        case 'n1':
        case 'n2':
        case 'n3':
        case 'n4':
        case 'n5':
        case 'n6':
        case 'n7':
        case 'n8':
          let newColor = mainTable[tData]
          // Remove "P" from string
          newColor = newColor.slice(1)
          // Make the remaining string as number
          newColor = parseInt(newColor)
          // Rotate color
          newColor = newColor + 1
          // If >5 set to 0(white)
          newColor > 5 ? (newColor = 0) : ''
          // Make it as string
          mainTable[tData] = `p${newColor}`
          affectedData = state.mainData.filter(element => {
            return (
              element.year == rowData.year &&
              element.month == rowData.month &&
              element.mainTable.date > rowData.mainTable.date
            )
          })
          affectedData.forEach(element => {
            element.mainTable[tData] = `p${newColor}`
          })
          break
        default:
          mainTable[tData] = data
      }

      // console.log("Mutations called")
      // console.log(payload);
    },
    mainDataInit: (state, payload) => {
      state.mainData.push(payload)

      let date = dayjs(
        new Date(`${payload.mainTable.date}/${payload.month}/${payload.year}`)
      ).format('YYYY-MM-DD')

      // axios
      //   .get("http://localhost/Schdeuling/public/server/saveData.php", {
      //     params: {
      //       date: date,
      //       operation: "mainDataInit"
      //     }
      //   })
      //   .then(response => console.log(response.data));
    },
    mainDataAjaxUpdate: (state, payload) => {
      // Date to choose from
      let date = dayjs(
        new Date(`${payload.day}/${payload.month}/${payload.year}`)
      ).format('YYYY-MM-DD')

      axios.get('http://localhost/Schdeuling/public/server/retrieveData.php', {
        params: {
          date: '2019-02-13',
          operation: 'mainDataAjaxUpdate'
        }
      })
      // .then(response => console.log(response.data));
    },
    toggleRowDetails: (state, payload) => {
      // Affected mainData row
      let affectedData = state.mainData.find(element => {
        return (
          element.year == payload.year &&
          element.month == payload.month &&
          element.mainTable.date == payload.mainTable.date
        )
      })

      // Inverse rowDetails
      affectedData.rowDetails = !affectedData.rowDetails
    },
    reValidateRow: (state, payload) => {
      let { rowData, table, affectedRow } = payload
      let affectedData = state.mainData.find(element => {
        return (
          element.year == rowData.year &&
          element.month == rowData.month &&
          element.mainTable.date == rowData.mainTable.date
        )
      })
      let targetData = state.mainData.find(element => {
        return (
          element.year == rowData.year &&
          element.month == rowData.month &&
          element.mainTable.date == rowData.mainTable.date + 1
        )
      })

      targetData.childTable[table].items.push(
        affectedData.childTable[table].items[affectedRow]
      )
    },
    emptyMainData: (state, payload) => {
      state.mainData = []
    }
  },
  actions: {
    addChildTableRow: (context, payload) => {
      context.commit('addChildTableRow', payload)
    },
    mainTableAddRow: (context, payload) => {
      context.commit('mainTableAddRow', payload)
    },
    mainDataInit: (context, payload) => {
      context.commit('mainDataInit', payload)
    },
    toggleRowDetails: (context, payload) => {
      context.commit('toggleRowDetails', payload)
    },
    emptyMainData: (context, payload) => {
      context.commit('emptyMainData')
    },
    deleteChildTableRow: (context, payload) => {
      context.commit('deleteChildTableRow', payload)
    },
    editChildTableData: (context, payload) => {
      context.commit('editChildTableData', payload)
    },
    mainTableEditRow: (context, payload) => {
      context.commit('mainTableEditRow', payload)
    },
    reValidateRow: (context, payload) => {
      context.commit('reValidateRow', payload)
    },
    mainDataAjaxUpdate: (context, payload) => {
      context.commit('mainDataAjaxUpdate', payload)
    }
  }
})
