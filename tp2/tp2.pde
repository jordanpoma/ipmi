// Autor: Jordan Poma
// Legajo: 122846/8
// Comisión: 1

PImage estrellass, lucasfilm, logo;
int pantalla = -1;
int tiempoInicio;
float alphaLogo = 180;

float escalaLogo = 1.2;
float textoY = 700; // <- más bajo
float escalaTexto = 1.0;

int botonX = 590;
int botonY = 50;
int radioBoton = 30;
boolean poscreditosMostrados = false;
boolean mostrarTexto = false;

PFont fuente;

String[] lineas = {
  "Episodio IV",
  "UNA NUEVA ESPERANZA",
  "",
  "Es una época de guerra civil.",
  "Naves rebeldes, atacando desde",
  "una base secreta, han logrado",
  "su primera victoria contra el",
  "malvado Imperio Galáctico.",
  "",
  "Durante la batalla, espías rebeldes",
  "lograron robar planos secretos",
  "del arma definitiva del Imperio:",
  "la ESTRELLA DE LA MUERTE,",
  "una estación espacial blindada",
  "con suficiente poder para destruir",
  "un planeta entero.",
  "",
  "Perseguida por los siniestros agentes",
  "del Imperio, la Princesa Leia",
  "regresa a casa a bordo de su nave",
  "espacial, llevando los planos robados",
  "que pueden salvar a su pueblo",
  "y restaurar la libertad en la galaxia...."
};

void setup() {
  size(640, 480);
  estrellass = loadImage("estrellass.jpg");
  lucasfilm = loadImage("lucasfilm.jpg");
  logo = loadImage("logoo.jpg");

  fuente = createFont("Arial", 22);
  textFont(fuente);
  textAlign(CENTER);
  smooth(8); // Mejora la suavidad de texto
}

void draw() {
  image(estrellass, 0, 0, width, height);

  if (pantalla == -1) {
    image(logo, 0, 0, width, height);
    fill(150);
    ellipse(botonX, botonY, radioBoton * 2, radioBoton * 2);
    fill(80);
    float s = 10;
    triangle(botonX - s, botonY - s, botonX - s, botonY + s, botonX + s, botonY);
    
  }

  else if (pantalla == 0) {
  background(0);
  int tiempoLucas = millis() - tiempoInicio;
  float alphaLucas = map(tiempoLucas, 0, 2000, 0, 255);
  alphaLucas = constrain(alphaLucas, 0, 255);

  tint(255, alphaLucas);
  image(lucasfilm, 0, 0, width, height);
  noTint();

  if (millis() - tiempoInicio > 4500) {
      pantalla = 1;
      tiempoInicio = millis();
    }
  }

  else if (pantalla == 1) {
    float fade = map(millis() - tiempoInicio, 0, 300, 0, 255);
    fade = constrain(fade, 0, 255);
    fill(0, 255 - fade);
    rect(0, 0, width, height);

    pushMatrix();
    translate(width/2, height/2);
    scale(escalaLogo);
    tint(255, alphaLogo);
    imageMode(CENTER);
    image(logo, 0, 0);
    imageMode(CORNER);
    noTint();
    popMatrix();

    int tiempoTranscurrido = millis() - tiempoInicio;

    if (tiempoTranscurrido > 6000) {
      mostrarTexto = true;
    }

    if (tiempoTranscurrido > 300 && tiempoTranscurrido <= 40000) {
      escalaLogo *= 0.9970;
      alphaLogo = max(0, alphaLogo - 0.002);
    }

    if (escalaLogo <= 0.00005 || alphaLogo <= 0) {
      pantalla = 2;
      tiempoInicio = millis();
      escalaLogo = 1.2;
      alphaLogo = 180;
    }

    if (mostrarTexto) {
      

      textAlign(CENTER, CENTER);
      textFont(fuente);

      for (int i = 0; i < lineas.length; i++) {
        float y = textoY + i * 40;
        float profundidad = (y - 100) / 300.0;
        float escala = max(0, 1.0 - profundidad);
        float alpha = constrain(map(y, 100, 0, 255, 0), 0, 255) * escala;

        if (escala > 0) {
          pushMatrix();
          translate(width / 2, y);
          scale(escala);
          shearX(-0.3);
          fill(255, 255, 0, alpha);
          textSize(30);
          text(lineas[i], 0, 0);
          popMatrix();
        }
      }

      textoY -= 0.6;
    }

    if (textoY < -800) {
      pantalla = -1;
    }
  }

  else if (pantalla == 3) {
    background(0);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(32);
    text("ESCENA POSCRÉDITOS\n\nGracias por ver.\nQue la Fuerza te acompañe.", width/2, height/2);

    fill(150);
    ellipse(botonX, botonY, radioBoton * 2, radioBoton * 2);
    fill(80);
    float s = 10;
    triangle(botonX - s, botonY - s, botonX - s, botonY + s, botonX + s, botonY);
  }
}

void mousePressed() {
  float d = dist(mouseX, mouseY, botonX, botonY);
  if ((pantalla == -1 || pantalla == 3) && d < radioBoton) {
    pantalla = 0;
    tiempoInicio = millis();
    escalaLogo = 1.2;
    alphaLogo = 180;
    textoY = 700; // <- restablecido más bajo
    escalaTexto = 1.0;
    mostrarTexto = false;
    poscreditosMostrados = false;
  }
}
