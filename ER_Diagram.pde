int TEXT_SIZE = 25;

void setup() {
    background(255, 255, 255);
    fullScreen();
    float EC_X = 5 * width / 6, EC_Y = height / 2;
    float SP_X = width / 2, SP_Y = EC_Y;
    float RE_X = width / 6, RE_Y = EC_Y;
    float ST_X = width / 6, ST_Y = 4 * height / 5;

    // Lines
    full(0, 0, width / 2, height / 2);
    full(0, height / 2, width / 2, height / 2);

    // Entities and Attributes
    entity("Species", SP_X, SP_Y);
    attribute("ID", SP_X - 100, SP_Y - 200, "primary");
    attribute("Diet", SP_X + 100, SP_Y - 200, "multivalued");
    attribute("Name", SP_X, SP_Y - 300);
    attribute("Scientific", SP_X - 100, SP_Y - 400);
    attribute("Common", SP_X + 100, SP_Y - 400, "multivalued");

    entity("Ecosystem", EC_X, EC_Y);
    entity("Researcher", RE_X, RE_Y);
    entity("Student", ST_X, ST_Y, true);

    // Relations and Attributes
    relation("SUPERVISES", ST_X, (ST_Y + RE_Y) / 2);

    relation("STUDIES", (RE_X + SP_X) / 2, RE_Y);

    relation("INTERACTS_WITH", SP_X, (SP_Y + SP_Y + 2 * height / 5) / 2);
    attribute("Interaction", SP_X, SP_Y + 2 * height / 5);

    relation("LIVES_IN", (SP_X + EC_X) / 2, SP_Y - 100);

    relation("KEYST_OF", (SP_X + EC_X) / 2, SP_Y + 100);
}