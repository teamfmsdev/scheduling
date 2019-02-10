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
              <td :key="dataIndex" v-if="dataIndex == 'day'">{{val}}</td>
              <td :key="dataIndex" v-else-if="dataIndex == 'date'">{{val}}</td>
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
              <td :key="dataIndex" v-else-if="dataIndex == 'projectActivities'">{{val}}</td>
              <td :key="dataIndex" v-else-if="dataIndex == 'contractorManagement'">{{val}}</td>
              <td :key="dataIndex" v-else-if="dataIndex == 'day'">{{val}}</td>
              <td :key="dataIndex" :class="{active:val}" v-else></td>
            </template>
          </tr>
          <transition :key="rowIndex + 'anim'" name="fade">
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
                <td
                  :id="index"
                  class="align-middle"
                  :key="index"
                  @blur="editRow(val,$event)"
                  :contentEditable="true"
                  v-else-if="index =='day'"
                ></td>
                <td
                  :id="index"
                  class="align-middle"
                  :key="index"
                  @blur="editRow(val,$event)"
                  :contentEditable="true"
                  v-else-if="index =='date'"
                ></td>
                <td
                  :id="index"
                  v-text="val"
                  class="align-middle"
                  :key="index"
                  @blur="editRow(val,$event)"
                  :contentEditable="true"
                  v-else-if="index =='projectActivities'"
                ></td>
                <td
                  :id="index"
                  v-text="val"
                  class="align-middle"
                  :key="index"
                  @blur="editRow(val,$event)"
                  :contentEditable="true"
                  v-else-if="index =='contractorManagement'"
                ></td>
                <td
                  :id="index"
                  class="align-middle"
                  :class="{active:val}"
                  :key="index"
                  @click="editRow(val,$event)"
                  v-else
                ></td>
              </template>
            </tr>
          </transition>
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
      pa: ""
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
              // fields: { fmNo: "FM NO", activities: "Activities" },
              items: []
            }
          },
          rowDetails: false
        };

        this.$store.dispatch("mainDataInit", tempObj);
      }
    }
    // dataRequest: function() {
    //   return this.;
    // }
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

<style>
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.5s;
}
.fade-enter, .fade-leave-to /* .fade-leave-active below version 2.1.8 */ {
  opacity: 0;
}
</style>
