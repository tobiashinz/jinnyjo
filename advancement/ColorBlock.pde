// Klasse für Farbkombinationen
class ColorBlock {
  int rValBack, gValBack, bValBack, rValFront, gValFront, bValFront;
  ColorBlock(int rBack, int gBack, int bBack, int rFront, int gFront, int bFront) {
    rValBack = rBack;
    gValBack = gBack;
    bValBack = bBack;
    rValFront = rFront;
    gValFront = gFront;
    bValFront = bFront;
  }
  
  public int getRBack() {
    return rValBack;
  } 
  public int getGBack() {
    return gValBack;
  } 
  public int getBBack() {
    return bValBack;
  }
  public int getRFront() {
    return rValFront;
  }
  public int getGFront() {
    return gValFront;
  }
  public int getBFront() {
    return bValFront;
  }
  
} 
