<template>
  <b-container fluid>
    <b-form-select
      class="text-center"
      @change="dateChange"
      v-model="selectedMonths"
      :options="monthOptions"
    />
    <b-form-select
      class="text-center"
      @change="dateChange"
      v-model="selectedYear"
      :options="yearOptions"
    />
    <table class="table table-sm table-bordered">
      <thead class>
        <tr>
          <template v-for="field in fields">
            <template v-if="headerRender(field.label)">
              <th
                :key="field.key"
                v-if="field.label !='Contract Management'"
                :rowspan="2"
                class="align-middle"
              >{{field.label}}</th>
              <th :key="field.key" v-else :colspan="8">{{field.label}}</th>
            </template>
          </template>
        </tr>
        <tr>
          <template v-for="field in fields">
            <template v-if="!headerRender(field.label)">
              <th :key="field.key">{{field.label}}</th>
            </template>
          </template>
        </tr>
      </thead>

      <tbody>
        <template v-for="(val,rowIndex) in mainData">
          <tr
            class="parentRow"
            :class="{currentDay:isToday(rowIndex)}"
            :id="rowIndex"
            @click.stop="rowClicked"
            :key="rowIndex"
          >
            <template v-for="(val,dataIndex) in mainData[rowIndex]['mainTable']">
              <!-- Do a loop LATER -->
              <td :key="dataIndex" v-if="dataIndex == 'day'" v-text="val"></td>
              <td :key="dataIndex" v-else-if="dataIndex == 'date'" v-text="val"></td>
              <td
                :key="dataIndex"
                v-html="childTableLength(rowIndex,'biA')"
                v-else-if="dataIndex == 'biActivities'"
              ></td>
              <td
                :key="dataIndex"
                v-html="childTableLength(rowIndex,'ptw')"
                v-else-if="dataIndex == 'permitToWork'"
              ></td>
              <td
                :key="dataIndex"
                v-else-if="dataIndex == 'projectActivities'"
                v-html="childTableLength(rowIndex,'pa')"
              ></td>
              <td
                :key="dataIndex"
                v-else-if="dataIndex == 'contractorManagement'"
                v-html="childTableLength(rowIndex,'cm')"
              ></td>
              <!-- <td :key="dataIndex" v-else-if="dataIndex == 'day'">{{val}}</td> -->
              <td :key="dataIndex" :class="dynamicClass(val)" v-else></td>
            </template>
          </tr>

          <tr
            class="childRow"
            :id="rowIndex"
            :key="rowIndex + ' detail'"
            v-if="val.rowDetails==true"
          >
            <template v-for="(val,index) in mainData[rowIndex]['mainTable']">
              <td :key="index" v-if="index=='biActivities'">
                <childTable class="mx-auto" v-bind="biA" :mainTable="mainData"></childTable>
              </td>
              <td class :key="index" v-else-if="index=='permitToWork'">
                <childTable class="mx-auto" v-bind="ptw" :mainTable="mainData"></childTable>
              </td>
              <td :id="index" :key="index" v-else-if="index =='projectActivities'">
                <childList v-bind="pa" :mainTable="mainData"></childList>
              </td>
              <td :id="index" :key="index" v-else-if="index =='contractorManagement'">
                <childList v-bind="cm" :mainTable="mainData"></childList>
              </td>
              <td
                :id="index"
                class="align-middle"
                :key="index"
                style="border:none;"
                v-else-if="index =='day' || index=='date'"
              ></td>

              <td
                :id="index"
                class="align-middle"
                :class="dynamicClass(val)"
                :key="index"
                @click="editRow(val,$event)"
                v-else
              ></td>
            </template>
          </tr>
        </template>
        <tr class="totalCount">
          <td :colspan="2" v-html="'<b>Total</b>'"></td>
          <td v-html="totalLength('biA')"></td>
          <td v-html="totalLength('ptw')"></td>
          <td v-html="totalLength('pa')"></td>
          <td :class="dynamicClass(mainData[mainData.length-1]['mainTable']['n1'])"></td>
          <td :class="dynamicClass(mainData[mainData.length-1]['mainTable']['n2'])"></td>
          <td :class="dynamicClass(mainData[mainData.length-1]['mainTable']['n3'])"></td>
          <td :class="dynamicClass(mainData[mainData.length-1]['mainTable']['n4'])"></td>
          <td :class="dynamicClass(mainData[mainData.length-1]['mainTable']['n5'])"></td>
          <td :class="dynamicClass(mainData[mainData.length-1]['mainTable']['n6'])"></td>
          <td :class="dynamicClass(mainData[mainData.length-1]['mainTable']['n7'])"></td>
          <td :class="dynamicClass(mainData[mainData.length-1]['mainTable']['n8'])"></td>
          <td v-html="totalLength('cm')"></td>
        </tr>
      </tbody>
    </table>
  </b-container>
