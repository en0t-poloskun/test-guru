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
import FormInline from 'utilities/form_inline'
import ProgressBar from 'utilities/progress_bar'
import Timer from 'utilities/timer'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('turbolinks:load', function() {
  const sortByColumn = document.querySelector('.sort-by')
  const confirmPassword = document.getElementById("confirmPassword")
  const editLinks = document.querySelectorAll('.form-inline-link')
  const progressBar = document.getElementById("bar")
  const timer = document.getElementById("timer")
 
  if (sortByColumn) { sortByColumn.addEventListener('click', sortTable) }
  if (confirmPassword) { confirmPassword.addEventListener('input', passwordMatch) }
  if (editLinks.length) {
    for (let link of editLinks) {
      link.addEventListener('click', formInlineLinkHandler)
    }
  }
  if (progressBar) { new ProgressBar(progressBar).showProgress() }
  if (timer) { new Timer(timer.dataset.timeLeft).countdown() }

  const errors = document.querySelector('.resource-errors')

  if (errors && editLinks.length) {
    const resourceId = errors.dataset.resourceId
    const event = new Event('click')
    document.querySelector('.form-inline-link[data-test-id="' + resourceId + '"]').dispatchEvent(event)
  }
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

let formInlineLinkHandler = (event) => {
  event.preventDefault()

  const testId = event.target.dataset.testId
  const link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
  const testTitle = document.querySelector('.test-name[data-test-id="' + testId + '"]')
  const formInline = document.querySelector('.form-inline[data-test-id="' + testId + '"]')

  new FormInline(link, testTitle, formInline).handle()
}