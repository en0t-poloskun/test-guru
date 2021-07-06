// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import SortingTable from 'utilities/sorting_table';

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('turbolinks:load', function() {
  const control = document.querySelector('.sort-by')
  
  if (control) { control.addEventListener('click', sortTable) }
})

let sortTable = () => {
  const table = document.getElementById("tableTest")
  if (table) {
    const sortingTable = new SortingTable(table)
    sortingTable.sortTable()
  }
}
