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
        {{row.item.day}}
        {{row.item.date}}
      </template>
    </b-table>
  </b-container>
</template>

<script>
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
      init: false
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
      // let firstRow = document.querySelectorAll("thead tr:nth-child(1) th");

      // for (let i of firstRow) {
      //   switch (i.innerHTML) {
      //     case "Contract Management":
      //       i.setAttribute("colspan", "8");
      //       break;
      //     default:
      //       i.setAttribute("rowspan", "2");
      //   }
      // }
      // console.log(firstRow);
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
      // Expand row details
      item._showDetails = !item._showDetails;
      // Wait for DOM to re-render
      this.$nextTick(function() {
        if (item._showDetails) {
          var detailRow = event.target.parentNode.nextSibling;
          console.log(detailRow);
        }
      });
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
  }
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
</style>
