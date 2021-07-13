class Timer {
  constructor(seconds_left) { 
    this.seconds_left = parseInt(seconds_left)
  }

  countdown() {
    let seconds_left = this.seconds_left
    let timer = setInterval(function () {
      let seconds = seconds_left%60
      let minutes = seconds_left/60%60
      
      if (seconds_left <= 0) {
        clearInterval(timer)
        window.location.href = window.location.href + "/result"
      } 
      else {
        minutes = Math.trunc(minutes)
        let strMinutes = minutes < 10 ? "0" + String(minutes) : String(minutes)
        let strSeconds = seconds < 10 ? "0" + String(seconds) : String(seconds)

        let strTimer = strMinutes + ':' + strSeconds
        let timerShow = document.getElementById("timer")
        if (timerShow) { timerShow.innerHTML = strTimer }
      }
      --seconds_left
    }, 1000)
  } 

}
export default Timer