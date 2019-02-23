void mousePressed()
{
  drawing.clear();
}

void mouseReleased()
{
  if (state == USER)
  {
    if (drawing.size() > vehicles.size())
    {
      for (int i = 0; i < drawing.size(); i++)
      {
        PVector pos = drawing.get(i);
        if (i < vehicles.size())
        {
          vehicles.get(i).target = pos;
        } else
        {
          vehicles.add(new particle(pos, i % 255));
        }
      }
    } else
    {
      for (int i = 0; i < vehicles.size(); i++)
      {
        if (i < drawing.size())
        {
          PVector point = drawing.get(i);
          vehicles.get(i).target = point;
        } else
        {
          PVector ground = new PVector(random(0, width), height-vehicles.get(i).d); 
          vehicles.get(i).target = ground;
        }
        p+=skip;
      }
    }
  }
}
