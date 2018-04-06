int x, y; 
int z;
int deplX, deplY;
int w1, z1, w2, z2;

void setup() {
  // position initiale raquette1 
  w1 = 10;   
  z1 = 255;

  // position initiale raquette2
  w2 = 560; 
  z2 = 255; 

  // rebond balle
  deplX = 4;
  deplY = -2;

  // coord balle
  y = 300;
  x = 300;

  size(600, 600); // taille de la fenetre
}

void draw() {
  nettoyer();
  dessiner();
  bouger();
  rebondir();
}

void nettoyer() {  
  background(125, 185, 0);
}

void dessiner() {  // raquette 1 et 2, balle
  // raquette1
  smooth();
  fill(200, 12, 125);
  rect(w1, z1, 30, 90, 0, 10, 10, 0);  //val par défaut = corner
  // raquette2
  smooth();
  fill(200, 12, 125);
  rect(w2, z2, 30, 90, 10, 0, 0, 10);  //val par défaut = corner
  // balle
  fill(100);
  ellipse(x, y, 20, 20);
  // filet
  line(300, 0, 300, 600);
}


void bouger() { // déplacement balle et raquette
  // déplacement balle
  x+=deplX;
  y+=deplY;
  // déplacement raquette1
  //  z = (mouseY); -> Remplacer la souris par le clavier
  if (keyPressed) {
    if (key == 'q' && z1 > 4) {
      z1 -= 4;
    } else if (key == 'w' && z1 < 506) {
      z1 += 4;
    }
  }
  // déplacement raquette2
  if (keyPressed) {
    if (key == 'm' && z2 > 4) {
      z2 -= 4;
    } else if (key == ':' && z2 < 506) {
      z2 += 4;
    }
  }
}
void rebondir() {
  // la balle part vers le bas 
  if (y > 590 && deplY > 0) 
  { 
    deplY = -deplY; // inverser la valeur
  }

  // la balle part vers le haut
  if (y < 10 && deplY < 0) 
  { 
    deplY = abs(deplY); // inverser la valeur
  }

  // rebond raquette1
  if (x < 50 && y >= z1 && y <= z1+90)
  {
    deplX = -deplX; // inverser la valeur
  }
  // rebond raquette2
  if (x > 550 && (y >= z2 && y <= z2+90))
  {
    deplX = -deplX; // inverser la valeur
  }

  // fin de la partie
  if (x < 10 || x > 590)
  {

    println("GAME OVER");
    /*  println("Voulez-vous rejouer ?");
     if (keyPressed) {
     if (key == 'a') {
     draw();
     } else {   */
    noLoop();
  }
}