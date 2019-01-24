<template>
  <b-table class="m-0" :fields="fields" :items="items">
    <template slot="table-caption">
      <input type="button" class="btn btn-primary rounded-circle" value="+">
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
        }
      ],
      items: [
        { fmNo: "23", activity: "Hehe" },
        { fmNo: "23", activity: "Hehe" },
        { fmNo: "23", activity: "Hehe" },
        { fmNo: "W", activity: "A" }
      ]
    };
  }
};
</script>


<style scoped>
</style>
