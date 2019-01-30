<template>
  <table>
    <thead>
      <th :key="key" v-for="(value,key) in fields">{{value}}</th>
    </thead>
    <tbody>
      <tr :key="rowKey" v-for="(value,rowKey) in items">
        <td :key="key" v-for="(tdVal,key) in items[rowKey]">{{tdVal}}</td>
        <td>
          <input type="button" value="*">
          <input type="button" value="-">
        </td>
      </tr>
      <input type="button" value="+" @click.stop="addRow">
    </tbody>
  </table>
</template>


<script>
export default {
  props: {
    fields: Object,
    items: Array,
    tableName: String,
    mainTableData: Array
  },

  data() {
    return {
      // tableName: this.tableName
    };
  },
  methods: {
    addRow: function(event) {
      let rowId = event.target.parentNode.parentNode.parentNode.parentNode.id;
      let rowData = this.mainTableData[rowId];
      let newRow = {
        // Id for row
        rowData: rowData,
        table: this.tableName,
        data: { fmNo: "420", activity: "R O F L" }
      };
      this.$store.dispatch("addRow", newRow);
    }
  }
};
</script>
