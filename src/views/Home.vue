<template>
  <!-- <mainTable></mainTable> -->
  <secTable></secTable>
</template>

<script>
// @ is an alias to /src
import HelloWorld from "@/components/HelloWorld.vue";
import mainTable from "@/components/mainTable.vue";
import secTable from "@/components/secTable.vue";

export default {
  name: "home",
  components: {
    HelloWorld,
    mainTable,
    secTable
  }
};
</script>


<style>
body {
  background-color: rgb(36, 34, 34) !important;
}
</style>
