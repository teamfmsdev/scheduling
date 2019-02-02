<template>
  <table>
    <thead>
      <th :key="key" v-for="(value,key) in fields">{{value}}</th>
    </thead>
    <tbody>
      <tr :id="rowKey" :key="rowKey" v-for="(value,rowKey) in items">
        <td
          :key="key"
          v-for="(tdVal,key) in items[rowKey]"
          v-text="tdVal"
          :id="key == 'fmNo'? 'fmNo':'activities'"
          :contenteditable="true"
          @blur="editRow(tdVal,$event)"
        ></td>
        <td>
          <input type="button" @click.stop="editRow" value="*">
          <input type="button" @click.stop="deleteRow" value="-">
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
        data: { fmNo: "420", activities: "R O F L" }
      };
      this.$store.dispatch("addRow", newRow);
    },
    deleteRow: function(event) {
      // Parent tr id
      let rowId =
        event.target.parentNode.parentNode.parentNode.parentNode.parentNode
          .parentNode.id;
      // child table tr id
      let childTableRowId = event.target.parentNode.parentNode.id;
      // Whole data for parent tr
      let rowData = this.mainTableData[rowId];

      let deletedRow = {
        rowData: rowData,
        table: this.tableName,
        data: { childTableRowId: childTableRowId }
      };
      this.$store.dispatch("deleteChildTableRow", deletedRow);
    },
    editRow: function(currentVal, event) {
      event.preventDefault();
      // console.log("called");

      let rowId =
        event.target.parentNode.parentNode.parentNode.parentNode.parentNode.id;

      // child table tr id
      let childTableRowId = event.target.parentNode.id;

      // Whole data for parent tr
      let rowData = this.mainTableData[rowId];
      let dataType = event.target.id;
      let newValue = event.target.innerText;
      let newData = {
        rowData: rowData,
        table: this.tableName,
        affectedRow: childTableRowId,
        data: { newValue: newValue, dataType: dataType }
      };

      this.$store.dispatch("editChildTableData", newData);
    }
  }
};
</script>
