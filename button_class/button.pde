class button
{
  PVector pos;
  float w;
  float h;
  float smallw;
  float smallh;
  float orw, orh;
  color fill;
  boolean pressed;
  float hu;

  String text;

  button()
  {
  }

  button(float x, float y, float wid, float hei, float hi, String t)
  {
    pos = new PVector(x, y);
    w = wid;
    h = hei;
    orw = wid;
    orh = hei;
    smallw = wid-10;
    smallh = hei-10;
    hu = hi;
    fill = color(hu, 255, 255);
    pressed = false;
    text = t;
  }

  boolean pressed()
  {
    fill(fill);
    rectMode(CENTER);
    noStroke();
    rect(pos.x, pos.y, w, h, 10);

    fill(0);
    textSize(w/5);
    textAlign(CENTER, CENTER);
    text(text, pos.x, pos.y);
    
    if (mouseX > pos.x-w/2 && mouseX < pos.x+w/2 && mouseY > pos.y-h/2 && mouseY < pos.y+h/2 && mousePressed)
    {
      if (!pressed)
      {
        pressed = true;
        return true;
      }
      w = smallw;
      h = smallh;
    } else
    {
      w = orw;
      h = orh;
    }
    if (!mousePressed)
    {
      pressed = false;
    }
    return false;
  }
}

class circlebutton extends button
{
  float d;
  float sd;
  float od;
  circlebutton(float x, float y, float wi, float hi, String t)
  {
    pos = new PVector(x, y);
    d = wi;
    od = wi;
    sd = wi-10;
    hu = hi;
    fill = color(hu, 255, 255);
    text = t;
  }

  boolean pressed()
  {
    fill(fill);
    noStroke();
    circle(pos.x, pos.y, d);
    fill(0);
    textSize(d/5);
    textAlign(CENTER, CENTER);
    text(text, pos.x, pos.y);
    if (dist(pos.x, pos.y, mouseX, mouseY) < d/2 && mousePressed)
    {
      if (!pressed)
      {
        pressed = true;
        return true;
      }
      d = sd;
    } else
    {
      d= od;
    }
    if (!mousePressed)
    {
      pressed = false;
    }
    return false;
  }
}
