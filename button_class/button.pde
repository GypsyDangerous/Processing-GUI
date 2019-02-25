class button
{
  PVector pos;
  float Width;
  float Height;
  float smallwidth;
  float smallheight;
  float originalwidth, originalheight;
  float textsize;
  color fill;
  boolean ispressed;
  boolean beenpressed;

  String text;

  button()
  {
  }

  //create a button with a position, width, height, color, and text
  button(float x, float y, float wid, float hei, float hue, String t)
  {
    pos = new PVector(x, y);
    Width = wid;
    Height = hei;
    originalwidth = wid;
    originalheight = hei;
    smallwidth = wid-10;
    smallheight = hei-10;
    colorMode(HSB);
    fill = color(hue, 255, 255);
    ispressed = false;
    text = t;
    textsize = Width/5;
  }

  button(float x, float y, float size, float hue, String t)
  {
    pos = new PVector(x, y);
    Width = size;
    Height = size;
    originalwidth = size;
    originalheight = size;
    smallwidth = size-10;
    smallheight = size-10;
        colorMode(HSB);
    fill = color(hue, 255, 255);
    ispressed = false;
    text = t;
    textsize = Width/5;
  }

  void show()
  {
    //show the button
    fill(fill);
    rectMode(CENTER);
    noStroke();
    rect(pos.x, pos.y, Width, Height, 10);

    //show the text
    fill(0);
    textsize = Width/5;
    textSize(textsize);
    textAlign(CENTER, CENTER);
    text(text, pos.x, pos.y);
  }

  boolean hold()
  {
    show();

    //return pressed or not
    if (mouseX > pos.x-Width/2 && mouseX < pos.x+Width/2 && mouseY > pos.y-Height/2 && mouseY < pos.y+Height/2 && mousePressed)
    {
      Width = smallwidth;
      Height = smallheight;
      return true;
    } else
    {
      Width = originalwidth;
      Height = originalheight;
    }
    if (!mousePressed)
    {
      ispressed = false;
    }

    return false;
  }

  //show the button and return whether the button is pressed or not
  boolean pressed()
  {
    show();

    //return pressed or not
    if (mouseX > pos.x-Width/2 && mouseX < pos.x+Width/2 && mouseY > pos.y-Height/2 && mouseY < pos.y+Height/2 && mousePressed)
    {
      if (!ispressed)
      {
        ispressed = true;
        beenpressed = true;
        return true;
      }
      Width = smallwidth;
      Height = smallheight;
    } else
    {
      Width = originalwidth;
      Height = originalheight;
    }
    if (!mousePressed)
    {
      ispressed = false;
    }

    return false;
  }
}

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

//its a button but instead of being a square its a circle
class circlebutton extends button
{
  float diameter;
  float smalldiameter;
  float originaldiameter;

  circlebutton(float x, float y, float d, float hue, String t)
  {
    pos = new PVector(x, y);
    diameter = d;
    originaldiameter = d;
    smalldiameter = d-10;
    fill = color(hue, 255, 255);
    text = t;
  }

  void show()
  {
    fill(fill);
    noStroke();
    circle(pos.x, pos.y, diameter);
    fill(0);
    textSize(diameter/5);
    textAlign(CENTER, CENTER);
    text(text, pos.x, pos.y);
  }

  boolean pressed()
  {
    show();

    if (dist(pos.x, pos.y, mouseX, mouseY) < diameter/2 && mousePressed)
    {
      if (!ispressed)
      {
        ispressed = true;
        return true;
      }
      diameter = smalldiameter;
    } else
    {
      diameter= originaldiameter;
    }
    if (!mousePressed)
    {
      ispressed = false;
    }
    return false;
  }
}
