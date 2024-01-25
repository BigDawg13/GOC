SpriteManager _SM;
TextManager _TM;

int asdf = 5;
int level = 1;
void setup() {
    size(1024, 768);
    _TM = new TextManager();
    _SM = new SpriteManager();
    Level1();
}

void Level1() {
    _SM.spawn(new Invader(250, 50, 40, 40));
    _SM.spawn(new Invader(250, 150, 40, 40));
    _SM.spawn(new Invader(250, 50, 40, 40));
}

void Level2() {
    _SM.spawn(new Invader(50, 50, 40, 40));
    _SM.spawn(new Shooter(80, 100));
    _SM.spawn(new Shooter(500, 200));
}

void Level3() {
    _SM.spawn(new Shooter(500, 200));
    _SM.spawn(new Shooter(150, 100));
    _SM.spawn(new Shooter(500, 300));
    _SM.spawn(new Invader(350, 250, 40, 40));
    _SM.spawn(new Invader(450, 150, 40, 40));
    _SM.spawn(new Invader(550, 400, 40, 40));
}

void Level4() {
    _SM.spawn(new Invader(250, 50, 40, 40));
    _SM.spawn(new Shooter(150, 100));
    _SM.spawn(new Shooter(150, 200));
    _SM.spawn(new MiniBoss(500, 300));
}

void Level5() {
    _SM.spawn(new MiniBoss(500, 200));
    _SM.spawn(new MiniBoss(500, 100));
    _SM.spawn(new MiniBoss(500, 300));
    _SM.spawn(new MiniBoss(500, 400));
}

void draw() {
    background(0);
    _SM.manage();
    if(asdf <= 0) {
      _TM.endGameScreen();
      _SM.killEverything();
      _SM.endScreenJazz();
    }
    if(_SM.levCheck()) {
      switch(level) {
        case 1: Level1(); break;
        case 2: Level2(); break;
        case 3: Level3(); break;
        case 4: Level4(); break;
        case 5: Level5(); break;
        default:
        _SM.killEverything();
        _TM.youWinScreen();
        _SM.endScreenJazz();
        break;
      }
    }
}

void keyPressed() {
    _SM.player.keyDown();
}

void keyReleased() {
    _SM.player.keyUp();
}
