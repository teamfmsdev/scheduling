<template>
  <div>
    <table class="mx-auto">
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
            class="align-middle"
            @blur="editRow(tdVal,$event)"
          ></td>
          <td class="align-middle">
            <input
              type="button"
              class="btn btn-sm btn-outline-primary"
              @click.stop="deleteRow"
              value="-"
            >
            <input
              v-if="tableName=='ptw'"
              type="button"
              class="btn btn-sm btn-outline-primary"
              @click.stop="reValidate"
              value="R"
            >
          </td>
        </tr>
        <!-- <input
          type="button"
          value="+"
          class="btn btn-sm btn-outline-primary"
          @click.stop="addChildTableRow"
        >-->
      </tbody>
    </table>
    <input
      id="addButton"
      type="button"
      value="+"
      class="btn btn-sm btn-outline-primary w-25 my-3"
      @click.stop="addChildTableRow"
    >
  </div>
</template>

<script>
export default {
  props: {
    fields: Object,
    items: Array,
    tableName: String,
    mainTable: Array
  },

  data() {
    return {
      // tableName: this.tableName
    };
  },
  methods: {
    addChildTableRow: function(event) {
      // mainTable row Id
      let rowId = event.target.parentNode.parentNode.parentNode.id;
      // mainTable data from prop
      let rowData = this.mainTable[rowId];
      // New row to be added to vuex store
      let newRow = {
        // Id for row
        rowData: rowData,
        table: this.tableName,
        data: { fmNo: "", activities: "" }
      };
      this.$store.dispatch("addChildTableRow", newRow);
    },
    deleteRow: function(event) {
      // mainTable row Id

      let rowId =
        event.target.parentNode.parentNode.parentNode.parentNode.parentNode
          .parentNode.parentNode.id;
      // console.log(rowId);

      let childTableRowId = event.target.parentNode.parentNode.id;
      // Whole data for parent row
      let rowData = this.mainTable[rowId];

      let deletedRow = {
        rowData: rowData,
        table: this.tableName,
        data: { childTableRowId: childTableRowId }
      };

      this.$store.dispatch("deleteChildTableRow", deletedRow);
    },
    editRow: function(currentVal, event) {
      // mainTable data that matches event target row Id
      let rowId =
        event.target.parentNode.parentNode.parentNode.parentNode.parentNode
          .parentNode.id;

      // Affected childTable row Id
      let childTableRowId = event.target.parentNode.id;

      // Whole data for mainTable row
      let rowData = this.mainTable[rowId];
      // To diffrentiate which childTable <td> is
      // affected
      let dataType = event.target.id;
      // User typed data in <td> to be updated in
      // vuex store
      let newValue = event.target.innerText;
      // To be send to vuex mutations
      let newData = {
        rowData: rowData,
        table: this.tableName,
        affectedRow: childTableRowId,
        data: { newValue: newValue, dataType: dataType }
      };

      this.$store.dispatch("editChildTableData", newData);
    },
    reValidate: function(event) {
      // mainTable row Id
      let rowId =
        event.target.parentNode.parentNode.parentNode.parentNode.parentNode
          .parentNode.parentNode.id;
      // childTable row Id
      let childTableRowId = event.target.parentNode.parentNode.id;
      // mainTable data from prop
      let rowData = this.mainTable[rowId];

      let newData = {
        rowData: rowData,
        table: this.tableName,
        affectedRow: childTableRowId
      };
      this.$store.dispatch("reValidateRow", newData);
    }
  }
};
</script>


<style lang="scss" scoped>
#addButton {
}

td {
  white-space: pre-wrap;
  word-wrap: break-all;
}

td:focus {
  border: 2px solid rgb(19, 146, 140);
}

table {
  width: 100%;
  white-space: pre-wrap;
  word-wrap: break-all;
  word-break:break-all
}

th,
tr {
  height: 1%;
}
tr:hover {
  border: 2px solid rgba(0, 177, 168, 0.678);
  // background-color: rgba(0, 177, 168, 0.678);
}

th:nth-child(1) {
  width: 15%;
}
th:nth-child(2) {
  width: 65%;
}
th:nth-child(3) {
  width: 20%;
}
</style>

