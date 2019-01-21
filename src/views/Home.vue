<template>
  <mainTable></mainTable>
</template>

<script>
// @ is an alias to /src
import HelloWorld from '@/components/HelloWorld.vue'
import mainTable from '@/components/mainTable.vue'

export default {
  name: 'home',
  components: {
    HelloWorld,
    mainTable
  }
}
</script>
