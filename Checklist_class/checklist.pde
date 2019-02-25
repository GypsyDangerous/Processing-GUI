class checklist
{
  ArrayList<checkbox> boxes;
  checklist()
  {
    boxes = new ArrayList<checkbox>();
  }

  void run()
  {
    for (checkbox c : boxes)
    {
      c.run();
    }

    for (int i = 0; i < boxes.size(); i++)
    {
      if (boxes.get(i).pressed)
      {
        for (int j = 0; j < boxes.size(); j++)
        {
          if(boxes.get(j) != boxes.get(i))
          {
            boxes.get(j).checked = false;            
          }
        }
      }
    }
  }
}
