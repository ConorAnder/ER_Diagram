import garciadelcastillo.dashedlines.*;

void entity(String name, float x, float y) {
    entity(name, x, y, false);
}

void entity(String name, float x, float y, boolean weak) {
    fill(255, 255, 255);
    stroke(0, 0, 0);
    strokeWeight(2);

    rectMode(CENTER);
    textAlign(CENTER);
    textSize(TEXT_SIZE);
    float box_width = 1.3 * textWidth(name);
    if (weak) {
        rect(x, y, box_width + 0.5 * TEXT_SIZE, 2.5 * TEXT_SIZE);
        rect(x, y, box_width, 2 * TEXT_SIZE);
    }
    else {
       rect(x, y, box_width, 2 * TEXT_SIZE); 
    }

    fill(0, 0, 0);
    text(name, x, y + 0.3 * TEXT_SIZE);
}

// Overloading the function because java doesn't support default parameters
void attribute(String name, float x, float y) {
    attribute(name, x, y, "standard");
}

void attribute(String name, float x, float y, String type) {
    fill(255, 255, 255);
    stroke(0, 0, 0);
    strokeWeight(2);
    textAlign(CENTER);
    textSize(TEXT_SIZE);
    float ellipse_width = 1.3 * textWidth(name);
    DashedLines dash;
    dash = new DashedLines(this);
    dash.pattern(5, 5);

    if (ellipse_width < 2.5* TEXT_SIZE) {
        ellipse_width = 1.3 * 2.5 * TEXT_SIZE;
    }

    try {
        switch(type) {
            case "standard":
            ellipse(x, y, ellipse_width, 2.5 * TEXT_SIZE);
            fill(0, 0, 0);
            text(name, x, y + 0.3 * TEXT_SIZE);
            break;

            case "derived":
            dash.ellipse(x, y, ellipse_width, 2.5 * TEXT_SIZE);
            fill(0, 0, 0);
            text(name, x, y + 0.3 * TEXT_SIZE);
            break;

            case "primary":
            ellipse(x, y, ellipse_width, 2.5 * TEXT_SIZE);
            fill(0, 0, 0);
            text(name, x, y + 0.3 * TEXT_SIZE);
            line(x - textWidth(name) / 2, y + TEXT_SIZE / 2, x + textWidth(name) / 2, y + TEXT_SIZE / 2);
            break;

            case "derived primary":
            dash.ellipse(x, y, ellipse_width, 2.5 * TEXT_SIZE);
            fill(0, 0, 0);
            text(name, x, y + 0.3 * TEXT_SIZE);
            line(x - textWidth(name) / 2, y + TEXT_SIZE / 2, x + textWidth(name) / 2, y + TEXT_SIZE / 2);
            break;

            case "weak primary":
            ellipse(x, y, ellipse_width, 2.5 * TEXT_SIZE);
            fill(0, 0, 0);
            text(name, x, y + 0.3 * TEXT_SIZE);
            dash.line(x - textWidth(name) / 2, y + TEXT_SIZE / 2, x + textWidth(name) / 2, y + TEXT_SIZE / 2);
            break;

            case "multivalued":
            ellipse(x, y, ellipse_width + 0.5 * TEXT_SIZE, 3 * TEXT_SIZE);
            ellipse(x, y, ellipse_width, 2.5 * TEXT_SIZE);
            fill(0, 0, 0);
            text(name, x, y + 0.3 * TEXT_SIZE);
            break;

            default:
            throw new Exception();
        }
    }
    catch(Exception e) {
        print("Unknown attribute type: " + type + "\n");
        print("Try the following:\n   standard\n   derived\n   primary\n   derived primary\n   multivalued\n");
    }
}

void relation(String name, float x, float y) {
    fill(255, 255, 255);
    stroke(0, 0, 0);
    strokeWeight(2);
    textAlign(CENTER);
    textSize(TEXT_SIZE);

    float box_width = 1.5 * textWidth(name);

    float p1x = x, p1y = y - box_width / 3;
    float p2x = x + box_width / 2, p2y = y;
    float p3x = x, p3y = y + box_width / 3;
    float p4x = x - box_width / 2, p4y = y;

    quad(p1x, p1y, p2x, p2y, p3x, p3y, p4x, p4y);

    textAlign(CENTER);
    textSize(TEXT_SIZE);
    fill(0, 0, 0);
    text(name, x, y + 0.3 * TEXT_SIZE);
}
