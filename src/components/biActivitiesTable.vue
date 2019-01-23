<template>
  <b-table class="m-0" :fields="fields" :items="items"></b-table>
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
        { fmNo: "23", activity: "Hehe" }
      ]
    };
  }
};
</script>


<style scoped>
</style>
