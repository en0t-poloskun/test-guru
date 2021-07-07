class PasswordMatch {
  constructor(password, confirmPassword) {
    this.password = password
    this.confirmPassword = confirmPassword
  }

  check() {
    const passwordValue = this.password.querySelector('input').value
    const confirmPasswordValue = this.confirmPassword.querySelector('input').value

    if (confirmPasswordValue == "") {
      this.password.querySelector('.octicon-check-circle').classList.add('hide')
      this.password.querySelector('.octicon-x-circle').classList.add('hide')
      this.confirmPassword.querySelector('.octicon-check-circle').classList.add('hide')
      this.confirmPassword.querySelector('.octicon-x-circle').classList.add('hide')
    }
    else if (passwordValue == confirmPasswordValue) {
      this.password.querySelector('.octicon-check-circle').classList.remove('hide')
      this.password.querySelector('.octicon-x-circle').classList.add('hide')
      this.confirmPassword.querySelector('.octicon-check-circle').classList.remove('hide')
      this.confirmPassword.querySelector('.octicon-x-circle').classList.add('hide')
    }
    else {
      this.password.querySelector('.octicon-check-circle').classList.add('hide')
      this.password.querySelector('.octicon-x-circle').classList.remove('hide')
      this.confirmPassword.querySelector('.octicon-check-circle').classList.add('hide')
      this.confirmPassword.querySelector('.octicon-x-circle').classList.remove('hide')
    }
  }
}
export default PasswordMatch