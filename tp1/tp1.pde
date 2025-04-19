PImage img;

void setup() {
  size(800, 400);
  img = loadImage("bmo.png");
  
}

void draw() {
image(img, 0, 0, 400, 400);

 int cuerpoAncho = 145;
  int cuerpoAlto = 250;
  int profundidad = 65;
  int cuerpoX = 600 - cuerpoAncho / 2;
  int cuerpoY = 210 - cuerpoAlto / 2;
  
 // Parte frontal
  fill(100, 200, 200);
  stroke(0);
  rect(cuerpoX, cuerpoY, cuerpoAncho, cuerpoAlto);

  fill(100, 180, 180);
  quad(
    cuerpoX, cuerpoY,
    cuerpoX - profundidad, cuerpoY - 10,
    cuerpoX - profundidad, cuerpoY + cuerpoAlto - 10,
    cuerpoX, cuerpoY + cuerpoAlto
  );
  
// Parte superior (techo de BMO)
  fill(90, 190, 190);
  quad(
    cuerpoX, cuerpoY,
    cuerpoX + cuerpoAncho, cuerpoY,
    cuerpoX + cuerpoAncho - 15, cuerpoY - 10,
    cuerpoX - profundidad, cuerpoY - 10
  );

  fill(200, 240, 240);
  stroke(0);
  // Pantalla de BMO
  rect(cuerpoX + 10, cuerpoY + 20, 125, 100);

  fill(0);
  noStroke();
  // Ojo iquierdo
  ellipse(cuerpoX + 45, cuerpoY + 55, 5, 5);
  // Ojo derecho
  ellipse(cuerpoX + 95, cuerpoY + 55, 5, 5);
  noFill();
  stroke(0);
  strokeWeight(1.5);
  // Sonrisa 
  arc(cuerpoX + 70, cuerpoY + 65, 18, 8, 0, PI);
  
// Letras 
  fill(0);
  noStroke();
  textSize(50);
  text("B", cuerpoX - 50, cuerpoY + 90);
  text("M", cuerpoX - 50, cuerpoY + 140);
  text("O", cuerpoX - 50, cuerpoY + 190);
  
  //Altavoces
  fill(0);
  int centroAltavozX = cuerpoX - 40;
  int centroAltavozY = cuerpoY + 30;
  int r = 10;
  ellipse(centroAltavozX, centroAltavozY - r, 4, 4);
  ellipse(centroAltavozX + r, centroAltavozY - r/2, 4, 4);
  ellipse(centroAltavozX + r, centroAltavozY + r/2, 4, 4);
  ellipse(centroAltavozX, centroAltavozY + r, 4, 4);
  ellipse(centroAltavozX - r, centroAltavozY + r/2, 4, 4);
  ellipse(centroAltavozX - r, centroAltavozY - r/2, 4, 4);
  ellipse(centroAltavozX, centroAltavozY, 4, 4);

  // Posiciones y tamaños de los botones
  int cruzX = cuerpoX + 20;
  int cruzY = cuerpoY + 165;
  int triX = cuerpoX + 68;
  int triY = cuerpoY + 145;
  int rojoX = cuerpoX + 85;
  int rojoY = cuerpoY + 185;
  int verdeX = cuerpoX + 115;
  int verdeY = cruzY + 10;

  // Cruz amarilla
 fill(255, 255, 0);
  noStroke();
  rect(cruzX + 5, cruzY - 6, 8, 28);
  rect(cruzX - 5, cruzY + 4, 28, 8);

  // Triángulo más grande 
  fill(100, 200, 200);
  stroke(0);
  triangle(triX, triY + 20, triX + 15, triY, triX + 30, triY + 20);

  // Botón rojo
  fill(255, 0, 0);
  stroke(0);
  ellipse(rojoX, rojoY, 18, 18);

  // Botón verde
  fill(0, 200, 0);
  stroke(0);
  ellipse(verdeX, verdeY, 14, 14);

  // Piernas
   fill(100, 200, 200);
  stroke(0);
  rect(cuerpoX + 25, cuerpoY + cuerpoAlto, 8, 50);
  rect(cuerpoX + 100 - 8, cuerpoY + cuerpoAlto, 8, 50);

  // Brazo izquierdo
  stroke(0);
  fill(100, 200, 200);
  int oBrazoX = cuerpoX - 33;
  int oBrazoY = cuerpoY + 175;
  rect(oBrazoX - 4, oBrazoY, 8,60);

   // Barra y círculo plomo
  fill(150);
  stroke(0);
  rect(cuerpoX + 25, cuerpoY + 124, 90, 10);
  ellipse(cuerpoX + 125, cuerpoY + 128, 6, 6);

  // Brazo derecho
  fill(100, 200, 200);
  stroke(0);
  int dBrazoX = cuerpoX + cuerpoAncho;
  int dBrazoY = cuerpoY + 135;
  quad(
    dBrazoX, dBrazoY,
    dBrazoX + 8, dBrazoY,
    dBrazoX + 18, dBrazoY - 50,
    dBrazoX + 10, dBrazoY - 50
  );
}
