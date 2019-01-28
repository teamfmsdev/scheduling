<template>
  <b-container>
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
        <template v-for="(val,index) in items">
          <tr @click.stop="rowClicked" :key="index">
            <template v-for="(val,index) in items[index]">
              <td :key="index" v-if="index!='rowDetails'">{{val}}</td>
            </template>
          </tr>
          <tr :key="index + ' detail'" v-if="val.rowDetails==true">
            <template v-for="(val,index) in items[index]">
              <td :key="index" v-if="index!='rowDetails'">This is Row Details!</td>
            </template>
          </tr>
        </template>
      </tbody>
    </table>
  </b-container>
</template>


<script>
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
      items: []
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
    rowClicked:function(event){

    }
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
        n1: "",
        n2: "",
        n3: "",
        n4: "",
        n5: "",
        n6: "",
        n7: "",
        n8: "",
        contractorManagement: "",
        rowDetails: false
      });
    }
  }
};
</script>


<style>
body {
  /* background-color: rgb(36, 34, 34); */
}
</style>



