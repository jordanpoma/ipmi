// Autor: Jordan Poma
// Legajo: 122846/8
// Comisión: 1
PImage img;
float tam = 100;
boolean modoInteractivo = true;

// Tamaño máximo del tablero
int maxCols = 20;
int maxRows = 20;
boolean[] pintados;
color[] colores;
float[] opacidades;

void setup() {
  size(800, 400);
  img = loadImage("rombos.jpeg");
  img.resize(400, 400);

  int total = maxCols * maxRows;
  pintados = new boolean[total];
  colores = new color[total];
  opacidades = new float[total];

  for (int i = 0; i < total; i++) {
    pintados[i] = false;
    colores[i] = color(255);
    opacidades[i] = 0;
  }
}

void draw() {
  background(255);
  image(img, 0, 0);

  int cols = ceil((width - 400) / tam);
  int rows = ceil(height / tam);
  stroke(150);
  line(400, 0, 400, height);
  noStroke();

  int index = 0;

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      if (index >= pintados.length) continue;

      float x = 400 + i * tam;
      float y = j * tam;
      float cx = x + tam / 2;
      float cy = y + tam / 2;
      float t = tam / 2;

      // Fondo
      if (pintados[index]) {
        fill(lerpColor(color(255), color(200, 200, 0), 0.5));
      } else {
        if ((i + j) % 2 == 0) fill(255);
        else fill(0);
      }
      rect(x, y, tam, tam);

      // Pintar con mouse
      if (modoInteractivo && mouseX > 400) {
        if (mouseX > x && mouseX < x + tam && mouseY > y && mouseY < y + tam) {
          pintados[index] = true;
        }
      }

      // Color dinámico y opacidad
      if (pintados[index]) {
        if (frameCount % 20 == 0) {
          colores[index] = color(random(255), random(255), random(255));
        }
        opacidades[index] = lerp(opacidades[index], 255, 0.08);
        fill(colores[index], opacidades[index]);
      } else {
        if ((i + j) % 2 == 0) fill(0);
        else fill(255);
      }

      // Rotación y escala por efecto agujero negro
      float angulo = 0;
      if (modoInteractivo && mouseX > 400) {
        angulo = atan2(mouseY - cy, mouseX - cx);
      }

      float escala = calcularEscalaAgujero(cx, cy);

      pushMatrix();
      translate(cx, cy);
      rotate(angulo);
      scale(escala);
      dibujarRombo(0, 0, t);
      popMatrix();

      index++;
    }
  }
}

void dibujarRombo(float x, float y, float t) {
  beginShape();
  vertex(x, y - t);
  vertex(x + t, y);
  vertex(x, y + t);
  vertex(x - t, y);
  endShape(CLOSE);
}

float calcularEscalaAgujero(float x, float y) {
  if (mouseX <= 400) return 1.0; // Solo se activa en la parte derecha
  float d = dist(mouseX, mouseY, x, y);
  float escala = map(d, 0, 200, 0.3, 1.0);
  return constrain(escala, 0.3, 1.0);
}

void mouseWheel(MouseEvent event) {
  float delta = event.getCount();
  tam -= delta * 5;
  tam = constrain(tam, 20, 150);
  redraw();
}

void keyPressed() {
  if (key == ' ') {
    for (int i = 0; i < pintados.length; i++) {
      pintados[i] = false;
      colores[i] = color(255);
      opacidades[i] = 0;
    }
    tam = 100;
    modoInteractivo = false;
  }
}

void mouseMoved() {
  if (!modoInteractivo && mouseX > 400) {
    modoInteractivo = true;
  }
}
