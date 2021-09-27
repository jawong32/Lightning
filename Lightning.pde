class Coordinate {
  int x, y;

  Coordinate(int x, int y) {
    this.x = x;
    this.y = y;
  }

  Coordinate() {
    this((int) (Math.random() * 2), (int) (Math.random() * 2));
  }

  int randNum(int range, int min) {
    return (int) (Math.random() * (range + 1)) + min;
  }

  Coordinate next(Coordinate end) {
    if (end.x == 0) {
      this.x += this.randNum(90, -20);
    } else {
      this.x -= this.randNum(90, -20);
    }
    if (end.y == 0) {
      this.y += this.randNum(90, -20);
    } else {
      this.y -= this.randNum(90, -20);
    }
    return this;
  }
}

ArrayList<Coordinate> points = new ArrayList<Coordinate>();

void setup() {
  size(800, 800);
  strokeWeight(3);
  background(0);
  frameRate(300);
}

void draw() {
  background(0);
  if (mousePressed) {
    bolts();
    points.add(new Coordinate(mouseX, mouseY));
  }
  for (Coordinate p : points) {
    point(p.x, p.y);
  }
}

void keyPressed() {
  if (key == ' ') points.clear();
}

void lightning(Coordinate start, Coordinate end, int count) {
  if (count == 0) {
    return;
  }
  Coordinate next = new Coordinate(start.x, start.y).next(end);
  stroke(255);
  line(start.x, start.y, next.x, next.y);
  lightning(next, end, count - 1);
}

void bolts() {
  int count = (int) (Math.random() * 10) + 3;
  for (int i = 0; i < count; i++) {
    lightning(new Coordinate(mouseX, mouseY), new Coordinate(), (int) (Math.random() * 50) + 10);
  }
}