</template>

<script>
import childTable from '@/components/childTable.vue'
import childList from '@/components/childList.vue'
import dayjs from 'dayjs'
import axios from 'axios'
// import axios from "axios";

export default {
  data () {
    return {
      fields: [
        {
          key: 'day',
          label: 'Day'
        },
        {
          key: 'date',
          label: 'Date'
        },
        {
          key: 'biActivities',
          label: 'B&I Activities'
        },
        {
          key: 'permitToWork',
          label: 'Permit To Work'
        },
        {
          key: 'projectActivities',
          label: 'Project Activities'
        },
        { key: '1', label: '1' },
        { key: '2', label: '2' },
        { key: '3', label: '3' },
        { key: '4', label: '4' },
        { key: '5', label: '5' },
        { key: '6', label: '6' },
        { key: '7', label: '7' },
        { key: '8', label: '8' },
        {
          key: 'contractManagement',
          label: 'Contract Management'
        },
        {
          key: 'contractorManagement',
          label: 'Contractor Management'
        }
      ],
      items: [],
      selectedMonths: dayjs(new Date()).format('MMM'),
      selectedYear: dayjs(new Date()).format('YYYY'),
      monthOptions: [
        { value: 'Jan', text: 'January' },
        { value: 'Feb', text: 'February' },
        { value: 'Mar', text: 'March' },
        { value: 'Apr', text: 'April' },
        { value: 'May', text: 'May' },
        { value: 'Jun', text: 'June' },
        { value: 'Jul', text: 'July' },
        { value: 'Aug', text: 'August' },
        { value: 'Sep', text: 'September' },
        { value: 'Oct', text: 'October' },
        { value: 'Nov', text: 'November' },
        { value: 'Dec', text: 'December' }
      ],

      yearOptions: [
        { value: '2019', text: '2019' },
        { value: '2020', text: '2020' },
        { value: '2021', text: '2021' },
        { value: '2022', text: '2022' },
        { value: '2023', text: '2023' }
      ],
      selectedDate: new Date(),
      biA: '',
      ptw: '',
      pa: '',
      cm: ''
    }
  },

  methods: {
    headerRender: function (label) {
      return (
        label != '1' &&
        label != '2' &&
        label != '3' &&
        label != '4' &&
        label != '5' &&
        label != '6' &&
        label != '7' &&
        label != '8'
      )
    },
    rowDetailsRender: function (index) {
      if (index != 'rowDetails') {
        switch (index) {
          case 'biActivities':
          case 'permitToWork':
          case 'projectActivities':
          case 'n1':
          case 'n2':
          case 'n3':
          case 'n4':
          case 'n5':
          case 'n6':
          case 'n7':
          case 'n8':
          case 'contractorManagement':
            return true
          default:
            return false
        }
      }
    },
    rowClicked: function (event) {
      // console.log("ROW CLICKED CALL");
      // Set the clicked row "Id" attribute as a var to match mainData index
      let clickedRowId = event.target.parentNode.id
      // console.log(clickedRowId);
      // Row data from vuex store mainData with index that matches clickedRowId
      let clickedRowData = this.mainData[clickedRowId]
      // Set the props to be pass to childTableComponents
      this.biA = this.getRowDetails(clickedRowData, 'biA')
      this.ptw = this.getRowDetails(clickedRowData, 'ptw')
      this.pa = this.getRowDetails(clickedRowData, 'pa')
      this.cm = this.getRowDetails(clickedRowData, 'cm')
      // Get row data with rowDetails = true from vuex
      let currentExpandedRow = this.$store.getters.currentExpandedRow

      if (currentExpandedRow.length > 0) {
        currentExpandedRow.forEach(row => {
          // Close all currently expanded rows
          row.year != clickedRowData.year ||
          row.month != clickedRowData.month ||
          row.mainTable.date != clickedRowData.mainTable.date
            ? this.$store.dispatch('toggleRowDetails', row)
            : ''
        })
      }
      // Toggle/inverse current clicked row its rowDetails prop
      this.$store.dispatch('toggleRowDetails', clickedRowData)
    },
    editRow: function (currentVal, event) {
      // rowId that matches mainTable
      let rowId = event.target.parentNode.id
      // console.log(rowId);

      // Whole data for mainTable row that matches rowId
      let rowData = this.mainData[rowId]

      // User typed data in <td> to be updated in vuex store
      let newValue = event.target.innerText

      let newData = {
        rowData: rowData,
        tData: event.target.id,
        data: newValue
      }

      this.$store.dispatch('mainTableEditRow', newData)
    },
    getRowDetails: function (rowData, tName) {
      // Find affected mainData row
      let affectedData = this.$store.state.mainData.find(element => {
        return (
          element.year == rowData.year &&
          element.month == rowData.month &&
          element.mainTable.date == rowData.mainTable.date
        )
      })
      // Return the mainData childTable with key that matches tName
      return affectedData.childTable[tName]
    },
    dateChange: function () {
      this.$nextTick(function () {
        // If existing data for month/year is 0
        if (this.mainData.length == 0) {
          this.generateDaysOfMonth()
        } else {
          this.$store.dispatch('mainDataAjaxUpdate', {
            day: '1',
            month: this.selectedMonths,
            year: this.selectedYear
          })
        }
      })
    },
    getDays: function (year, month) {
      let date = new Date(year, month, 1)
      let days = []
      while (date.getMonth() == month) {
        days.push({
          day: date.toLocaleString('en-gb', { weekday: 'short' }),
          date: date.getDate()
        })
        date.setDate(date.getDate() + 1)
      }
      return days
    },
    generateDaysOfMonth: function () {
      return new Promise(resolve => {
        this.selectedDate = new Date(this.currentSelectedDate)
        let year = this.selectedDate.getFullYear()
        let month = this.selectedDate.getMonth()
        let days = this.getDays(year, month)
        // Empty store MainData
        // this.$store.dispatch("emptyMainData");
        for (let day of days) {
          let tempObj = {
            month: this.selectedDate.toLocaleString('en-gb', {
              month: 'short'
            }),
            year: year,
            mainTable: {
              day: day.day,
              date: day.date,
              biActivities: '',
              permitToWork: '',
              projectActivities: '',
              n1: 'p0',
              n2: 'p0',
              n3: 'p0',
              n4: 'p0',
              n5: 'p0',
              n6: 'p0',
              n7: 'p0',
              n8: 'p0',
              contractorManagement: ''
            },
            childTable: {
              biA: {
                tableName: 'biA',
                fields: {
                  fmNo: 'FM#',
                  priority: 'P#',
                  activities: 'Activity',
                  buttons: 'Actions'
                },
                items: []
              },
              ptw: {
                tableName: 'ptw',
                fields: {
                  fmNo: 'PTW#',
                  activities: 'Activity',
                  buttons: 'Actions'
                },
                items: []
              },
              pa: {
                tableName: 'pa',

                items: []
              },
              cm: {
                tableName: 'cm',
                items: []
              }
            },
            rowDetails: false
          }

          this.$store.dispatch('mainDataInit', tempObj)
        }
        let date = dayjs(
          new Date(`1/${this.selectedMonths}/${this.selectedYear}`)
        ).format('YYYY-MM-DD')

        axios.get(`${this.$store.state.apiUrl}saveData.php`, {
          params: {
            date: date,
            operation: 'mainDataInit'
          }
        })
        this.$store.dispatch('mainDataAjaxUpdate', {
          day: '1',
          month: this.selectedMonths,
          year: this.selectedYear
        })
        resolve('Vue Created')
      })
    },
    childTableLength: function (rowIndex, cTable) {
      let count = 0
      let completedCount = 0
      let routineCount = 0
      // Test every row of childTable items for empty data
      this.mainData[rowIndex]['childTable'][cTable].items.forEach(
        (rowValue, itemIndex) => {
          // Count completed/routine/non-routine activity
          if (cTable == 'biA') {
            if (
              rowValue['fmNo'].trim() != '' ||
              rowValue['priority'].trim() != '' ||
              rowValue['activities'].trim() != ''
            ) {
              count += 1
              // Check for completed job
              if (rowValue['status'] == 1) {
                completedCount += 1
              }
              // Check for routine job
              // if (cTable == "ptw" && rowValue["type"] == "R") {
              //   routineCount += 1;
              // }
            }
          } else if (cTable == 'ptw') {
            if (
              rowValue['fmNo'].trim() != '' ||
              rowValue['activities'].trim() != ''
            ) {
              count += 1
              // Check for completed job
              // if (cTable == "biA" && rowValue["status"] == 1) {
              //   completedCount += 1;
              // }
              // Check for routine job
              if (cTable == 'ptw' && rowValue['type'] == 'R') {
                routineCount += 1
              }
            }
            // console.log(count);
          } else {
            if (rowValue['activities'].trim() != '') {
              count += 1
              // return true;
            }
          }
          // rowIndex == 3 ? console.log(rowIndex) : "";
        }
      )

      let totalString

      if (cTable == 'biA') {
        // totalString = `<b>Completed</b>: <mark>${completedCount}</mark> / Total: ${count}`;
        if (count == 0) {
          totalString = ''
        } else {
          totalString = `<i  class="fas fas fa-check-circle fa-lg text-primary"></i> <mark style='background-color:#057953; color:white;'><b>${completedCount}</b></mark> <b>/</b> <mark style='background-color:#4c4c4c; color:white;'><b>${count}</b></mark>`
        }
        // else {
        //   totalString = `<b>Completed :</b> <mark style='background-color:#057953; color:white;'><b>${completedCount}</b></mark> <b>Total :</b> <mark style='background-color:#4c4c4c; color:white;'><b>${count}</b></mark>`;
        // }
      } else if (cTable == 'ptw') {
        if (count == 0) {
          totalString = ''
        } else {
          totalString = `<i  class="fas fa-registered fa-lg text-primary"></i> <mark style='background-color:#40A6CC; color:white;'><b>${routineCount}</b></mark>  <b>/</b>  <mark style='background-color:#4c4c4c; color:white;'><b>${count}</b></mark>`
        }
        // else {
        //   totalString = `<b>Routine :</b> <mark style='background-color:#40A6CC; color:white;'><b>${routineCount}</b></mark> <b>Total :</b> <mark style='background-color:#4c4c4c; color:white;'><b>${count}</b></mark>`;
        // }
      } else {
        if (count == 0) {
          totalString = ''
        } else {
          totalString = `<b>Total :</b> <mark style='background-color:#4c4c4c; color:white;'><b>${count}</b></mark>`
        }
      }
      return totalString
      // if (count == 0) {
      //   return ''
      // } else if (count == 1) {
      //   return `${count} Activity`
      // } else {
      //   return `${count} Activities`
      // }
    },
    totalLength: function (colName) {
      let total = 0
      let completedCount = 0
      let routineCount = 0

      // Check every length of childTable excluding empty row and total it up
      let isNotEmpty
      this.mainData.forEach((rowValue, rowIndex) => {
        isNotEmpty = rowValue['childTable'][colName].items.forEach(
          (colValue, colIndex) => {
            if (colName == 'biA' || colName == 'ptw') {
              if (
                colValue['fmNo'].trim() != '' ||
                colValue['activities'].trim() != ''
              ) {
                total += 1
                // Check for completed job
                if (colName == 'biA' && colValue['status'] == 1) {
                  completedCount += 1
                }
                // Check for routine job
                if (colName == 'ptw' && colValue['type'] == 'R') {
                  routineCount += 1
                }
              }
            } else {
              if (colValue['activities'].trim() != '') {
                total += 1
              }
            }
          }
        )
      })

      let totalString

      if (colName == 'biA') {
        // totalString = `<b>Completed</b>: <mark>${completedCount}</mark> / Total: ${count}`;
        if (total == 0) {
          totalString = ''
        } else {
          totalString = `<b>Completed :</b> <mark style='background-color:#057953; color:white;'><b>${completedCount}</b></mark> <b>Total :</b> <mark style='background-color:#4c4c4c; color:white;'><b>${total}</b></mark>`
        }
      } else if (colName == 'ptw') {
        if (total == 0) {
          totalString = ''
        } else {
          totalString = `<b>Routine :</b> <mark style='background-color:#40A6CC; color:white;'><b>${routineCount}</b></mark> <b>Total :</b> <mark style='background-color:#4c4c4c; color:white;'><b>${total}</b></mark>`
        }
      } else {
        if (total == 0) {
          totalString = ''
        } else {
          totalString = `<b>Total :</b> <mark style='background-color:#4c4c4c; color:white;'><b>${total}</b></mark>`
        }
      }
      return totalString

      // if (total > 1) {
      //   return `${total} Activities`;
      // } else {
      //   return `${total} Activity`;
      // }
      // (total>1) ? return `${total} Activities`: `${total} Activity`;
      // console.log(currentMonthData);
    },
    dynamicClass: function (colorCode = 'p0') {
      switch (colorCode) {
        case 'p0':
          return 'p0'
        case 'p1':
          return 'p1'
        case 'p2':
          return 'p2'
        case 'p3':
          return 'p3'
        case 'p4':
          return 'p4'
        case 'p5':
          return 'p5'
      }
    },
    isToday (rowIndex) {
      let rowDate = dayjs(
        new Date(
          `${this.mainData[rowIndex].mainTable.date}/${
            this.mainData[rowIndex].month
          }/${this.mainData[rowIndex].year}`
        )
      ).format('YYYY-MM-DD')

      let todayDate = dayjs(new Date()).format('YYYY-MM-DD')

      if (rowDate == todayDate) {
        return true
      }
    }
  },
  created: async function () {
    let dataTest = await this.generateDaysOfMonth()
    // console.log(this.apiUrl);
    // console.log(process.env.VUE_APP_ROOT_API);
  },
  computed: {
    currentSelectedDate: function () {
      let month = this.selectedDate.getMonth()
      let year = this.selectedDate.getFullYear()
      return `${this.selectedMonths},1,${this.selectedYear}`
    },
    mainData () {
      return this.$store.state.mainData.filter(
        element =>
          element.month == this.selectedMonths &&
          element.year == this.selectedYear
      )
    }
  },
  components: { childTable, childList }
}
</script>

