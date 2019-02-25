checklist check;
void setup()
{
  size(640, 480);
  check = new checklist();
  check.boxes.add(new checkbox(width/2, height/2, 100, "test"));
  check.boxes.add(new checkbox(width/4, height/2, 100, "test2"));
  check.boxes.add(new checkbox(width/2, height/4, 100, "test3"));
}

void draw()
{
  background(0);
  if(check.boxes.get(1).checked)
  {
   background(200); 
  }
  check.run();
}
