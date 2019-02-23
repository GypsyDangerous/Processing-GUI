void generatepoints(int s, float neg, float h, String file)
{
  skip = s;
  p=0;
  table = loadTable(file+".csv", "header");
  if (table.getRowCount() > vehicles.size()*skip)
  {
    for (int i = 0; i < table.getRowCount(); i+=skip)
    {
      TableRow row = table.getRow(i);
      float x = row.getFloat("x") + neg;
      float y = row.getFloat("y") + h;
      PVector pos = new PVector(x, y);
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
      if (p < table.getRowCount())
      {
        TableRow row = table.getRow(p%table.getRowCount());
        float x = row.getFloat("x") + neg;
        float y = row.getFloat("y") + h;
        PVector point = new PVector(x, y);
        vehicles.get(i).target = point;
      } else
      {
        PVector ground = new PVector(random(width), height-vehicles.get(i).d); 
        vehicles.get(i).target = ground;
      }
      p+=skip;
    }
  }
}

void heart(float r)
{
  float full = 360;
  if (full > vehicles.size())
  {
    for (int i = 0; i < full; i++)
    {
      float theta = radians(i);
      float x = r*(16 * pow(sin(theta), 3))+width/2;
      float y = r*((13 * cos(theta)) - (5*cos(2*theta)) - (2*cos(3*theta)) - (cos(4* theta)))+height/2;
      PVector pos = new PVector(x, y);
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
      if (i < full)
      {
        float theta = radians(i);
        float x = r *(16 * pow(sin(theta), 3))+width/2;
        float y = r *((13 * cos(theta)) - (5*cos(2*theta)) - (2*cos(3*theta)) - (cos(4* theta)))+height/2;
        PVector point = new PVector(x, y);
        vehicles.get(i).target = point;
      } else
      {
        PVector ground = new PVector(random(width), height-vehicles.get(i).d); 
        vehicles.get(i).target = ground;
      }
      p+=skip;
    }
  }
}

void rose(float nu, float de, float amp)
{
  n = nu;
  d = de;
  k = n/d;
  amplitude = amp;
  float full = d*360;
  if (full > vehicles.size())
  {
    for (int i = 0; i < full; i++)
    {
      float theta = radians(i);
      float r = (amplitude*cos(k*theta)); 
      float x = r * cos(theta) + width/2; 
      float y = r * sin(theta) + height/2; 
      PVector point = new PVector(x, y);
      if (i < vehicles.size())
      {
        vehicles.get(i).target = point;
      } else
      {
        vehicles.add(new particle(point, i%255));
      }
    }
  } else
  {
    for (int i = 0; i < vehicles.size(); i++)
    {
      if (i < full)
      {
        float theta = radians(i);
        float r = (amplitude*cos(k*theta)); 
        float x = r * cos(theta) + width/2; 
        float y = r * sin(theta) + height/2; 
        PVector point = new PVector(x, y);
        vehicles.get(i).target = point;
      } else
      {
        PVector ground = new PVector(random(width), height-vehicles.get(i).d); 
        vehicles.get(i).target = ground;
      }
    }
  }
}


void compress()
{
  for (particle p : vehicles)
  {
    PVector ground = new PVector(p.d, height-p.d); 
    p.target = ground;
  }
}
