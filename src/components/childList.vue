<template>
  <div>
    <ul class="list-group">
      <li :id="index" v-for="(val,index) in items" :key="index" class="list-group-item p-1">
        <div class="row no-gutters p-1">
          <!-- <div class="col-sm"></div> -->
          <div :contenteditable="true" class="col-sm-11 liText" v-text="val.activities"></div>
          <input
            @click="deleteRow"
            type="button"
            value="-"
            class="btn btn-sm btn-outline-primary col-sm-1 liBtn"
          >
        </div>
      </li>
    </ul>

    <input
      type="button"
      @click.stop="addRow"
      value="+"
      class="btn btn-sm btn-outline-primary w-25 my-3"
    >
  </div>
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
    addRow(event) {
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
    },
    deleteRow: function(event) {
      // mainTable row Id
      let rowId =
        event.target.parentNode.parentNode.parentNode.parentNode.parentNode
          .parentNode.id;

      let childTableRowId = event.target.parentNode.parentNode.id;

      console.log(childTableRowId);
      // Whole data for parent row
      let rowData = this.mainTable[rowId];

      let deletedRow = {
        rowData: rowData,
        table: this.tableName,
        data: { childTableRowId: childTableRowId }
      };

      this.$store.dispatch("deleteChildTableRow", deletedRow);
    }
  }
};
</script>

<style scoped>
.liText {
  white-space: pre-wrap;
  word-wrap: break-word;
}

.liBtn {
  height: 1%;
}
</style>

