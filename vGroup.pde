class vGroup {
  int noLines;
  int noPoints;
  float factor;
  float offset;
  float spacing;
  float[] angle = {HALF_PI, QUARTER_PI, TWO_PI, -QUARTER_PI, - HALF_PI};

  ArrayList<vLine> vLines = new ArrayList<vLine>();

  vGroup(int nl, int np, float fc, float of, float sp) {
    noLines = nl;
    noPoints = np;
    factor = fc;
    offset = of;
    spacing = sp;
  }

  void construct(float max_height, float max_depth, int hue) {

    float pointZ = 0;

    // Loop for each Vector Line
    for (int y = 0; y < noLines; y++) {

      float pointX = 0;
      vLine vln = new vLine(hue);

      // Loop for all points of Vector Line
      for (int x = 0; x < noPoints; x++) {
        // next angle is based on noise (therefore previous) choice of 5 angles
        int n = int(round(map(noise(x * factor + offset, y * factor + offset), 0, 1, 0, 5)));
        if (n > 4) {
          n = 4;
        }
        // Distance vector (higher mag results in longer line between 2 points)
        PVector d = PVector.fromAngle(angle[n]).setMag(3);

        // Increase next point by distance components
        pointX += d.x;
        pointZ += d.y;

        // Invert distance when condition is met
        if (pointZ > max_height || pointZ < max_depth) {
          pointZ -= d.y;
        }

        // Add points to vLine object
        vln.pts.add(new PVector(pointX, y * spacing, pointZ));
      }
      // Store vLine object in array //<>//
      vLines.add(vln);
      // Reset for next vLine
      pointZ = 0;
    }
  }

  void show() {
    if (vLines != null) {
      for (vLine vl : vLines) {
        vl.show();
      }
    }
  }
  void animate() {
    if (vLines != null) {
      for (vLine vl : vLines) {
        vl.animate();
      }
    }
  }
}
