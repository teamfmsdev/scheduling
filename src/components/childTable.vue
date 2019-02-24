<template>
  <div>
    <table class="mx-auto">
      <thead>
        <th :key="key" v-for="(value,key) in fields">{{value}}</th>
      </thead>
      <tbody>
        <tr
          :class="{completed:value['status']=='1',routine:value['type']=='R'}"
          :id="rowKey"
          :key="rowKey"
          v-for="(value,rowKey) in items"
        >
          <template v-for="(tdVal,key) in items[rowKey]">
            <td
              :key="key"
              v-if="key=='fmNo' || key=='activities'"
              v-text="tdVal"
              :id="key == 'fmNo'? 'fmNo':'activities'"
              :contenteditable="true"
              class="align-middle"
              @blur="editRow(tdVal,$event)"
            ></td>
          </template>
          <td class="align-middle">
            <button
              v-if="tableName=='biA'"
              class="btn btn-sm btn-outline-primary fas fa-info-circle infoButton"
              @click="displayInfo"
              value
            ></button>

            <button
              v-if="tableName=='biA'"
              class="btn btn-sm btn-outline-primary fas fa-check-circle"
              @click="markCompleted"
              value="C"
            ></button>

            <button
              v-if="tableName=='ptw' || tableName=='biA'"
              class="btn btn-sm btn-outline-primary fas fa-arrow-circle-right revalidateBtn"
              @click.stop="reValidate"
              :value="tableName=='ptw'?'R':'CF'"
            ></button>
            <button
              v-if="tableName=='ptw'"
              class="btn btn-sm btn-outline-primary fas fa-clock"
              @click="markType"
              value="C"
            ></button>
            <button
              class="btn btn-sm btn-outline-primary fas fa-trash-alt deleteBtn"
              @click.stop="deleteRow"
              value="-"
            ></button>
            <!-- <input
              type="button"
              class="btn btn-sm btn-outline-primary deleteBtn"
              @click.stop="deleteRow"
              value="-"
            >-->
            <!-- <input
              v-if="tableName=='ptw' || tableName=='biA'"
              type="button"
              class="btn btn-sm btn-outline-primary revalidateBtn"
              @click.stop="reValidate"
              :value="tableName=='ptw'?'R':'CF'"
            >-->
            <!-- <input
              v-if="tableName=='biA'"
              type="button"
              class="btn btn-sm btn-outline-primary infoButton"
              @click="displayInfo"
              value
            >-->
            <!-- <input
              v-if="tableName=='ptw'"
              type="button"
              class="btn btn-sm btn-outline-primary"
              @click="markType"
              value="C"
            >-->
            <!-- <input
              v-if="tableName=='biA'"
              type="button"
              class="btn btn-sm btn-outline-primary infoButton"
              @click="displayInfo"
              value="I"
            >-->
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
    <!-- <input
      id="addButton"
      type="button"
      value="+"
      class="btn btn-sm btn-outline-primary w-25 my-3"
      @click.stop="addChildTableRow"
    >-->
    <button
      id="addButton"
      value
      class="btn btn-sm btn-outline-primary fas fa-plus-square fa-lg w-25 my-3"
      @click.stop="addChildTableRow"
    ></button>
    <b-modal centered v-model="modalShow">
      <div class="mx-auto" slot="modal-title">Activities Information</div>
      <b-container fluid>
        <b-row no-gutters>
          <b-col class="font-weight-bold">Work Title:</b-col>
          <b-col>{{modalItems.workTitle}}</b-col>
        </b-row>
        <hr>
        <b-row no-gutters>
          <b-col class="font-weight-bold">Priority:</b-col>
          <b-col>{{modalItems.priority}}</b-col>
          <b-col class="font-weight-bold">Type:</b-col>
          <b-col>{{modalItems.type}}</b-col>
        </b-row>
        <hr>
        <b-row no-gutters>
          <b-col class="font-weight-bold">Location:</b-col>
          <b-col>{{modalItems.location}}</b-col>
          <b-col class="font-weight-bold">Status:</b-col>
          <b-col>{{modalItems.status}}</b-col>
        </b-row>
        <hr>
        <b-row no-gutters>
          <b-col class="font-weight-bold">Description:</b-col>
          <b-col class="text-left">{{modalItems.description}}</b-col>
        </b-row>
      </b-container>
      <!-- <b-table class="modalTable" borderless outlined small stacked :items="modalItems"></b-table> -->
    </b-modal>
  </div>
