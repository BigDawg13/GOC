class TextManager {
 
  TextManager() {
    
  }
  
  public void endGameScreen() {
      if(asdf <= 0) {
        fill(225);
        textSize(32);
        textAlign(CENTER, CENTER);
        text("GAME OVER", width / 2, height / 2);
        textSize(20);
        text("Press N For a New Game", width / 2, height / 2 + 100);
      }
    }
    
    public void youWinScreen() {
        fill(225);
        textSize(32);
        textAlign(CENTER, CENTER);
        text("YOU WIN", width / 2, height / 2);
        textSize(20);
        text("Press N For a New Game", width / 2, height / 2 + 100);
    }
}
