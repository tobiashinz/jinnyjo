import java.util.ArrayList;
import ddf.minim.*;
import java.util.Collections;

// Variablen für Sounderkennung
Minim minim;
AudioInput in;

// maximale Anzahl an JinnyJoes
int maxJinnyJoes = 20;

// ArrayList für Farben erstellen und Vorbereitungen treffen
ArrayList<ColorBlock> colorBlockList = new ArrayList<ColorBlock>();
ColorBlock currenColorBlock;
int currentColorBlockNumber = 0;

// ArrayList erstellen in die die JinnyJoes gespeichert werden
ArrayList<JinnyJo> jinnyJoList;

// ArrayList erstellen in die die Blasaktivitäten gespeichert werden
ArrayList blowValues = new ArrayList();
  
void setup() {
  // Farben für Farbblöcke definieren
  colorBlockList.add(new ColorBlock(255, 255, 255, 0, 0, 0));
  colorBlockList.add(new ColorBlock(22, 93, 97, 239, 231, 208));
  colorBlockList.add(new ColorBlock(250, 227, 180, 243, 74, 83));
  colorBlockList.add(new ColorBlock(41, 128, 185, 236, 240, 241));
  colorBlockList.add(new ColorBlock(150, 206, 180, 255, 238, 173));
  colorBlockList.add(new ColorBlock(241, 242, 241, 5, 187, 133));

  // ArrayList für JinnyJoes instanzieren
  jinnyJoList = new ArrayList<JinnyJo>();
  
  // Arbeitsfläche in Pixeln setzen
  size(500, 500);
  
  // Sounderkennung starten
  minim = new Minim(this);
  in = minim.getLineIn( Minim.MONO, 512 );
  
  // neue Szene zeichnen
  newScene();
  
}

void draw() {
  // Sounderkennung
  float m = 0;
  for(int i = 0; i < in.bufferSize() - 1; i++) {
    if ( abs(in.mix.get(i)) > m ) {
      m = abs(in.mix.get(i));
    }
  }
  
  // Erkannten Sound faktorisieren da Werte sonst sehr klein
  m = m*200;
  
  // Grenzwert für Sounderkennung
  // nicht jedes Geräusch soll etwas auslösen
  if(m > 10) {
    // neuen Wert eintragen
    blowValues.add(new Float(m));
    
    // Größe checken
    if(blowValues.size() >= 10) {
      float val = new Float(Collections.max(blowValues).toString());
      blowRecognised(val);
      
      // GarbageCollector DO YOUR THING
      blowValues.clear();
    }
  }
}

void newScene() {
  jinnyJoList.clear();
  // JinnyJoes erstellen und in die ArrayList speichern
  for(int i = 1; i < maxJinnyJoes; i++) {
    jinnyJoList.add(new JinnyJo());
  }
  
  // Farbcode setzen
  currenColorBlock = colorBlockList.get(currentColorBlockNumber);
  
  // Hintergrund neu zeichnen um alte JinnyJoes zu löschen
  background(currenColorBlock.getRBack(), currenColorBlock.getGBack(), currenColorBlock.getBBack());
  
  // Durch die ArrayList gehen und einzelne JinnyJoes zeichnen lassen
  for (int i = 0; i < jinnyJoList.size(); i++) {
    JinnyJo jinnyjo = jinnyJoList.get(i);
    jinnyjo.drawIt();
  } 
}

// Funktion wird gestartet wenn Pusten erkannt wurde
// bewegt und zeichnet dann die JinnyJoes
void blowRecognised(float strength) {
  background(currenColorBlock.getRBack(), currenColorBlock.getGBack(), currenColorBlock.getBBack());
  
  for (int i = 0; i < jinnyJoList.size(); i++) {
    JinnyJo jinnyjo = jinnyJoList.get(i);
    jinnyjo.move(strength);
    jinnyjo.drawIt();
  }
}

// Funktion zum Auswählen einer anderen Farbkombination
void changeColorBlock() {
  currentColorBlockNumber++;
  if(currentColorBlockNumber >= colorBlockList.size()) {
    currentColorBlockNumber = 0;
  }
  newScene();
}

// Key Listener
void keyPressed() {
  if (key == 'n') {
     newScene();
  } else if (key == 'b') {
     blowRecognised(100);
  } else if (key == 'c') {
     changeColorBlock();
  }
}
