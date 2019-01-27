<template>
  <b-table class="m-0" :fields="fields" :items="items">
    <template slot="table-caption">
      <b-button @click.stop="addRow" size="sm" class="rounded-circle">+</b-button>
    </template>
    <template slot="actionCol" slot-scope="data">
      <b-button size="sm" class="rounded-circle">Edit</b-button>
      <b-button size="sm" class="rounded-circle">Delete</b-button>
    </template>
  </b-table>
</template>

<script>
export default {
  data() {
    return {
      fields: [
        {
          key: "fmNo",
          label: "#FM",
          thClass: "align-middle"
        },
        {
          key: "activity",
          label: "Activity",
          thClass: "align-middle"
        },
        {
          key: "actionCol",
          label: "Action",
          thClass: "align-middle"
        }
      ],
      items: [
        { fmNo: "23", activity: "Jack Ryan" },
        { fmNo: "23", activity: "Police story 1" },
        { fmNo: "23", activity: "Police story 2" },
        { fmNo: "W", activity: "Men in black" }
      ]
    };
  },
  methods: {
    addRow: function() {
      this.items.push({
        fmNo: "420",
        activity: "R O F L"
      });
    }
  }
};
</script>


<style scoped>
</style>