<style lang="scss" scoped>
.active {
  background-color: #193aa7;
}

.p0 {
  background-color: white;
}

.p1 {
  background-color: darkgreen;
}

.p2 {
  background-color: lightgreen;
}
.p3 {
  background-color: yellow;
}
.p4 {
  background-color: orange;
}
.p5 {
  background-color: red;
}

select {
  width: 25%;
  margin-bottom: 1%;
}

td {
  white-space: pre-wrap;
  word-wrap: break-word;
}

td:focus {
  border: 2px solid rgb(19, 146, 140);
}

th {
  background-color: rgb(0, 177, 169);
}

table {
  width: 100%;
  height: 100%;
  table-layout: fixed;
}

.parentRow {
  background-color: white;

  td {
    height: 37px;
    max-height: 37px;
    overflow: hidden;
    white-space: nowrap;
  }
}

.totalCount {
  background-color: #00b8ff;
}
.parentRow:hover {
  background-color: rgb(0, 177, 169);
}

.childRow {
  background-color: white;
  // color: white;
  border-top: 2px solid #07968f;
  border-bottom: 2px solid #07968f;
  // border: 2px solid #006560;
}

thead {
  tr:nth-child(1) {
    th:nth-child(1),
    th:nth-child(2) {
      width: 2.5%;
    }
    th:nth-child(3),
    th:nth-child(4) {
      width: 20%;
    }
    th:nth-child(5) {
      width: 15%;
    }
    th:nth-child(6) {
      width: 10%;
    }
    th:nth-child(7) {
      width: 15%;
    }
  }
}
.markComplete {
  background-color: #006d62 !important;
}

.currentDay {
  border-top: 2px solid #006e99;
  border-bottom: 2px solid #006e99;
  // border: 2px solid #006e99;
}
</style>
