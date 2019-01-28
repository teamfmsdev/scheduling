<template>
  <b-container>
    <b-table
      v-on:row-clicked="rowClicked"
      :fields="fields"
      :items="items"
      class="table table-sm table-bordered"
      caption-top
    >
      <template slot="table-caption"></template>

      <template slot="row-details" slot-scope="row">
        <!-- {{row.item.day}}
        {{row.item.date}}-->
      </template>
    </b-table>
  </b-container>
</template>

<script>
import biActivitiesTable from "@/components/biActivitiesTable.vue";
import ptwTable from "@/components/ptwTable.vue";
import projectTable from "@/components/projectTable.vue";
import Vue from "vue";

export default {
  data() {
    return {
      fields: [
        { key: "day", label: "Day", thClass: "align-middle", sortable: false },
        {
          key: "date",
          label: "Date",
          thClass: "align-middle",
          sortable: false
        },
        {
          key: "biActivities",
          label: "B&I Activities",
          thClass: "align-middle"
        },
        {
          key: "permitToWork",
          label: "Permit To Work",
          thClass: "align-middle"
        },
        {
          key: "projectActivities",
          label: "Project Activities",
          thClass: "align-middle"
        },
        { key: "1", label: "1" },
        { key: "2", label: "2" },
        { key: "3", label: "3" },
        { key: "4", label: "4" },
        { key: "5", label: "5" },
        { key: "6", label: "6" },
        { key: "7", label: "7" },
        { key: "8", label: "8" }
        // { key: "contractManagement", label: "Contract Management" },
        // { key: "contractorManagement", label: "Contractor Management" }
      ],
      items: [],
      init: false,
      currentExpandedRow: null
    };
  },
  methods: {
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
    modifyTable: function() {
      var thead = document.querySelector("thead");
      var newRow = document.createElement("tr");
      thead.append(newRow);
      var toBeCloneTh = document.querySelectorAll("th");
      var newTh = [];
      for (let i of toBeCloneTh) {
        switch (i.innerHTML) {
          case "1":
          case "2":
          case "3":
          case "4":
          case "5":
          case "6":
          case "7":
          case "8":
            newTh.push(i);
            break;
          default:
            break;
        }
      }
      let cM = document.createElement("th");
      cM.innerHTML = "Contract Management";
      document.querySelector("thead tr:nth-child(1)").appendChild(cM);

      newRow = document.querySelector("thead tr:nth-child(2)");

      // Append to 2nd row
      for (let i of newTh) {
        newRow.appendChild(i);
      }
      this.fields.push({
        key: "contractorManagement",
        label: "Contractor Management",
        thClass: "align-middle"
      });
    },
    modifyHeader: function() {
      let firstRow = document.querySelectorAll("thead tr:nth-child(1) th");
      for (let i of firstRow) {
        switch (i.innerHTML) {
          case "Contract Management":
            i.setAttribute("colspan", "8");
            break;
          default:
            // i.classList.add("align-middle");
            i.setAttribute("rowspan", "2");
        }
      }
      this.init = true;
    },
    rowClicked: function(item, index, event) {
      // 1.Check if the same row is clicked
      if (
        this.currentExpandedRow != null &&
        this.currentExpandedRow.rowIndex == index
      ) {
        // Close the row detail and set curentExpanded row to be null
        item._showDetails = !item._showDetails;
        this.currentExpandedRow = null;
      }
      // 2.Check if different row is clicked while there is another row open
      else if (
        this.currentExpandedRow != null &&
        this.currentExpandedRow._showDetails == true
      ) {
        // Close the currently expanded row details
        this.currentExpandedRow._showDetails = false;
        // Expand the clicked row element its row details
        item._showDetails = true;
        // Set the currently expanded row tracker variable as the clicked item
        this.currentExpandedRow = item;
        this.currentExpandedRow["rowIndex"] = index;
      }
      // 3.If there is no expanded row details
      else {
        // Expand the clicked row element its row details
        item._showDetails = true;
        // Set the currently expanded row tracker variable as the clicked item
        this.currentExpandedRow = item;
        this.currentExpandedRow["rowIndex"] = index;
      }
      // Wait for DOM to re-render
      this.$nextTick(function() {
        if (item._showDetails) {
          var rowDetails = event.target.parentNode.nextSibling;
          this.modifyRowDetails(rowDetails);
        }
      });
    },
    modifyRowDetails: function(rowDetails) {
      // console.log(rowDetails.childNodes[0]);
      rowDetails.childNodes[0].setAttribute("colspan", 2);
      // rowDetails.childNodes[0].innerHTML = "";
      var newTd = document.createElement("td");

      // rowDetails.append(newTd);
      for (let x = 0; x < 3; x++) {
        let clonedTd = newTd.cloneNode(true);
        rowDetails.append(clonedTd);
      }
      let placeholder = document.createElement("div");

      // mount biActivity table to mainTable
      let biATableClass = Vue.extend(biActivitiesTable);
      let biATableInstance = new biATableClass();
      rowDetails.childNodes[1].append(placeholder);
      biATableInstance.$mount(rowDetails.childNodes[1].childNodes[0]);
      // Mount ptw Table
      let ptwTableClass = Vue.extend(ptwTable);
      let ptwTableInstance = new ptwTableClass();
      rowDetails.childNodes[2].append(placeholder);
      ptwTableInstance.$mount(rowDetails.childNodes[2].childNodes[0]);
      // Mount project
      let projectTableclass = Vue.extend(projectTable);
      let projectTableInstance = new projectTableclass();
      rowDetails.childNodes[3].append(placeholder);
      projectTableInstance.$mount(rowDetails.childNodes[3].childNodes[0]);
    }
  },
  created: function() {
    let days = this.getDays(2019, 0);
    for (let day of days) {
      this.items.push({
        day: day.day,
        date: day.date,
        biActivities: "",
        permitToWork: "",
        projectActivities: "",
        1: "",
        2: "",
        3: "",
        4: "",
        5: "",
        6: "",
        7: "",
        8: "",
        contractorManagement: "",
        _showDetails: false
      });
    }
  },
  mounted: function() {
    // Wait for all to render the modifyTable()
    this.$nextTick(function() {
      this.modifyTable();
    });
  },
  updated: function() {
    this.init == false ? this.modifyHeader() : "";
  },
  components: { biActivitiesTable, ptwTable }
};
</script>

<style scoped>
table {
  background-color: white;
  color: black !important;
}
</style>

<style>
tbody > tr:hover {
  background-color: rgb(0, 177, 169);
}

.selected {
  background-color: rgb(0, 177, 169);
}

.b-table-details:hover {
  background-color: white;
}
</style>
