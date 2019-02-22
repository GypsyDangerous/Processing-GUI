checkbox test;
void setup()
{
  size(640, 480);
  test = new checkbox(width/2, height/2, 50, "test");
}

void draw()
{
  background(51);
  if(test.checked)
  {
   background(255); 
  }
  test.run();
}
