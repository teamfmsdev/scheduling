<template>
  <b-container fluid>
    <b-form-select @change="dateChange" v-model="selectedMonths" :options="monthOptions"/>
    <b-form-select @change="dateChange" v-model="selectedYear" :options="yearOptions"/>
    <table class="table table-dark table-sm table-bordered">
      <thead>
        <tr>
          <template v-for="field in fields">
            <template v-if="headerRender(field.label)">
              <th
                :key="field.key"
                v-if="field.label !='Contract Management'"
                :rowspan="2"
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
        <template v-for="(val,rowIndex) in mainTableData">
          <tr :id="rowIndex" @click.stop="rowClicked" :key="rowIndex">
            <template
              v-for="(val,dataIndex) in mainTableData[rowIndex]['mainTableData']['mainDetails']"
            >
              <td :key="dataIndex">{{val}}</td>
            </template>
          </tr>
          <tr :id="rowIndex" :key="rowIndex + ' detail'" v-if="val.mainTableData.rowDetails==true">
            <template
              v-for="(val,index) in mainTableData[rowIndex]['mainTableData']['mainDetails']"
            >
              <td :key="index" v-if="index=='biActivities'">
                <biActivitiesTable v-bind="biA" :mainTableData="mainTableData"></biActivitiesTable>
              </td>
              <td :key="index" v-else-if="index=='permitToWork'">
                <biActivitiesTable v-bind="ptw" :mainTableData="mainTableData"></biActivitiesTable>
              </td>
              <td :key="index" v-else-if="index=='projectActivities'">
                <!-- <biActivitiesTable v-bind="childTable.pa"></biActivitiesTable> -->
              </td>
              <td :key="index" v-else></td>
            </template>
          </tr>
        </template>
      </tbody>
    </table>
  </b-container>
</template>


<script>
import biActivitiesTable from "@/components/biActivitiesTable.vue";
import ptwTable from "@/components/ptwTable.vue";
import projectTable from "@/components/projectTable.vue";
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
      ptw: ""
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
      // Set the clicked row "Id" to a var that matches items index
      let clickedRowId = event.target.parentNode.id;
      let clickedRowData = this.mainTableData[clickedRowId];
      this.biA = this.getRowDetails(clickedRowData, "biA");
      this.ptw = this.getRowDetails(clickedRowData, "ptw");

      let currentExpandedRow = this.$store.getters.currentExpandedRow;
      if (currentExpandedRow.length > 0) {
        currentExpandedRow.forEach(element => {
          // set the date-1 of the expandedRow to be the id to be submitted as array.
          // let expandedRowId = element.mainTableData.mainDetails.date - 1;

          // console.log(element);
          element.year != clickedRowData.year ||
          element.month != clickedRowData.month ||
          element.mainTableData.mainDetails.date !=
            clickedRowData.mainTableData.mainDetails.date
            ? this.$store.dispatch("toggleRowDetails", element)
            : "";
        });
      }

      this.$store.dispatch("toggleRowDetails", clickedRowData);
      // console.log("rowClickedCalled Done");
      // console.log(clickedRowData);
    },
    getRowDetails: function(rowData, tName) {
      let resultData = this.$store.getters.realSimulationTableData.find(
        element => {
          return (
            element.year == rowData.year &&
            element.month == rowData.month &&
            element.mainTableData.mainDetails.date ==
              rowData.mainTableData.mainDetails.date
          );
        }
      );
      return resultData.mainTableData.childTable[tName];
      // return this.$store.getters.realSimulationTableData.mainTableData
      //   .childTable[tName];
    },
    dateChange: function() {
      this.$nextTick(function() {
        // console.log(this.mainTableData.length);
        if (this.mainTableData.length == 0) {
          // console.log("mainTableDataLength= " + this.mainTableData.length);
          this.generateDaysOfMonth();
          // console.log("mainTableDataLength= " + this.mainTableData.length);
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
      let date = new Date(this.currentSelectedDate);
      let year = date.getFullYear();
      let month = date.getMonth();
      let days = this.getDays(year, month);
      // Empty store MainData
      // this.$store.dispatch("emptyMainData");
      for (let day of days) {
        let tempObj = {
          month: date.toLocaleString("en-gb", { month: "short" }),
          year: year,
          mainTableData: {
            mainDetails: {
              day: day.day,
              date: day.date,
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
                items: []
              },
              ptw: {
                tableName: "ptw",
                fields: {
                  fmNo: "FM NO",
                  activities: "Activities",
                  buttons: "Actions"
                },
                items: []
              },
              pa: {
                tableName: "pa",
                fields: { fmNo: "FM NO", activities: "Activities" },
                items: []
              }
            },
            rowDetails: false
          }
        };

        this.$store.dispatch("realSimulationTableDataInit", tempObj);
      }
    },
    dataRequest: function() {
      return this.mainTableData;
    }
  },
  created: function() {
    this.selectedDate = new Date(
      `${this.selectedMonths},1,${this.selectedYear}`
    );
    let month = this.selectedDate.toLocaleString("en-gb", { month: "short" });
    let year = this.selectedDate.getFullYear();

    let data = this.$store.getters.realSimulationTableData.filter(
      element => element.month == month
    );

    month = this.selectedDate.getMonth();
    // Initialize store state if its empty
    if (data.length == 0) {
      let days = this.getDays(year, month);

      for (let day of days) {
        let tempObj = {
          month: this.selectedDate.toLocaleString("en-gb", { month: "short" }),
          year: year,
          mainTableData: {
            mainDetails: {
              day: day.day,
              date: day.date,
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
                items: []
              },
              ptw: {
                tableName: "ptw",
                fields: {
                  fmNo: "FM NO",
                  activities: "Activities",
                  buttons: "Actions"
                },
                items: []
              },
              pa: {
                tableName: "pa",
                fields: { fmNo: "FM NO", activities: "Activities" },
                items: []
              }
            },
            rowDetails: false
          }
        };

        this.$store.dispatch("realSimulationTableDataInit", tempObj);
      }
    }
  },
  computed: {
    currentSelectedDate: function() {
      let month = this.selectedDate.getMonth();
      let year = this.selectedDate.getFullYear();
      return `${this.selectedMonths},1,${this.selectedYear}`;
    },
    mainTableData: function() {
      return this.$store.getters.realSimulationTableData.filter(
        element =>
          element.month == this.selectedMonths &&
          element.year == this.selectedYear
      );
    }
  },
  components: { biActivitiesTable, ptwTable, projectTable }
};
</script>


<style>
</style>



