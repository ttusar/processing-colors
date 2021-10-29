void setup() {
  size(356, 250);
  background(51);
}

void draw() {  
  int x = 50;
  ColorMap cmap;
  color c;
  
  // Example of accessing colors via their indices
  cmap = new ColorMap("viridis");
  for (int i = 0; i < 256; i++) {
    c = cmap.getColorIndex(i);
    stroke(c);
    line(x + i, 50, x + i, 100);
  }
  
  // Example of accessing colors for values in [0, 1]
  cmap = new ColorMap("PiYG");
  for (int i = 0; i < 256; i++) {
    float f = i / 256.0;
    c = cmap.getColor(f);
    stroke(c);
    line(x + i, 150, x + i, 200);
  }
}
