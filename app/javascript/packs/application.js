// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import SortingTable from 'utilities/sorting_table'
import PasswordMatch from 'utilities/password_match'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('turbolinks:load', function() {
  const sortByColumn = document.querySelector('.sort-by')
  const confirmPassword = document.getElementById("confirmPassword")
  
  if (sortByColumn) { sortByColumn.addEventListener('click', sortTable) }
  if (confirmPassword) { confirmPassword.addEventListener('input', passwordMatch) }
})

let sortTable = () => {
  const table = document.getElementById("tableTest")
  if (table) { new SortingTable(table).sortTable() }
}

let passwordMatch = () => {
  const password = document.getElementById("password")
  const confirmPassword = document.getElementById("confirmPassword")
  if (password && confirmPassword) { new PasswordMatch(password, confirmPassword).check() }
}
