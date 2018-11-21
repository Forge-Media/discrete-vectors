import peasy.*;

PeasyCam cam;
//vGroup dVectors;
ArrayList<vGroup> vGroups = new ArrayList<vGroup>();

void setup() {
  size(1280, 900, P3D);
  stroke(255);
  smooth(4);
  frameRate(120);
  cam = new PeasyCam(this, 1000);

  // New vGroup (#Lines, #Points, #Factor, #Offset, #Spacing)
  vGroups.add(new vGroup(100, 400, 0.05, 1, 5));
  vGroups.get(0).construct(100, -100, 0);
}

void draw() {
  background(15);
  rotateX(HALF_PI);
  rotateZ(frameCount * 0.004);
  pushMatrix();
  translate(-500, -250);
  for (vGroup v : vGroups) {
    v.show();
  }

  popMatrix();
}

void keyPressed() {
  int r = floor(random(100));
  noiseSeed(r);
  if (key == 'r' || key == 'R') {
    println("Genterting new!");
    vGroups.clear();
    // New vGroup (#Lines, #Points, #Factor, #Offset, #Spacing)
    vGroups.add(new vGroup(int(random(100, 500)), int(random(300, 500)), random(0.05, 0.09), 1, random(0.5,5)));
    vGroups.get(vGroups.size() - 1).construct(random(50, 1000), random(-50, -1000), int(random(0, 290)));
  } 
  if (key == 'q' || key == 'Q') {
    println("Resetting");

    vGroups.clear();
  }
}
