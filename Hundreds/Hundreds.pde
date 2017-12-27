PImage background, starRed, planet, blackHole2;
float r;
Basic basic;
Planets planets;
Blacks blacks;
float xb, yb;
PFont f;
Menu menu;

void setup() {
  size(1000, 800);

  r=80;
  xb=width/5;
  yb=height/2;
  f = createFont ("Copperplate-Bold", 100, true);
  menu = new Menu(Menu.MENU);

  basic = new Basic(menu);
  planets = new Planets(menu);
  blacks = new Blacks(menu);
  
  //Carregamento do background
  background = loadImage("Background.png");
  starRed =  loadImage("StarRed.png");
  planet = loadImage("Terra.png");
  blackHole2 = loadImage("Buraco Negro2.png");
}

void draw() {
  //Desenho do background
  imageMode(CORNER);
  image(background, 0, 0, width, height);

  if (menu.selected == Menu.MENU) {
    textAlign(CENTER, CENTER);
    fill(200, 0, 255);
    textFont(f, 100);
    text("HUNDREDS 2.0", width/2, height/5);

    fill(255);
    
    imageMode(CENTER);
    image(starRed, xb, yb, 2*r+40, 2*r+40);
    textSize(30);
    text("Level 1", xb, yb+r+20);

    imageMode(CENTER);
    image(planet, 2*xb, yb, 2*r, 2*r);
    fill(255);
    text("Level 2", 2*xb, yb+r+20);

    imageMode(CENTER);
    image(blackHole2, 3*xb, yb, 2*r, 2*r);
    fill(255);
    text("Level 3", 3*xb, yb+r+20);

    text("Level 4", 4*xb, yb+r+20);
    
  } else if (menu.selected==Menu.BASIC) {
    basic.desenha();
  } else if (menu.selected==Menu.PLANETS) {
    planets.desenha();
  } else if (menu.selected==Menu.BLACK) {
    blacks.desenha();
  } else if (menu.selected==Menu.FOUR) {
  }
}

void mousePressed() {
  if (dist(mouseX, mouseY, xb, yb)<=r) {
    menu.selected=Menu.BASIC;
    basic.startLevel();
  }  
  if (dist(mouseX, mouseY, 2*xb, yb)<=r) {
    menu.selected=Menu.PLANETS;
    planets.startLevel();
  }  
  if (dist(mouseX, mouseY, 3*xb, yb)<=r) {
    menu.selected=Menu.BLACK;
    blacks.startLevel();
  }  
  if (dist(mouseX, mouseY, 4*xb, yb)<=r) {
    menu.selected=Menu.FOUR;
    
  }
}