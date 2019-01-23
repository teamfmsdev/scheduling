<template>
  <b-table class="m-0" :fields="fields" :items="items"></b-table>
</template>

<script>
export default {
  data() {
    return {
      fields: [
        {
          key: "ptwNo",
          label: "#PTW",
          thClass: "align-middle"
        },
        {
          key: "activity",
          label: "Activity",
          thClass: "align-middle"
        }
      ],
      items: [
        { ptwNo: "50", activity: "RRRR" },
        { ptwNo: "5", activity: "RRRR" },
        { ptwNo: "50", activity: "RRRR" }
      ]
    };
  }
};
</script>


<style scoped>
</style>
