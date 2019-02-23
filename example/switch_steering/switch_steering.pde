button unicorn;
button clear;
button heart;
button original;
button pi;
button hex;
button wolf;
button rose;
button compress;
button diamond;
checkbox drawings;

slider size;

ArrayList<particle> vehicles;
ArrayList<PVector> drawing;

int state = -1;
int IMAGES = 1;
int SHOW = 2;
int USER = 3;

int skip;
int p;
float n;
float d;
float k;
float amplitude; 


Table table;
void setup()
{
  //size(640, 480);
  fullScreen();
  colorMode(HSB);
  createbuttons();
  size = new slider(5, 15, 5, width/2, height-25, .1);
  vehicles = new ArrayList<particle>();
  drawing = new ArrayList<PVector>();
  generatepoints(5, width/2, height/2, "codingtrain");
}

void draw()
{
  background(51);
  showbuttons();
  pressbuttons();
  size.run();
  
  if (state == USER && mousePressed)
  {
    stroke(255);
    PVector point = new PVector(mouseX, mouseY);
    drawing.add(point);
    beginShape();
    for (PVector p : drawing)
    {
      noFill();
      curveVertex(p.x, p.y);
    }
    endShape();
  }
  for (particle p : vehicles)
  {
    p.update();
    p.show();
    p.behaviors();
  }
}



void createbuttons()
{
  unicorn = new button(100, 100, 100, 100, 10, "batman");
  diamond = new button(width-100, 100, 100, 100, 128, "diamond");
  clear = new button(width*.875, height - 100, 100, 100, 255, "clear");
  original = new circlebutton(width/2, 100, 100, 128, "train");
  heart = new button(width/4, 100, 100, 100, 64, "heart");
  pi = new button(width/8, 100, 100, 100, 200, "PI");
  hex = new button(width*.75, 100, 100, 100, 50, "hex");
  wolf = new button(width*.875, 100, 100, 100, 25, "wolf");
  rose = new button(width*.35, 100, 100, 100, 25, "rose");
  drawings = new checkbox(width*.65, 100, 100, "drawing");
  compress = new button(width-100, height-100, 100, 100, 255, "compress");
}

void showbuttons()
{
  unicorn.show();
  clear.show();
  original.show();
  heart.show();
  pi.show();
  hex.show();
  wolf.show();
  rose.show();
  drawings.run();
  compress.show();
  diamond.show();
}

void pressbuttons()
{
  if (heart.pressed())
  {
    heart(-25);
  }
  if (original.pressed())
  {
    generatepoints(5, width/2, height/2, "codingtrain");
  }
  if (clear.pressed())
  {
    vehicles.clear();
  }
  if (unicorn.pressed())
  {
    generatepoints(1, width/3.6, height/4, "batman");
  }
  if (pi.pressed())
  {
    generatepoints(5, width/6, height/8, "pi");
  }
  if (hex.pressed())
  {
    generatepoints(5, width/2.45, height/4, "hex");
  }
  if (wolf.pressed())
  {
    generatepoints(5, width/4, width/8, "wolf");
  }
  if (rose.pressed())
  {
    rose(7, 8, 250);
  }
  if (compress.pressed())
  {
    compress();
  }
  if(diamond.pressed())
  {
   generatepoints(1, width/2.5, height/2.5, "diamond"); 
  }
  if (drawings.checked)
  {
    state = USER;
  } else
  {
    state = IMAGES;
  }
}
