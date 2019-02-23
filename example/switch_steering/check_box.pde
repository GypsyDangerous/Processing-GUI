class checkbox
{

  PVector pos;
  float size;
  String text;
  boolean checked;
  boolean pressed;
  color on;
  color off;

  checkbox(float x, float y, float d, String t)
  {
    pos = new PVector(x, y);
    size = d;
    text = t;
    off = color(90, 255, 255);
    on = color(255, 255, 255);
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
    strokeWeight(5);
    textSize(size/5);
    if (checked)
    {
      fill(on);
      stroke(off);
    } else
    {
      fill(off);
      stroke(on);
    }
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
