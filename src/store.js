import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
import dayjs from 'dayjs'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    mainData: [],
    apiUrl: process.env.VUE_APP_API_URL
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

      let date = dayjs(
        new Date(`${rowData.mainTable.date}/${rowData.month}/${rowData.year}`)
      ).format('YYYY-MM-DD')
      axios
        .get(`${state.apiUrl}updateData.php`, {
          params: {
            date: date,
            table: childTableName.toLowerCase(),
            // If row exist, assign the value of 'row' else send empty string
            row: '',
            type: '',
            data: '',
            operation: 'addChildTableData'
          }
        })
        .then(response => {
          // If the operation was a creating new record\
          data['row'] = response.data['row']
          if (childTableName.toLowerCase() == 'bia') {
            data.status = 0
          } else if (childTableName.toLowerCase() == 'ptw') {
            data.type = 'NR'
          }
          childTable[childTableName].items.push(data)
          console.log(response.data['serverMessage'])
        })
    },
    deleteChildTableRow: (state, payload) => {
      // Destructure
      let { rowData, table, data } = payload
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

      // DATABASE UPDATING

      let date = dayjs(
        new Date(`${rowData.mainTable.date}/${rowData.month}/${rowData.year}`)
      ).format('YYYY-MM-DD')
      axios
        .get(`${state.apiUrl}updateData.php`, {
          params: {
            date: date,
            table: table.toLowerCase(),
            // If row exist, assign the value of 'row' else send empty string
            row: childTable[table].items[data.childTableRowId]['row'],
            type: '',
            data: '',
            operation: 'deleteChildTableData'
          }
        })
        .then(response => {
          childTable[table].items.splice(data.childTableRowId, 1)
          console.log(response.data)
        })
    },
    editChildTableData: (state, payload) => {
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

      // Date of mainData
      let date = dayjs(
        new Date(`${rowData.mainTable.date}/${rowData.month}/${rowData.year}`)
      ).format('YYYY-MM-DD')

      // Check for childTable name
      // if its bia
      if (data.dataType == 'fmNo' && table.toLowerCase() == 'bia') {
        axios
          .get(`${state.apiUrl}miscRetrieve.php`, {
            params: {
              fmNo: data.newValue,
              operation: 'getWorkTitle'
            }
          })
          .then(async ({ data: serverData }) => {
            // If server response with a row information
            if (serverData) {
              let { rowData, table, affectedRow, data } = payload
              await axios
                .get(`${state.apiUrl}updateData.php`, {
                  params: {
                    date: date,
                    table: table.toLowerCase(),
                    // If row exist, assign the value of 'row' else send empty string
                    row: childTable[table].items[affectedRow]['row'],
                    type: data.dataType,
                    data: data.newValue,
                    operation: 'editChildTableData'
                  }
                })
                .then(() => {
                  if (serverData) {
                    childTable[table].items[affectedRow]['fmNo'] = data.newValue
                  }
                })
              // Save into database
              payload.data.newValue = serverData['priority']
              payload.data.dataType = 'priority'

              await axios
                .get(`${state.apiUrl}updateData.php`, {
                  params: {
                    date: date,
                    table: table.toLowerCase(),
                    // If row exist, assign the value of 'row' else send empty string
                    row: childTable[table].items[affectedRow]['row'],
                    type: data.dataType,
                    data: data.newValue,
                    operation: 'editChildTableData'
                  }
                })
                .then(() => {
                  if (serverData) {
                    childTable[table].items[affectedRow]['priority'] =
                      serverData['priority']
                  }
                })
              // Save activities into database
              payload.data.newValue = serverData['activities']
              payload.data.dataType = 'activities'
              await axios
                .get(`${state.apiUrl}updateData.php`, {
                  params: {
                    date: date,
                    table: table.toLowerCase(),
                    // If row exist, assign the value of 'row' else send empty string
                    row: childTable[table].items[affectedRow]['row'],
                    type: data.dataType,
                    data: data.newValue,
                    operation: 'editChildTableData'
                  }
                })
                .then(() => {
                  if (serverData) {
                    childTable[table].items[affectedRow]['activities'] =
                      serverData['activities']
                  }
                })
            } else {
              alert('FM# not in record')
            }
          })
      } else {
        axios
          .get(`${state.apiUrl}updateData.php`, {
            params: {
              date: date,
              table: table.toLowerCase(),
              // If row exist, assign the value of 'row' else send empty string
              row: childTable[table].items[affectedRow]['row'],
              type: data.dataType,
              data: data.newValue,
              operation: 'editChildTableData'
            }
          })
          .then(({ data }) => {
            childTable[table].items[affectedRow][data.dataType] = data.newValue
            return console.log(data)
          })
      }
      // Destructuring

      // Assigning new value to affected childTable
      // column

      // DATABASE UPDATING
    },
    // Toggle the completion of biA jobs
    toggleChildTableCompletion: (state, payload) => {
      let { rowData, table, affectedRow } = payload
      // Affected mainData
      let affectedData = state.mainData.find(element => {
        return (
          element.year == rowData.year &&
          element.month == rowData.month &&
          element.mainTable.date == rowData.mainTable.date
        )
      })
      let date = dayjs(
        new Date(`${rowData.mainTable.date}/${rowData.month}/${rowData.year}`)
      ).format('YYYY-MM-DD')

      let { childTable } = affectedData

      let newValue = childTable[table].items[affectedRow]['status'] == 0 ? 1 : 0

      axios
        .get(`${state.apiUrl}updateData.php`, {
          params: {
            date: date,
            table: table.toLowerCase(),
            // If row exist, assign the value of 'row' else send empty string
            row: childTable[table].items[affectedRow]['row'],
            type: '',
            data: newValue,
            operation: 'toggleChildTableCompletion'
          }
        })
        .then(({ data }) => {
          childTable[table].items[affectedRow]['status'] = newValue
          console.log(data)
        })
    },
    togglePtwType: (state, payload) => {
      let { rowData, table, affectedRow } = payload
      // Affected mainData
      let affectedData = state.mainData.find(element => {
        return (
          element.year == rowData.year &&
          element.month == rowData.month &&
          element.mainTable.date == rowData.mainTable.date
        )
      })
      let date = dayjs(
        new Date(`${rowData.mainTable.date}/${rowData.month}/${rowData.year}`)
      ).format('YYYY-MM-DD')

      let { childTable } = affectedData

      let newValue =
        childTable[table].items[affectedRow]['type'] == 'R' ? 'NR' : 'R'

      axios
        .get(`${state.apiUrl}updateData.php`, {
          params: {
            date: date,
            table: table.toLowerCase(),
            // If row exist, assign the value of 'row' else send empty string
            row: childTable[table].items[affectedRow]['row'],
            type: '',
            data: newValue,
            operation: 'togglePtwType'
          }
        })
        .then(({ data }) => {
          childTable[table].items[affectedRow]['type'] = newValue
          console.log(data)
        })
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

          // date of clicked row
          let date = dayjs(
            new Date(
              `${rowData.mainTable.date}/${rowData.month}/${rowData.year}`
            )
          ).format('YYYY-MM-DD')
          axios
            .get(`${state.apiUrl}updateData.php`, {
              params: {
                date: date,
                table: 'parentRow',
                // If row exist, assign the value of 'row' else send empty string
                row: '',
                type: tData,
                data: `p${newColor}`,
                operation: 'mainTableEditRow'
              }
            })
            .then(response => {
              console.log(response.data['serverMessage'])
              // Current clicked data
              mainTable[tData] = `p${newColor}`
              // Filtered date of  the following days
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
            })

          break
        default:
          mainTable[tData] = data
      }

      // console.log("Mutations called")
      // console.log(payload);
    },
    mainDataInit: async (state, payload) => {
      // console.log(serverResponse)
      state.mainData.push(payload)
      // .then(response => {
      //   state.mainData.push(payload)
      // })
    },
    mainDataAjaxUpdate: (state, payload) => {
      // Date to choose from
      let date = dayjs(
        new Date(`${payload.day}/${payload.month}/${payload.year}`)
      ).format('YYYY-MM-DD')
      console.log(state.apiUrl)
      axios
        .get(`${state.apiUrl}retrieveData.php`, {
          params: {
            date: date,
            operation: 'mainDataAjaxUpdate'
          }
        })
        .then(({ data }) => {
          // console.log(data)
          data.forEach((dataIndex, index) => {
            let affectedData = state.mainData.find(element => {
              return (
                element.year == dataIndex.year &&
                element.month == dataIndex.month &&
                element.mainTable.date == dataIndex.mainTable.date
              )
            })
            // Loop through each days
            for (let data in dataIndex) {
              switch (data) {
                case 'mainTable':
                  // console.log(data)
                  for (let mT in dataIndex[data]) {
                    switch (mT) {
                      case 'n1':
                      case 'n2':
                      case 'n3':
                      case 'n4':
                      case 'n5':
                      case 'n6':
                      case 'n7':
                      case 'n8':
                        // console.log(mT)
                        affectedData[data][mT] = dataIndex[data][mT]
                        break
                      default:
                        // console.log('mainTable default called Loop')
                        break
                    }
                  }
                  break
                case 'childTable':
                  for (let cT in dataIndex[data]) {
                    switch (cT) {
                      case 'biA':
                      case 'cm':
                      case 'pa':
                      case 'ptw':
                        for (let cTItem in dataIndex[data][cT]['items']) {
                          // Push data from ajax to childTable
                          // CTItem == index of childTable items from ajax
                          // console.log(
                          //   dataIndex[data][cT]["items"][cTItem]["row"]
                          // );

                          let existingRow = affectedData[data][cT][
                            'items'
                          ].findIndex(element => {
                            // Find the row value of ajax update in mainData
                            return (
                              element['row'] ==
                              dataIndex[data][cT]['items'][cTItem]['row']
                            )
                          })
                          // console.log(existingRow);

                          // TODO !!!!
                          // VUE KEEP REPLACING THE CHILDTABLE ITEMS ROW ACTIVITIES

                          // If item already exist in mainData[ChildTable]
                          if (existingRow != -1) {
                            for (let itemCol in affectedData[data][cT]['items'][
                              existingRow
                            ]) {
                              switch (itemCol) {
                                case 'fmNo':
                                case 'priority':
                                case 'activities':
                                case 'status':
                                  // Replace value of childtable items in mainData with the one from Ajax update
                                  affectedData[data][cT]['items'][existingRow][
                                    itemCol
                                  ] =
                                    dataIndex[data][cT]['items'][cTItem][
                                      itemCol
                                    ]
                                  break
                                default:
                                  break
                              }
                            }
                          } else {
                            affectedData[data][cT]['items'].push(
                              dataIndex[data][cT]['items'][cTItem]
                            )
                          }
                        }
                        break
                      default:
                        break
                    }
                  }
                  break
                default:
                  break
              }
            }
          })
        })
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
      // data to be validated
      let affectedData = state.mainData.find(element => {
        return (
          element.year == rowData.year &&
          element.month == rowData.month &&
          element.mainTable.date == rowData.mainTable.date
        )
      })
      // Target date
      let targetData = state.mainData.find(element => {
        return (
          element.year == rowData.year &&
          element.month == rowData.month &&
          element.mainTable.date == rowData.mainTable.date + 1
        )
      })

      let date = dayjs(
        new Date(
          `${targetData.mainTable.date}/${targetData.month}/${targetData.year}`
        )
      ).format('YYYY-MM-DD')
      axios
        .get(`${state.apiUrl}updateData.php`, {
          params: {
            date: date,
            table: table.toLowerCase(),
            // If row exist, assign the value of 'row' else send empty string
            row: '',
            type: '',
            data: '',
            fmNo: affectedData.childTable[table].items[affectedRow]['fmNo'],
            activities:
              affectedData.childTable[table].items[affectedRow]['activities'],
            type:
              // Set type value according to table
              table.toLowerCase() == 'bia'
                ? affectedData.childTable[table].items[affectedRow]['status']
                : affectedData.childTable[table].items[affectedRow]['type'],
            operation: 'reValidateChildTableData'
          }
        })
        .then(response => {
          // Deep copy to make it not a reactive data
          let newData = JSON.parse(
            JSON.stringify(affectedData.childTable[table].items[affectedRow])
          )
          newData['row'] = response.data['row']
          targetData.childTable[table].items.push(newData)
        })
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
    },
    toggleChildTableCompletion: (context, payload) => {
      context.commit('toggleChildTableCompletion', payload)
    },
    togglePtwType: (context, payload) => {
      context.commit('togglePtwType', payload)
    }
  }
})
