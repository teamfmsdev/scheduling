<template>
  <!-- <mainTable></mainTable> -->
  <mainTable></mainTable>
</template>

<script>
// @ is an alias to /src

import mainTable from '@/components/mainTable.vue'

export default {
  name: 'home',
  components: {
    mainTable
  }
}
</script>

 <style scoped>
body {
  background-color: rgb(36, 34, 34) !important;
}
tbody > tr:hover {
  background-color: rgb(0, 177, 169);
}
</style>
