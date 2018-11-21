class vLine {

  int f_count = 0;
  int hue;
  ArrayList<PVector> pts = new ArrayList<PVector>();

  vLine(int h) {
    hue = h;
  }

  void show() {
    // Draw line between all points
    pushStyle();
    colorMode(HSB, 360, 100, 100);
    for (int i = 0; i < pts.size() - 1; i++) {
      int h = int(map(i, 0, pts.size(), hue, hue+65));
      stroke(h, 83, 97);
      PVector point = pts.get(i);
      PVector next = pts.get(i+1);
      line(point.x, point.y, point.z, next.x, next.y, next.z);
    }
    popStyle();
  }

  void animate() {

    // Draw line between all points
    pushStyle();
    noFill();
    strokeWeight(1);
    colorMode(HSB, 360, 100, 100);
    if ((frameCount % 1 == 0) && (f_count < pts.size())) f_count++ ;
    beginShape();
    for (int i = 0; i < f_count; i++) {
      int h = int(map(i, 0, pts.size(), hue, hue+65));
      stroke(h, 83, 97);
      pushMatrix();  
      PVector point = pts.get(i);
      vertex(point.x, point.y, point.z);
      popMatrix();
    }
    endShape();
    popStyle();
  }
}
