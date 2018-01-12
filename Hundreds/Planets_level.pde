class Planets {
  int ns, np;
  Star[] star;
  Planet[] planet;
  float raio;
  int soma;
  Menu menu;

  Planets(Menu menu) {
    ns=9;
    np=9;
    star = new Star[ns];
    planet = new Planet[np];
    raio=30;
    soma=0;
    this.menu=menu;
  }

  void startLevel() {
    for (int i=0; i<ns; i++) {
      star[i] = new Star(random(raio, width-raio), random(raio, height-raio), raio, 8, 8, 255, 255, 255, 0);
    }
    
    planet[0] = new Planet(100, 0, color(255,255,0), 0, false); //Sol
    planet[1] = new Planet(30, 1.5*width/9, color(#AA9999), TWO_PI/150, false);
    planet[2] = new Planet(40, 2.5*width/9, color(#DE4310), TWO_PI/250, false);
    planet[3] = new Planet(45, 3.5*width/9, color(#16A1F5), TWO_PI/310, false);
    planet[4] = new Planet(35, 4.5*width/9, color(#E5AD13), TWO_PI/450, false);
    planet[5] = new Planet(60, 5.5*width/9, color(#DECC9D), TWO_PI/590, false);
    planet[6] = new Planet(50, 6.5*width/9, color(#C69066), TWO_PI/690, false);
    planet[7] = new Planet(45, 7.5*width/9, color(#56D8FA), TWO_PI/790, false);
    planet[8] = new Planet(45, 8.5*width/9, color(#0C4EF0), TWO_PI/870, false);

    soma=0;
  }

  void colision() {
    for (int i=0; i<np; i++) {
      for (int j=0; j<ns; j++) {
        if (dist(star[i].x, star[i].y, planet[j].x, planet[j].y)<=star[i].raio+planet[j].rplaneta) {
          if (star[i].x < planet[j].x) { //Altera o sentido do movimento
            star[i].velx = -abs(star[i].velx);
          } else if (star[i].x > planet[j].x) {
            star[i].velx = abs(star[i].velx);
          }

          if (star[i].y < planet[j].y) {
            star[i].vely = -abs(star[i].vely);
          } else if (star[i].y > planet[j].y) {
            star[i].vely = abs(star[i].vely);
          }
        }
      }
    }
  }

  //Função de somar
  int soma() {

    soma=0;

    for (int i=0; i<ns; i++) {
      soma=soma+star[i].n;
    }

    return soma;
  }

  void desenha() {
    
    if (soma==100) { //Se a soma for maior que 100 é apresentado o menu
      menu.selected = Menu.WON;
    }

    //Estrelas
    for (int i=0; i<ns; i++) {
      if (star[i].isPressed()) { //Crescem, ficam vermelhas e o número aumenta quando o rato esta por cima
        star[i].grow();
        star[i].redgiant();
      }
      star[i].colideWall(); //Colisão com as paredes
      star[i].move(); //Movimento
      star[i].desenha(); //Desenha

      for (int j=0; j<ns; j++) { //Colisão entre estrelas
        if ((star[i].colide(star[j]) && i != j) || (planet[i].colide(star[i]) || planet[i].colide(star[j]))) { //HÁ AQUI UM BUG QQ QUANDO ELE TOCA NO SOL POR CIMA OU POR BAIXO
          if (star[i].isPressed() || star[j].isPressed()) {
            println("Perdeu!");
            menu.selected = Menu.LOST;
          } else {
            star[i].resolverColisao(star[j]);
          }
        }
      }

      planet[i].desenha();
    }

    colision();

    //Texto do número
    textAlign(CENTER, CENTER);
    fill(200);
    textSize(100);
    text(soma(), width/2, height/2);
  }
}