void partial(float x1, float y1, float x2, float y2) {
    stroke(0, 0, 0);
    strokeWeight(2);
    line(x1, y1, x2, y2);
}

void full(float x1, float y1, float x2, float y2) {
  float offset = 3;

  float dx = x2 - x1;
  float dy = y2 - y1;

  float length = sqrt(dx*dx + dy*dy);
  float nx = -dy / length;  // perpendicular x
  float ny = dx / length;   // perpendicular y

  float x11 = x1 + offset * nx;
  float y11 = y1 + offset * ny;
  float x12 = x1 - offset * nx;
  float y12 = y1 - offset * ny;

  float x21 = x2 + offset * nx;
  float y21 = y2 + offset * ny;
  float x22 = x2 - offset * nx;
  float y22 = y2 - offset * ny;

  stroke(0);
  strokeWeight(2);
  line(x11, y11, x21, y21);
  line(x12, y12, x22, y22);
}