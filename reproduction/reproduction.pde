import processing.pdf.*;

void setup() {
  size(500, 500);
  drawJinnyjo();
}

void draw() {
}

void drawJinnyjo() {
  background(255);
  // Anzahl der Linienhaufen
  int numberPiles = (int)random(10,30);
  int numberLines, midPointX, midPointY, offsetX, offsetY, endPointX, endPointY;
  int midPointRadius = 20;
  
  for (int i = 0; i < numberPiles; i++) {
    
    // Anzahl der Linien pro Linienhaufen
    numberLines = (int)random(15,35);
    
    // Mittelpunkt berechnen
    midPointX = (int)random( 20, width - 20);
    midPointY = (int)random( 20, height - 20);
    
    
    for (int j = 0; j < numberLines; j++) {
      
      // Offset berechnen
      offsetX = (int)random(-5,5);
      offsetY = (int)random(-5,5);
      
      // Endpunkt berechnen
      endPointX = (int)random(midPointX + offsetX - 20, midPointX + offsetX + 20);
      endPointY = (int)random(midPointY + offsetY - 20, midPointY + offsetY + 20);
      
      // Linie zeichnen
      line(midPointX + offsetX, midPointY + offsetY, endPointX, endPointY);
    } 
  }
  

  
}


void keyPressed() {
  if (key == 'n') {
     drawJinnyjo();
  } else if (key == 's') {
    beginRecord(PDF, System.currentTimeMillis()/1000 + ".pdf");
    drawJinnyjo();
    endRecord();
  }
}
