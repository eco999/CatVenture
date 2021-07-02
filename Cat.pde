class Cat
{
  float x = 200;
  float y = 100;
  int offset = 6;
  int counter = 0;
  int countDirection = 1;
  PImage img1; //declaring image variables
  PImage img2;
  PImage img3;
  PImage currentImage; //starting image
  
  Cat() //constructor
  {
    img1 = loadImage("cat1.png");
    img2 = loadImage("cat2.png");
    img3 = loadImage("cat3.png");
  }
  
  void animate()
  {
    counter = counter+countDirection;
    if(counter>0 && counter<=10)
    {
      currentImage = img1;
    }
    else if(counter>10 && counter<=20)
    {
      currentImage = img2;
    }
    else if(counter>20 && counter<=25)
    {
      currentImage = img3;
    }
    else
    {
      countDirection = -countDirection; //reverse sequence
    }
  }
  
  void render()
  {
    animate();
    image(currentImage,x,y);
  }
}
