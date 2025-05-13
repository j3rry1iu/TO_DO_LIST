int totalMinutes = 5;     // Default timer duration
int totalSeconds = (totalMinutes * 60);
boolean running = false;
int startTime;             // When the timer started (in millis)
int elapsedSeconds = 0;    // Seconds passed since start


void draw() {
  background(255);
  translate(width/2, height/2);

  // Calculate remaining time
  int secondsLeft = max(0, totalSeconds - elapsedSeconds);
  int mins = secondsLeft / 60;
  int secs = secondsLeft % 60;

  // Draw outer circle
  stroke(0);
  noFill();
  ellipse(0, 0, 300, 300);

  // Draw sweeping hand
  float angle = map(elapsedSeconds, 0, totalSeconds, 0, TWO_PI);
  stroke(255, 0, 0);
  strokeWeight(4);
  line(0, 0, 150 * cos(-HALF_PI + angle), 150 * sin(-HALF_PI + angle));

  // Draw time text
  fill(0);
  text(nf(mins, 2) + ":" + nf(secs, 2), 0, 0);

  // Update timer
  if (running && elapsedSeconds < totalSeconds) {
    elapsedSeconds = (millis() - startTime) / 1000;
  } else if (elapsedSeconds >= totalSeconds) {
    running = false;
    fill(255, 0, 0);
    text("DONE", 0, 50);
  }
}

void keyPressed() {
  // Set timer from 1-9 minutes
  if (key >= '1' && key <= '9') {
    totalMinutes = key - '0';
    resetTimer();
  }

  // Set timer to 10, 20, or 30 minutes with Shift+1,2,3 (!, @, #)
  if (key == '!' || key == '@' || key == '#') {
    if (key == '!') totalMinutes = 10;
    if (key == '@') totalMinutes = 20;
    if (key == '#') totalMinutes = 30;
    resetTimer();
  }

  // Start or pause
  if (key == ' ') {
    if (!running) {
      startTime = millis() - elapsedSeconds * 1000;  // resume from last point
    }
    running = !running;
  }

  // Reset timer
  if (key == 'r' || key == 'R') {
    resetTimer();
  }
}

void resetTimer() {
  totalSeconds = totalMinutes * 60;
  elapsedSeconds = 0;
  running = false;
}
