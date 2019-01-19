<template>
  <b-container>
    <table class="table table-sm table-bordered">
      <thead>
        <tr>
          <th class="align-middle" rowspan="2">Day</th>
          <th class="align-middle" rowspan="2">Date</th>
          <th class="align-middle" rowspan="2">B&I Activities</th>
          <th class="align-middle" rowspan="2">Permit To Work</th>
          <th class="align-middle" rowspan="2">Project Activities</th>
          <th class="align-middle" colspan="8">Contract Management</th>
          <th class="align-middle" rowspan="2">Contractor Management</th>
        </tr>
        <tr>
          <th>1</th>
          <th>2</th>
          <th>3</th>
          <th>4</th>
          <th>5</th>
          <th>6</th>
          <th>7</th>
          <th>8</th>
        </tr>
      </thead>
      <tbody>
        <tr :key="item.day" v-for="item in items">
          <td>{{item.day}}</td>
          <td>{{item.date}}</td>
          <td>{{item.biActivities}}</td>
          <td>{{item.permitToWork}}</td>
          <td>{{item.projectActivities}}</td>
          <td>{{item.no1}}</td>
          <td>{{item.no2}}</td>
          <td>{{item.no3}}</td>
          <td>{{item.no4}}</td>
          <td>{{item.no5}}</td>
          <td>{{item.no6}}</td>
          <td>{{item.no7}}</td>
          <td>{{item.no8}}</td>
          <td>{{item.contractorManagement}}</td>
        </tr>
      </tbody>
    </table>
  </b-container>
</template>


<script>
export default {
  data() {
    return {
      // fields: [
      //   { key: "day", label: "Day" },
      //   { key: "date", label: "Date" },
      //   { key: "biActivities", label: "B&I Activities" },
      //   { key: "permitToWork", label: "Permit To Work" },
      //   { key: "projectActivities", label: "Project Activities" },
      //   { key: "1", label: "1" },
      //   { key: "2", label: "2" },
      //   { key: "3", label: "3" },
      //   { key: "4", label: "4" },
      //   { key: "5", label: "5" },
      //   { key: "6", label: "6" },
      //   { key: "7", label: "7" },
      //   { key: "8", label: "8" },
      //   { key: "contractManagement", label: "Contract Management" },
      //   { key: "contractorManagement", label: "Contractor Management" }
      // ],
      items: [
        {
          day: "Sun",
          date: "13/2/2018",
          biActivities: 2,
          permitToWork: 4,
          projectActivities: "Dem",
          no1: "D",
          no2: "D",
          no3: "D",
          no4: "D",
          no5: "D",
          no6: "D",
          no7: "D",
          no8: "D",
          contractorManagement: "Redd"
        },
        {
          day: "Sun",
          date: "13/2/2018",
          biActivities: 2,
          permitToWork: 4,
          projectActivities: "Dem",
          no1: "D",
          no2: "D",
          no3: "D",
          no4: "D",
          no5: "D",
          no6: "D",
          no7: "D",
          no8: "D",
          contractorManagement: "Redd"
        }
      ]
    };
  },
  methods: {
    getDays(month, year) {}
  }
};
</script>

<style scoped>
</style>

