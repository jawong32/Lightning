void setup() {
  size(500, 500);
  strokeWeight(10);
}

void draw() {

}

void mousePressed() {
  int segments = (int) (Math.random() * 10 + 5);
  int length = mouseX / segments;
  int ogX = 0, ogY = (int) (Math.random() * 501);
  for (int i = 0; i < segments; i++) {
    int newX = ogX + length, newY = ogY - coordinate();
    line(ogX, ogY, newX, newY);
    ogX = newX; 
    ogY = newY;
  }
}

int coordinate() {
  return (int) (Math.random() * 100); 
}
