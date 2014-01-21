class JinnyJo {
  int numberLines, midPointX, midPointY, offsetX, offsetY, endPointX, endPointY;
  int midPointRadius = 20;
  
  JinnyJo() {
    // Anzahl der Linien pro Linienhaufen
    numberLines = (int)random(15,35);
    
    // Mittelpunkt bei Erstellung berechnen (irgendwo in der Mitte)
    this.midPointX = (int)random( (width/2)-10, (width/2)+10);
    this.midPointY = (int)random( (height/2)-10, (height/2)+10);
      
  }
  
  // JinnyJo bewegen, je nach Stärke
  public void move(float strength) {
    this.midPointX = (int)random( (width/2)-strength, (width/2)+strength);
    this.midPointY = (int)random( (height/2)-strength, (height/2)+strength);
  }
  
  public void drawIt() {
    // Linien in diesem JinnyJo berechnen und zeichnen
    for (int j = 0; j < numberLines; j++) {
      // Offset berechnen
      offsetX = (int)random(-5,5);
      offsetY = (int)random(-5,5);
      
      // Endpunkt berechnen
      endPointX = (int)random(midPointX + offsetX - 20, midPointX + offsetX + 20);
      endPointY = (int)random(midPointY + offsetY - 20, midPointY + offsetY + 20);
      
      // Farbe der Linie setzen
      stroke(currenColorBlock.getRFront(), currenColorBlock.getGFront(), currenColorBlock.getBFront() );
      
      // Linie zeichnen
      line(midPointX + offsetX, midPointY + offsetY, endPointX, endPointY);
    } 
  }
  
}
