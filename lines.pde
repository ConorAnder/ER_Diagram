void partial(float x1, float y1, float x2, float y2) {
    stroke(0, 0, 0);
    strokeWeight(2);
    line(x1, y1, x2, y2);
}

void full(float x1, float y1, float x2, float y2) {
    float grad = 1 / ((y2 - y1) / (x2 - x1));
    float offset = 5;

    float x11 = x1 + offset * grad;
    float x12 = x1 - offset * grad;
    float y11 = y1 + offset * grad;
    float y12 = y1 - offset * grad;

    float x21 = x2 + offset * grad;
    float x22 = x2 - offset * grad;
    float y21 = y2 + offset * grad;
    float y22 = y2 - offset * grad;

    stroke(0, 0, 0);
    strokeWeight(2);
    line(x11, y11, x21, y21);
    line(x12, y12, x22, y22);
}