<template>
  <div>
    <ul class="list-group">
      <li :id="index" v-for="(val,index) in items" :key="index" class="list-group-item p-1">
        <div class="row no-gutters p-1">
          <!-- <div class="col-sm"></div> -->
          <div
            @blur="editRow($event)"
            :contenteditable="true"
            class="col-sm-11 liText"
            v-text="val.activities"
          ></div>
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
  data () {
    return {}
  },
  methods: {
    addRow (event) {
      // mainTable row id
      let rowId = event.target.parentNode.parentNode.parentNode.id

      // mainTable data from prop
      let rowData = this.mainTable[rowId]
      // New row to be added to vuex store
      let newRow = {
        rowData: rowData,
        table: this.tableName,
        data: { activities: '' }
      }
      this.$store.dispatch('addChildTableRow', newRow)
    },
    deleteRow: function (event) {
      // mainTable row Id
      let rowId =
        event.target.parentNode.parentNode.parentNode.parentNode.parentNode
          .parentNode.id

      let childTableRowId = event.target.parentNode.parentNode.id

      console.log(childTableRowId)
      // Whole data for parent row
      let rowData = this.mainTable[rowId]

      let deletedRow = {
        rowData: rowData,
        table: this.tableName,
        data: { childTableRowId: childTableRowId }
      }

      this.$store.dispatch('deleteChildTableRow', deletedRow)
    },
    editRow: function (event) {
      // console.log(
      //   event.target.parentNode.parentNode.parentNode.parentNode.parentNode
      //     .parentNode.id
      // );

      // mainTable data that matches event target row Id
      let rowId =
        event.target.parentNode.parentNode.parentNode.parentNode.parentNode
          .parentNode.id

      // Affected list row Id
      let childTableRowId = event.target.parentNode.parentNode.id
      // console.log(childTableRowId);
      // return true;

      // Whole data for mainTable row
      let rowData = this.mainTable[rowId]
      // To diffrentiate which childTable <td> is
      // affected
      let dataType = 'activities'
      // User typed data in <td> to be updated in
      // vuex store
      let newValue = event.target.innerText
      // Trim start end
      newValue = newValue.trim()
      // To be send to vuex mutations
      let newData = {
        rowData: rowData,
        table: this.tableName,
        affectedRow: childTableRowId,
        data: { newValue: newValue, dataType: dataType }
      }

      this.$store.dispatch('editChildTableData', newData)
    }
  }
}
</script>

<style scoped>
.liText {
  white-space: pre-wrap;
  word-wrap: break-all;
  word-break:break-all;
  text-align: left;
}

li:hover {
  border: 2px solid rgba(0, 177, 168, 0.678);
}
li:focus {
  border: 2px solid rgb(19, 146, 140);
}

.liBtn {
  height: 1%;
}
</style>
