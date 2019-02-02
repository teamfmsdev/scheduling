<template>
  <!-- <mainTable></mainTable> -->
  <secTable></secTable>
</template>

<script>
// @ is an alias to /src

import secTable from '@/components/secTable.vue'

export default {
  name: 'home',
  components: {
    secTable
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
