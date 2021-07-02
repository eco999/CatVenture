class Food
{
  float x;
  float y = height-50;
  String type;
  PImage currentImage;
  
  Food(float x, String type) //constructor
  {
    this.x = x;
    this.type = type;
    currentImage = loadImage(type+".png");
  }
  
  boolean collision(Cat other)
  {
    if(abs(this.x-other.x) < 30 && abs(this.y-other.y) < 30)
    {
      return true;
    }
    return false;
  }
  
  void move()
  {
    y -= 5;
    if(y<0)
    {
      x= random(10,width-20);
      y=height;
    }
  }
  
  void render()
  {
    
    image(currentImage,x,y);
    move();
  }
}
