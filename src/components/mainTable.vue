<template>
  <b-container fluid>
    <b-form-select @change="dateChange" v-model="selectedMonths" :options="monthOptions"/>
    <b-form-select @change="dateChange" v-model="selectedYear" :options="yearOptions"/>
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
          <tr class="parentRow" :id="rowIndex" @click.stop="rowClicked" :key="rowIndex">
            <template v-for="(val,dataIndex) in mainData[rowIndex]['mainTable']">
              <!-- Do a loop LATER -->
              <td :key="dataIndex" v-if="dataIndex == 'day'" v-text="val"></td>
              <td :key="dataIndex" v-else-if="dataIndex == 'date'" v-text="val"></td>
              <td
                :key="dataIndex"
                v-text="childTableLength(rowIndex,'biA')"
                v-else-if="dataIndex == 'biActivities'"
              ></td>
              <td
                :key="dataIndex"
                v-text="childTableLength(rowIndex,'ptw')"
                v-else-if="dataIndex == 'permitToWork'"
              ></td>
              <td
                :key="dataIndex"
                v-else-if="dataIndex == 'projectActivities'"
                v-text="childTableLength(rowIndex,'pa')"
              ></td>
              <td
                :key="dataIndex"
                v-else-if="dataIndex == 'contractorManagement'"
                v-text="childTableLength(rowIndex,'cm')"
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
      </tbody>
    </table>
  </b-container>
</template>

<script>
import childTable from "@/components/childTable.vue";
import childList from "@/components/childList.vue";

