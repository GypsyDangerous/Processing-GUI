class checkbox
{

  PVector pos;
  float size;
  String text;
  boolean checked;
  boolean pressed;
  color on;
  color off;


  //create a check box with a position, size and text
  checkbox(float x, float y, float d, String t)
  {
    pos = new PVector(x, y);
    size = d;
    text = t;
    colorMode(HSB);
    off = color(90, 255, 255);//color(90, 255, 255);
    on = color(255, 255, 255);//color(255, 255, 255);
  }

  //show the checkbox and check it
  void run()
  {
    show();
    check();
  }

  boolean pressed()
  {

    //return pressed or not
    if (mouseX > pos.x-size/2 && mouseX < pos.x+size/2 && mouseY > pos.y-size/2 && mouseY < pos.y+size/2 && mousePressed)
    {
      if (!pressed)
      {
        pressed = true;
        return true;
      }
    } else
    {
    }
    if (!mousePressed)
    {
      pressed = false;
    }

    return false;
  }

  //show the checkbox and a square and invert the colors when checked
  void show()
  {
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    strokeWeight(5);
    textSize(size/5);
    invertcolors();
    rect(pos.x, pos.y, size, size, size/10);
    fill(0);
    text(text, pos.x, pos.y);
  }

  void invertcolors()
  {
    if (checked)
    {
      fill(on);
      stroke(off);
    } else
    {
      fill(off);
      stroke(on);
    }
  }

  //check or uncheck the box when pressed
  void check()
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
