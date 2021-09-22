import java.util.Vector;

class Quadrants {
  ArrayList<Quadrant> list = new ArrayList<Quadrant>();
  int length;
  Quadrants(Quadrant... quads) {
    for (Quadrant quad : quads) {
      this.list.add(quad);
    }
    this.length = this.list.size();
  }
  private void lightning() {
    for (Quadrant quad : this.list) {
      quad.lightning();
    }
  }
}

class Quadrant {
  int startX, startY, stopX, stopY;
  Quadrant(int startX, int startY, int stopX, int stopY) {
    this.startX = startX;
    this.startY = startY;
    this.stopX = stopX;
    this.stopY = stopY;
  }
  private void lightning() {
    background(0, 255, 0);
    int segments = (int) (Math.random() * 10 + 5);
    int segLen = mouseX / segments;
    int ogX = mouseX, ogY = mouseY;
    for (int i = 0; i < segments; i++) {
      int newX = ogX - segLen, newY = ogY + coordinate();
      line(ogX, ogY, newX, newY);
      ogX = newX;
      ogY = newY;
    }
  }
}

class Coordinate {
  int x, y;
  Coordinate(int x, int y) {
    this.x = x; 
    this.y = y;
  }
}

void draw() {
}

Quadrant QUAD1 = new Quadrant(0, 0, 400, 400);
Quadrant QUAD2 = new Quadrant(400, 0, 800, 400);
Quadrant QUAD3 = new Quadrant(0, 400, 400, 800);
Quadrant QUAD4 = new Quadrant(400, 400, 800, 800);
Quadrants QUADRANTS = new Quadrants(QUAD1, QUAD2, QUAD3, QUAD4);

void setup() {
  size(800, 800);
  strokeWeight(10);
  background(0, 255, 0);
  noFill();
}

void generate() {
  Vector<Coordinate> coordinates = new Vector<Coordinate>();
}

void mousePressed() {
  QUADRANTS.lightning();
}

int coordinate() {
  return Math.random() > 0.5 ? (int) (Math.random() * 100) : (int) (Math.random() * -100);
}
