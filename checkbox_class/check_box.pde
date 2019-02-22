class checkbox
{

  PVector pos;
  float size;
  String text;
  boolean checked;
  boolean pressed;

  checkbox(float x, float y, float d, String t)
  {
    pos = new PVector(x, y);
    size = d;
    text = t;
  }

  void run()
  {
    show();
    press();
  }

  void show()
  {
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    textSize(size/4);

    if (checked)
    {
      fill(255, 0, 0);
    } else
      fill(0, 255, 0);
    rect(pos.x, pos.y, size, size, size/10);
    fill(0);
    text(text, pos.x, pos.y);
  }

  void press()
  {
    if (dist(mouseX, mouseY, pos.x, pos.y) < size/2 && mousePressed && !pressed)
    {
      checked = !checked;
      pressed = true;
    }
    if (!mousePressed)
    {
      pressed = false;
    }
  }
}
