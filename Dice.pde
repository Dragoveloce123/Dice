int total = 0;

void setup()
{
    size(400, 460);
    noLoop();
}

void draw()
{
    background(30, 90, 60);
    total = 0;

    for (int row = 0; row < 3; row++)
    {
        for (int col = 0; col < 3; col++)
        {
            Die d = new Die(25 + col * 125, 25 + row * 125);
            d.show();
            total = total + d.value;
        }
    }

    fill(255);
    textAlign(CENTER);
    textSize(28);
    text("Total: " + total, width / 2, 435);
}

void mousePressed()
{
    redraw();
}

class Die
{
    int myX, myY, value;
    int size = 100;

    Die(int x, int y)
    {
        myX = x;
        myY = y;
        roll();
    }

    void roll()
    {
        value = (int)(Math.random() * 6) + 1;
    }

    void show()
    {
        fill(255);
        stroke(0);
        strokeWeight(2);
        rect(myX, myY, size, size);

        fill(0);
        noStroke();
        int left = myX + 25;
        int mid = myX + 50;
        int right = myX + 75;
        int top = myY + 25;
        int center = myY + 50;
        int bottom = myY + 75;

        if (value % 2 == 1)
            ellipse(mid, center, 16, 16);
        if (value > 1)
        {
            ellipse(left, top, 16, 16);
            ellipse(right, bottom, 16, 16);
        }
        if (value > 3)
        {
            ellipse(right, top, 16, 16);
            ellipse(left, bottom, 16, 16);
        }
        if (value == 6)
        {
            ellipse(left, center, 16, 16);
            ellipse(right, center, 16, 16);
        }
    }
}
