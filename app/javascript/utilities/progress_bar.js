class ProgressBar {

  constructor(bar) { this.bar = bar }

  showProgress() {
    const width = parseInt(this.bar.dataset.questionNumber) * 100 / parseInt(this.bar.dataset.questionsSize)
    this.bar.style.width = width.toString() + '%'

    if (width == 100) {
      this.bar.style.borderRadius = "25px";
    }
  }
}
export default ProgressBar