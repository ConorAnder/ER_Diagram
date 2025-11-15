int TEXT_SIZE = 25;

void setup() {
    background(255, 255, 255);
    fullScreen();
    float EC_X = 4.75 * width / 6, EC_Y = height / 2 - 100;
    float SP_X = width / 2, SP_Y = EC_Y;
    float RE_X = 1.25 * width / 6, RE_Y = EC_Y;
    float ST_X = RE_X, ST_Y = 3.5 * height / 5;

    // Lines
        // Species
    partial(SP_X, SP_Y, SP_X - 100, SP_Y - 150);
    partial(SP_X, SP_Y, SP_X + 100, SP_Y - 150);
    partial(SP_X, SP_Y, SP_X, SP_Y - 250);
    partial(SP_X, SP_Y - 250, SP_X - 100, SP_Y - 350);
    partial(SP_X, SP_Y - 250, SP_X + 100, SP_Y - 350);
    full(SP_X, SP_Y, SP_X - 135, (SP_Y + SP_Y + 2 * height / 5) / 2);
    full(SP_X, SP_Y, SP_X + 135, (SP_Y + SP_Y + 2 * height / 5) / 2);
    partial(SP_X, (SP_Y + SP_Y + 2 * height / 5) / 2, SP_X, SP_Y + 2 * height / 5);

        // Ecosystem
    partial(EC_X, EC_Y, EC_X - 100, EC_Y - 150);
    partial(EC_X, EC_Y, EC_X + 100, EC_Y - 150);
    partial(EC_X, EC_Y, EC_X + 250, EC_Y);
    partial(EC_X, EC_Y, EC_X - 100, EC_Y + 150);
    partial(EC_X, EC_Y, EC_X + 100, EC_Y + 150);
    full(EC_X, EC_Y, (SP_X + EC_X) / 2 + 65, SP_Y - 100);
    full(SP_X, SP_Y, (SP_X + EC_X) / 2 - 65, SP_Y - 100);
    partial(EC_X, EC_Y, (SP_X + EC_X) / 2 + 115, SP_Y + 100);
    partial(SP_X, SP_Y, (SP_X + EC_X) / 2 - 115, SP_Y + 100);

        // Researcher
    partial(RE_X, RE_Y, RE_X - 250, RE_Y);
    partial(RE_X, RE_Y, RE_X - 100, RE_Y - 150);
    partial(RE_X, RE_Y, RE_X + 100, RE_Y - 150);
    partial(SP_X, SP_Y, (RE_X + SP_X) / 2, RE_Y);
    full(RE_X, RE_Y, (RE_X + SP_X) / 2, RE_Y);

        // Student
    partial(ST_X, ST_Y, ST_X - 200, ST_Y + 100);
    partial(ST_X, ST_Y, ST_X, ST_Y + 200);
    partial(ST_X, ST_Y, ST_X + 200, ST_Y + 100);
    full(ST_X, ST_Y, RE_X, RE_Y);

    // Entities and Attributes
    entity("Species", SP_X, SP_Y);
    attribute("ID", SP_X - 100, SP_Y - 150, "primary");
    attribute("Diet", SP_X + 100, SP_Y - 150, "multivalued");
    attribute("Name", SP_X, SP_Y - 250);
    attribute("Scientific", SP_X - 100, SP_Y - 350);
    attribute("Common", SP_X + 100, SP_Y - 350, "multivalued");

    entity("Ecosystem", EC_X, EC_Y);
    attribute("Name", EC_X - 100, EC_Y - 150);
    attribute("Location", EC_X + 100, EC_Y - 150);
    attribute("Area Code", EC_X + 250, EC_Y, "primary");
    attribute("Climate", EC_X - 100, EC_Y + 150);
    attribute("Area", EC_X + 100, EC_Y + 150);
    

    entity("Researcher", RE_X, RE_Y);
    attribute("ORCID", RE_X - 250, RE_Y, "primary");
    attribute("Name", RE_X - 100, RE_Y - 150);
    attribute("Field", RE_X + 100, RE_Y - 150);

    entity("Student", ST_X, ST_Y, true);
    attribute("Name", ST_X - 200, ST_Y + 100, "weak primary");
    attribute("Course", ST_X, ST_Y + 200);
    attribute("Year", ST_X + 200, ST_Y + 100);

    // Relations and Attributes
    relation("SUPERVISES", ST_X, (ST_Y + RE_Y) / 2);

    relation("STUDIES", (RE_X + SP_X) / 2, RE_Y);

    relation("INTERACTS_WITH", SP_X, (SP_Y + SP_Y + 2 * height / 5) / 2);
    attribute("Interaction", SP_X, SP_Y + 2 * height / 5);

    relation("LIVES_IN", (SP_X + EC_X) / 2, SP_Y - 100);

    relation("KEYSTONE_OF", (SP_X + EC_X) / 2, SP_Y + 100);
}