<template>
  <table>
    <thead></thead>
    <tbody class="text-center">
      <template v-for="(value,key,index) in items">
        <tr>
          <td :key="key">
            <textarea class="form-control bg-dark text-light" :value="value.activities"></textarea>
          </td>
          <td :key="key +'button'">
            <input
              class="d-inline btn btn-light deleteBtn"
              :key="key +' button'"
              type="button"
              value="-"
            >
          </td>
        </tr>
      </template>
    </tbody>
    <input type="button" class="btn btn-light d-inline" value="+" @click.stop="addChildTableRow">
  </table>
</template>


<script>
export default {
  props: {
    items: Array,
    tableName: String,
    mainTable: Array
  },
  data() {
    return {};
  },
  methods: {
    addChildTableRow(event) {
      console.log(this.items);
      // mainTable row id
      let rowId = event.target.parentNode.parentNode.parentNode.id;
      // mainTable data from prop
      let rowData = this.mainTable[rowId];
      // New row to be added to vuex store
      let newRow = {
        rowData: rowData,
        table: this.tableName,
        data: { activities: "O Y E A" }
      };
      this.$store.dispatch("addChildTableRow", newRow);
    }
  }
};
</script>

<style scoped>
b-list-group {
  color: black;
}
</style>

