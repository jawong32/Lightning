class Quadrants {
  ArrayList<Quadrant> list = new ArrayList<Quadrant>();
  int length;
  Quadrants(Quadrant... quads) {
    for (Quadrant quad: quads) {
      this.list.add(quad);
    }
    this.length = this.list.size();
  }
  private int find() {
    for (int i = 0; i < this.length; i++) {
      if (this.list[i].contains(int x, int y)) {
      }
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
  private boolean contains(int x, int y) {
    return y >= this.startX && x <= this.stopX
    && y >= this.startY && y <= this.stopY;
  }
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

void draw() {
}

void generateCoords() {
  
}

/*void mousePressed() {
  int segments = (int) (Math.random() * 10 + 5);
  int length = mouseX / segments;
  int ogX = 0, ogY = (int) (Math.random() * 501);
  for (int i = 0; i < segments; i++) {
    int newX = ogX + length, newY = ogY - coordinate();
    line(ogX, ogY, newX, newY);
    ogX = newX; 
    ogY = newY;
  }
}*/

void mousePressed() {
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

int coordinate() {
  return Math.random() > 0.5 ? (int) (Math.random() * 100) : (int) (Math.random() * -100); 
}