</template>

<script>
import dayjs from 'dayjs'
import axios from 'axios'
export default {
  props: {
    fields: Object,
    items: Array,
    tableName: String,
    mainTable: Array
  },

  data () {
    return {
      modalShow: false,
      modalItems: {
        workTitle: '',
        priority: '',
        type: '',
        location: '',
        status: '',
        description: ''
      }

      // tableName: this.tableName
    }
  },
  methods: {
    addChildTableRow: function (event) {
      // mainTable row Id
      let rowId = event.target.parentNode.parentNode.parentNode.id
      // mainTable data from prop
      let rowData = this.mainTable[rowId]
      // New row to be added to vuex store
      let newRow = {
        // Id for row
        rowData: rowData,
        table: this.tableName,
        data: { fmNo: '', activities: '' }
      }
      this.$store.dispatch('addChildTableRow', newRow)
    },
    deleteRow: function (event) {
      // mainTable row Id

      let rowId =
        event.target.parentNode.parentNode.parentNode.parentNode.parentNode
          .parentNode.parentNode.id
      // console.log(rowId);

      let childTableRowId = event.target.parentNode.parentNode.id
      // Whole data for parent row
      let rowData = this.mainTable[rowId]

      let deletedRow = {
        rowData: rowData,
        table: this.tableName,
        data: { childTableRowId: childTableRowId }
      }

      this.$store.dispatch('deleteChildTableRow', deletedRow)
    },
    editRow: function (currentVal, event) {
      // mainTable data that matches event target row Id
      let rowId =
        event.target.parentNode.parentNode.parentNode.parentNode.parentNode
          .parentNode.id

      // Affected childTable row Id
      let childTableRowId = event.target.parentNode.id

      // Whole data for mainTable row
      let rowData = this.mainTable[rowId]
      // To diffrentiate which childTable <td> is
      // affected
      let dataType = event.target.id
      // User typed data in <td> to be updated in
      // vuex store
      let newValue = event.target.innerText
      // To be send to vuex mutations
      let newData = {
        rowData: rowData,
        table: this.tableName,
        affectedRow: childTableRowId,
        data: { newValue: newValue, dataType: dataType }
      }

      this.$store.dispatch('editChildTableData', newData)
    },
    reValidate: function (event) {
      // mainTable row Id
      let rowId =
        event.target.parentNode.parentNode.parentNode.parentNode.parentNode
          .parentNode.parentNode.id
      // childTable row Id
      let childTableRowId = event.target.parentNode.parentNode.id
      // mainTable data from prop
      let rowData = this.mainTable[rowId]

      let newData = {
        rowData: rowData,
        table: this.tableName,
        affectedRow: childTableRowId
      }
      this.$store.dispatch('reValidateRow', newData)
    },
    displayInfo: function (event) {
      let rowId = event.target.closest('tr').parentNode.closest('tr').id
      let childTableRowId = event.target.closest('tr').id

      let rowData = this.mainTable[rowId]

      // let date = days(new Date(`1/${this.rowData.mainTable.date}`))

      // let fmNo =
      //   rowData["childTable"][this.tableName]["items"][childTableRowId]["fmNo"];
      // console.log(fmNo);
      axios
        .get(`${this.$store.state.apiUrl}miscRetrieve.php`, {
          params: {
            fmNo:
              rowData['childTable'][this.tableName]['items'][childTableRowId][
                'fmNo'
              ]
          }
        })
        .then(({ data }) => {
          if (data != false) {
            for (let items in this.modalItems[0]) {
              this.modalItems[0][items] = data[items]
            }
            this.modalShow = !this.modalShow
          } else {
            alert('Error: FM# not in record')
          }
        })
    }
  },
  components: {}
}
</script>

<style lang="scss" scoped>
.deleteBtn,
.revalidateBtn {
  width: 25px;
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
  word-break: break-all;
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
  max-width: 15%;
}
th:nth-child(2) {
  width: 65%;
  max-width: 65%;
}
th:nth-child(3) {
  width: 20%;
  max-width: 20%;
}

.completed {
  background-color: lightgreen;
}

.routine {
  background-color: lightblue;
}
</style>
