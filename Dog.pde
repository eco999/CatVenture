class Dog
{
  float x;
  float y = height-50;
  String type; //accept bandana, bernard, corgi, spotted, terrier
  float offsetX;
  float offsetY;
  int counter = 0;
  int counterDirection = 1;
  PImage img1; //declaring image variables
  PImage img2;
  PImage img3;
  PImage currentImage;
  
  Dog() //constructor
  {
    x = random(100,300);
    offsetX = random(1,3);
    offsetY = random(1,3);
    img1 = loadImage("bandana1.png");
    img2 = loadImage("bandana2.png");
    img3 = loadImage("bandana3.png");
  }
  
  void changeDogType()
  {
    int randomiser = (int)random(5);
    String dogType = "";
    switch(randomiser)
    {
      case 0:
        dogType = "bandana";
        break;
      case 1:
        dogType = "bernard";
        break;
      case 2:
        dogType = "corgi";
        break;
      case 3:
        dogType = "spotted";
        break;
      case 4:
        dogType = "terrier";
        break;
    }
    img1 = loadImage(dogType+"1.png");
    img2 = loadImage(dogType+"2.png");
    img3 = loadImage(dogType+"3.png");
  }
  
  boolean collision(Cat other)
  {
    if(abs(this.x-other.x) < 30 && abs(this.y-other.y) < 30)
    {
      return true;
    }
    return false;
  }
  
  void animate()
  {
    counter = counter+counterDirection;
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
      counterDirection = -counterDirection; //reverse sequence
    }
  }
  
  void move()
  {
    moveLeftAndRight();
    x= x+offsetX;
    y = y - offsetY;
    if(y<0)
    {
      x= random(10,width-20);
      y=height;
    }
  }
  
  void moveLeftAndRight()
  {
    if(x>width-20)
    {
      offsetX = -offsetX;
    }
    if(x<0)
    {
      offsetX = -offsetX;
    }
  }
  
  void render()
  {
    animate();
    image(currentImage,x,y);
    move();
  }
}
