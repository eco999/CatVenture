PImage background;
PImage splash;
boolean gameMode;
int y = 0; //global variable background location
int score = 0;
int bestScore = 0;
int lives = 3;

Cat player1;
Dog[] dogsArray = new Dog[10];
Food[] foodArray = new Food[2];

void setup()
{
  textSize(30);
  noLoop();
  size(400,800);
  background = loadImage("background.png");
  splash = loadImage("splash.png");
  background.resize(width,height);
  player1 = new Cat();
  initDogs();
  initFood();
}

void draw()
{
  drawBackground();
  player1.render();
  drawDogs();
  drawFood();
  if(gameMode==false)
  {
    image(splash,25,150);
  }
  text("Score: "+score, 10, 30); 
  text("Lives: "+lives, 10, 60);

  
}

void drawBackground()
{
  image(background, 0, y); //draw background twice adjacent
  image(background, 0, y+background.height);
  y -=4;
  if (y == -background.height)
  {
    y=0; //wrap background
  }
}

void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT && player1.x > 5)
    {
      player1.x -= player1.offset;
    }
    
    else if (keyCode == RIGHT && player1.x < (width-30))
    {
      player1.x += player1.offset;
    }
    
    else if (keyCode == UP && player1.y > 5)
    {
      player1.y -= player1.offset;
    }
    
    else if (keyCode == DOWN && player1.y < (height-30))
    {
      player1.y += player1.offset;
    }
    
  }
  if(key == ENTER)
  {
    gameMode= true;
    loop();
    score=0;
    player1.x = 200;
    player1.y = 100;
  }
}

void initDogs()
{
  for(int i=0;i<dogsArray.length;i++)
  {
    dogsArray[i] = new Dog();
    dogsArray[i].changeDogType();
  }
}

void initFood()
{
  for(int i=0;i<foodArray.length;i++)
  {
    int randomiser = (int)random(2);
    String foodType = "";
    switch(randomiser)
    {
      case 0:
        foodType = "sushi";
        break;
      case 1:
        foodType = "milk";
        break;
    }
    foodArray[i] = new Food(random(50,350),foodType);
  }
}

void drawFood()
{
  for(int i=0;i<foodArray.length;i++)
  {
    foodArray[i].render();
  
    if(foodArray[i].collision(player1))
    {
      foodArray[i].y=height;
      foodArray[i].x= random(10,width-20);
      score += 1;
      if(score>bestScore)
      {
        bestScore = score;
      }
    }
  }
}

void drawDogs()
{
  for(int i=0;i<dogsArray.length;i++)
  {
    if(dogsArray[i]!=null)
    {
      dogsArray[i].render();
      if(dogsArray[i].collision(player1))
      {
        lives -=1;
        if(lives>0)
        {
          dogsArray[i] = null;
        }
        else if(lives==0)
        {
          gameMode = false;
          noLoop();
          initFood();
          initDogs();
          lives = 3;
          text("Best score: "+bestScore, 210, 30);
        }
      }
    }
  }
}
