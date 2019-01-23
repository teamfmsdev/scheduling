<template>
  <b-list-group>
    <b-list-group-item class="p-1">Jojo adventure</b-list-group-item>
    <b-list-group-item class="p-1">Naruto</b-list-group-item>
    <b-list-group-item class="p-1">Bleach</b-list-group-item>
  </b-list-group>
  <!-- <ul>
    <li>Naruto</li>
    <li>Bleach</li>
    <li>Kawasaki</li>
    <li>Honda</li>
  </ul>-->
  <!-- <textarea class="m-0"></textarea> -->
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
b-list-group-item {
  padding: 0;
}
</style>
