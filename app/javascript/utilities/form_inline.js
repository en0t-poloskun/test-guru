class FormInline {
  constructor(link, attribute, form) {
    this.link = link
    this.attribute = attribute
    this.form = form
  }

  handle() {
    if (this.form.classList.contains('hide')) {
      this.attribute.classList.add('hide')
      this.form.classList.remove('hide')
      this.link.textContent = 'Cancel'
    }
    else {
      this.attribute.classList.remove('hide')
      this.form.classList.add('hide')
      this.link.textContent = 'Edit'
    }
  }

}
export default FormInline