export default {
  data() {
    return {
      fields: [
        {
          key: "day",
          label: "Day",
          thClass: "align-middle",
          attr: "",
          span: "",
          sortable: false
        },
        {
          key: "date",
          label: "Date",
          thClass: "align-middle",
          attr: "",
          span: "",
          sortable: false
        },
        {
          key: "biActivities",
          label: "B&I Activities",
          attr: "",
          span: "",
          thClass: "align-middle"
        },
        {
          key: "permitToWork",
          label: "Permit To Work",
          attr: "",
          span: "",
          thClass: "align-middle"
        },
        {
          key: "projectActivities",
          label: "Project Activities",
          attr: "",
          span: "",
          thClass: "align-middle"
        },
        { key: "1", label: "1", attr: "", span: "" },
        { key: "2", label: "2", attr: "", span: "" },
        { key: "3", label: "3", attr: "", span: "" },
        { key: "4", label: "4", attr: "", span: "" },
        { key: "5", label: "5", attr: "", span: "" },
        { key: "6", label: "6", attr: "", span: "" },
        { key: "7", label: "7", attr: "", span: "" },
        { key: "8", label: "8", attr: "", span: "" },
        {
          key: "contractManagement",
          label: "Contract Management",
          attr: "",
          span: ""
        },
        {
          key: "contractorManagement",
          label: "Contractor Management",
          attr: "",
          span: ""
        }
      ],
      items: [],
      selectedMonths: "Jan",
      monthOptions: [
        { value: "Jan", text: "January" },
        { value: "Feb", text: "February" },
        { value: "Mar", text: "March" },
        { value: "Apr", text: "April" },
        { value: "May", text: "May" },
        { value: "Jun", text: "June" },
        { value: "Jul", text: "July" },
        { value: "Aug", text: "August" },
        { value: "Sep", text: "September" },
        { value: "Oct", text: "October" },
        { value: "Nov", text: "November" },
        { value: "Dec", text: "December" }
      ],
      selectedYear: "2019",
      yearOptions: [
        { value: "2019", text: "2019" },
        { value: "2020", text: "2020" },
        { value: "2021", text: "2021" },
        { value: "2022", text: "2022" },
        { value: "2023", text: "2023" }
      ],
      selectedDate: new Date(),
      biA: "",
      ptw: "",
      pa: "",
      cm: ""
    };
  },

  methods: {
    headerRender: function(label) {
      return (
        label != "1" &&
        label != "2" &&
        label != "3" &&
        label != "4" &&
        label != "5" &&
        label != "6" &&
        label != "7" &&
        label != "8"
      );
    },
    rowDetailsRender: function(index) {
      if (index != "rowDetails") {
        switch (index) {
          case "biActivities":
          case "permitToWork":
          case "projectActivities":
          case "n1":
          case "n2":
          case "n3":
          case "n4":
          case "n5":
          case "n6":
          case "n7":
          case "n8":
          case "contractorManagement":
            return true;
          default:
            return false;
        }
      }
    },
    rowClicked: function(event) {
      // console.log("ROW CLICKED CALL");
      // Set the clicked row "Id" attribute as a var to match mainData index
      let clickedRowId = event.target.parentNode.id;
      // console.log(clickedRowId);
      // Row data from vuex store mainData with index that matches clickedRowId
      let clickedRowData = this.mainData[clickedRowId];
      // Set the props to be pass to childTableComponents
      this.biA = this.getRowDetails(clickedRowData, "biA");
      this.ptw = this.getRowDetails(clickedRowData, "ptw");
      this.pa = this.getRowDetails(clickedRowData, "pa");
      // Get row data with rowDetails = true from vuex
      let currentExpandedRow = this.$store.getters.currentExpandedRow;

      if (currentExpandedRow.length > 0) {
        currentExpandedRow.forEach(row => {
          // Close all currently expanded rows
          row.year != clickedRowData.year ||
          row.month != clickedRowData.month ||
          row.mainTable.date != clickedRowData.mainTable.date
            ? this.$store.dispatch("toggleRowDetails", row)
            : "";
        });
      }
      // Toggle/inverse current clicked row its rowDetails prop
      this.$store.dispatch("toggleRowDetails", clickedRowData);
    },
    editRow: function(currentVal, event) {
      //rowId that matches mainTable
      let rowId = event.target.parentNode.id;
      // console.log(rowId);

      // Whole data for mainTable row that matches rowId
      let rowData = this.mainData[rowId];

      // User typed data in <td> to be updated in vuex store
      let newValue = event.target.innerText;

      let newData = {
        rowData: rowData,
        tData: event.target.id,
        data: newValue
      };

      this.$store.dispatch("mainTableEditRow", newData);
    },
    getRowDetails: function(rowData, tName) {
      // Find affected mainData row
      let affectedData = this.$store.state.mainData.find(element => {
        return (
          element.year == rowData.year &&
          element.month == rowData.month &&
          element.mainTable.date == rowData.mainTable.date
        );
      });
      // Return the mainData childTable with key that matches tName
      return affectedData.childTable[tName];
    },
    dateChange: function() {
      this.$nextTick(function() {
        // If existing data for month/year is 0
        if (this.mainData.length == 0) {
          this.generateDaysOfMonth();
        }
      });
    },
    getDays: function(year, month) {
      let date = new Date(year, month, 1);
      let days = [];
      while (date.getMonth() == month) {
        days.push({
          day: date.toLocaleString("en-gb", { weekday: "short" }),
          date: date.getDate()
        });
        date.setDate(date.getDate() + 1);
      }
      return days;
    },
    generateDaysOfMonth: function() {
      this.selectedDate = new Date(this.currentSelectedDate);
      let year = this.selectedDate.getFullYear();
      let month = this.selectedDate.getMonth();
      let days = this.getDays(year, month);
      // Empty store MainData
      // this.$store.dispatch("emptyMainData");
      for (let day of days) {
        let tempObj = {
          month: this.selectedDate.toLocaleString("en-gb", { month: "short" }),
          year: year,
          mainTable: {
            day: day.day,
            date: day.date,
            biActivities: "",
            permitToWork: "",
            projectActivities: "",
            n1: false,
            n2: false,
            n3: false,
            n4: false,
            n5: false,
            n6: false,
            n7: false,
            n8: false,
            contractorManagement: ""
          },
          childTable: {
            biA: {
              tableName: "biA",
              fields: {
                fmNo: "FM#",
                activities: "Activity",
                buttons: "Actions"
              },
              items: []
            },
            ptw: {
              tableName: "ptw",
              fields: {
                fmNo: "PTW#",
                activities: "Activity",
                buttons: "Actions"
              },
              items: []
            },
            pa: {
              tableName: "pa",
              // fields: { fmNo: "FM NO", activities: "Activities" },
              items: [{ activities: "DUDUDU" }, { activities: "SSSS" }]
            }
          },
          rowDetails: false
        };

        this.$store.dispatch("mainDataInit", tempObj);
      }
    },
    childTableLength: function(rowIndex, cTable) {
      if (this.mainData[rowIndex].childTable[cTable].items.length == 0) {
        return "";
      } else if (this.mainData[rowIndex].childTable[cTable].items.length == 1) {
        return `${
          this.mainData[rowIndex].childTable[cTable].items.length
        } Activity`;
      } else {
        return `${
          this.mainData[rowIndex].childTable[cTable].items.length
        } Activities`;
      }
    }
  },
  created: function() {
    this.generateDaysOfMonth();
  },
  computed: {
    currentSelectedDate: function() {
      let month = this.selectedDate.getMonth();
      let year = this.selectedDate.getFullYear();
      return `${this.selectedMonths},1,${this.selectedYear}`;
    },
    mainData() {
      return this.$store.state.mainData.filter(
        element =>
          element.month == this.selectedMonths &&
          element.year == this.selectedYear
      );
    }
  },
  components: { childTable, childList }
};
</script>



<style lang="scss" scoped>
.active {
  background-color: #074a4f;
}
select {
  width: 25%;
  margin-bottom: 1%;
}

td,
th {
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
  // color: white;
  background-color: white;
  td {
    height: 37px;
    max-height: 37px;
    overflow: hidden;
    white-space: nowrap;
  }
}

.parentRow:hover {
  background-color: rgb(0, 177, 169);
}

.childRow {
  background-color: white;
  // color: white;
  border: 2px solid rgb(2, 233, 221);
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
</style>
