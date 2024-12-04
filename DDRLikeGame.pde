import processing.sound.*;

 /* ~~~~~~~~~~~~~~~~~~~~~~~CONTROLS~~~~~~~~~~~~~~~~~~~~~ *\
 \   ~~~~~~~~~~ UP and DOWN to navigate menu ~~~~~~~~~~   /
 /    ~~~~~~~ 1, ENTER, or SPACE to select song ~~~~~~    \
|      ~~ UP, DOWN, LEFT, and RIGHT for the secret ~~      |
 \    ~~~~~~~~~~~~~~~ R to restart game ~~~~~~~~~~~~~~    /
 /   ~ A, S, D, F and/or H, J, K, L for hitting notes ~   \
 \* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SoundFile californiaGurls;
SoundFile absoluteTerritory;

Particle particle = new Particle();
HitParticle hitParticle = new HitParticle();

int beat = -8;
int bpm = 0;
int frame = 0;
int songChosen = 0;
int health = 100;
int missedFrame;
int hitFrame;
int konami = 0;
boolean playingSong = false;
boolean upPressed = false, downPressed = false, leftPressed = false, rightPressed = false;
PFont font;

// :3
PImage edgardKitBL;
PImage edgardHappy;
PImage edgardAngry;
PImage edgardDoingWhatNoLeaguePlayerEverDoes;
PImage steamhappy;

ArrayList<HitParticle> hitParticles = new ArrayList<HitParticle>();
ArrayList<Particle> particles = new ArrayList<Particle>();
ArrayList<Integer> noteTime = new ArrayList<Integer>();
ArrayList<Integer> noteType = new ArrayList<Integer>();

void setup(){
  size(600,900);
  
  edgardKitBL = loadImage("edgardKitBL.png");
  edgardHappy = loadImage("edgardHappy.png");
  edgardAngry = loadImage("edgardAngry.png");
  edgardDoingWhatNoLeaguePlayerEverDoes = loadImage("edgardDoingWhatNoLeaguePlayerEverDoes.png");
  steamhappy = loadImage("steamhappy.png");
  
  // creating all the background particles
  for(int i = 0; i < 30; i++){
    particles.add(new Particle());
  }
  
  californiaGurls = new SoundFile(this, "CaliforniaGurls.wav");
  absoluteTerritory = new SoundFile(this, "AbsoluteTerritory.wav");
  reset();
}


void draw(){
  background(100);
  // the screens for playing the song, and being in the main menu
  if(playingSong == true){
    playSong();
  }
  else{
    menuScreen();
  }
}

// showing the songs to select with a circle next to the song the pointer is on
void menuScreen(){
  fill(255);
  image(edgardKitBL, 350, frameCount * 5 % 5000 - 400, 200, 200);
  text("California Gurls\n\nAbsolute Territory", 200, 110);
  strokeWeight(2);
  ellipse(150, songChosen * 80 + 100, 30, 30);
}

// resets all the important values
void reset(){
  // changes the menu font at random
  // UNDERTALE!!?!?!@??!@?#!?@?!$@?!?@%
  if(random(0,2) > 1){
    font = createFont("Papyrus", 25);
  }
  else{
    font = createFont("Comic Sans MS", 30);
  }
  textFont(font);
  // stops the songs
  if(songChosen == 0){
    californiaGurls.stop();
  }
  else if(songChosen == 1){
    absoluteTerritory.stop();
  }
  konami = 0;
  beat = -8;
  frame = 0;
  health = 100;
  hitFrame = 0;
  missedFrame = 0;
  playingSong = false;
}

void keyPressed(){
  // give people options on what they wanna press to start the song
  if((key == '1' || key == '\n' || key == ' ') && !playingSong){
    setupSong();
    playingSong = true;
  }
  // scrolling through songs
  if((keyCode == UP || key == 'w') && !playingSong){
    songChosen -= 1;
    if(songChosen == -1){
      songChosen = 1;
    }
  }
  if((keyCode == DOWN || key == 's') && !playingSong){
    songChosen += 1;
    if(songChosen == 2){
      songChosen = 0;
    }
  }
  
  // hitting the notes
  if((key == 'k' || key == 'd') && playingSong){
    for(int i = 0; i < noteType.size(); i++){
      // if it is the right note direction
      if(noteType.get(i) == 0){
        // starting with where the notes should be, multiplied by speed and minus how far the player is in the song
        // then adds two bars so that it isn't instant when the song starts
        // multiply it all by 10 to be easier to read
        // then paramaters (when its between -150 and 60, which in game looks lower on the screen than in code but whatever)
        if(((noteTime.get(i) * 5 - frame) + (bpm * 2)) * 10 > -150 && ((noteTime.get(i) * 5 - frame) + (bpm * 2)) * 10 < 60){
          hitFrame = 10;
          hitParticleCreate(370, 100);
          noteType.remove(i);
          noteTime.remove(i);
        }
        break;
      }
    }
    upPressed = true;
  }
  if((key == 'j' || key == 's') && playingSong){
    for(int i = 0; i < noteType.size(); i++){
      if(noteType.get(i) == 1){
        if(((noteTime.get(i) * 5 - frame) + (bpm * 2)) * 10 > -150 && ((noteTime.get(i) * 5 - frame) + (bpm * 2)) * 10 < 60){
          hitFrame = 10;
          hitParticleCreate(230, 100);
          noteType.remove(i);
          noteTime.remove(i);
        }
        break;
      }
    }
    downPressed = true;
  }
  if((key == 'h' || key == 'a') && playingSong){
    for(int i = 0; i < noteType.size(); i++){
      if(noteType.get(i) == 2){
        if(((noteTime.get(i) * 5 - frame) + (bpm * 2)) * 10 > -150 && ((noteTime.get(i) * 5 - frame) + (bpm * 2)) * 10 < 60){
          hitFrame = 10;
          hitParticleCreate(90, 100);
          noteType.remove(i);
          noteTime.remove(i);
        }
        break;
      }
    }
    leftPressed = true;
  }
  if((key == 'l' || key == 'f') && playingSong){
    for(int i = 0; i < noteType.size(); i++){
      if(noteType.get(i) == 3){
        if(((noteTime.get(i) * 5 - frame) + (bpm * 2)) * 10 > -150 && ((noteTime.get(i) * 5 - frame) + (bpm * 2)) * 10 < 60){
          hitFrame = 10;
          hitParticleCreate(510, 100);
          noteType.remove(i);
          noteTime.remove(i);
        }
        break;
      }
    }
    rightPressed = true;
  }
  if(key == 'r' && playingSong){
    reset();
  }
  // funny konami code
  switch(konami){
    case 0:
    if(keyCode == UP){
      konami += 1;
    }
      break;
    case 1:
    if(keyCode == UP){
      konami += 1;
    }
    else{
      konami = 0;
    }
      break;
    case 2:
    if(keyCode == DOWN){
      konami += 1;
    }
    else{
      konami = 0;
    }
      break;
    case 3:
    if(keyCode == DOWN){
      konami += 1;
    }
    else{
      konami = 0;
    }
      break;
    case 4:
    if(keyCode == LEFT){
      konami += 1;
    }
    else{
      konami = 0;
    }
      break;
    case 5:
    if(keyCode == RIGHT){
      konami += 1;
    }
    else{
      konami = 0;
    }
      break;
    case 6:
    if(keyCode == LEFT){
      konami += 1;
    }
    else{
      konami = 0;
    }
      break;
    case 7:
    if(keyCode == RIGHT){
      konami += 1;
    }
    else{
      konami = 0;
    }
      break;
  }
}

void keyReleased(){
  if(key == 'k' || key == 'd'){
    upPressed = false;
  }
  if(key == 'j' || key == 's'){
    downPressed = false;
  }
  if(key == 'h' || key == 'a'){
    leftPressed = false;
  }
  if(key == 'l' || key == 'f'){
    rightPressed = false;
  }
}
