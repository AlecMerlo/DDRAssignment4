import processing.sound.*;

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
boolean playingSong = false;
boolean upPressed = false, downPressed = false, leftPressed = false, rightPressed = false;
PFont font;

PImage edgardKitBL;

ArrayList<HitParticle> hitParticles = new ArrayList<HitParticle>();
ArrayList<Particle> particles = new ArrayList<Particle>();
ArrayList<Integer> noteTime = new ArrayList<Integer>();
ArrayList<Integer> noteType = new ArrayList<Integer>();

void setup(){
  size(600,900);
  
  edgardKitBL = loadImage("edgardKitBL.png");
  
  for(int i = 0; i < 50; i++){
    particles.add(new Particle());
  }
  
  font = createFont("Comic Sans MS", 30);
  textFont(font);
  
  californiaGurls = new SoundFile(this, "CaliforniaGurls.wav");
  absoluteTerritory = new SoundFile(this, "AbsoluteTerritory.wav");
}


void draw(){
  background(100);
  if(playingSong == true){
    playSong();
  }
  else{
    menuScreen();
  }
}

void menuScreen(){
  fill(255);
  image(edgardKitBL, 350, frameCount * 5 % 5000 - 400, 200, 200);
  text("California Gurls\n\nAbsolute Territory", 200, 110);
  ellipse(150, songChosen * 80 + 100, 30, 30);
}

void reset(){
  if(songChosen == 0){
    californiaGurls.stop();
  }
  else if(songChosen == 1){
    absoluteTerritory.stop();
  }
  beat = -8;
  frame = 0;
  health = 100;
  hitFrame = 0;
  missedFrame = 0;
  playingSong = false;
}

void keyPressed(){
  if((key == '1' || key == '\n' || key == ' ') && !playingSong){
    setupSong();
    playingSong = true;
  }
  if(key == 'w' && !playingSong){
    songChosen -= 1;
    if(songChosen == -1){
      songChosen = 1;
    }
  }
  if(key == 's' && !playingSong){
    songChosen += 1;
    if(songChosen == 2){
      songChosen = 0;
    }
  }
  
  if((key == 'i' || key == 'w') && playingSong){
    for(int i = 0; i < noteType.size(); i++){
      if(noteType.get(i) == 0){
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
  if((key == 'k' || key == 's') && playingSong){
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
  if((key == 'j' || key == 'a') && playingSong){
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
  if((key == 'l' || key == 'd') && playingSong){
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
}

void keyReleased(){
  if(key == 'i' || key == 'w'){
    upPressed = false;
  }
  if(key == 'k' || key == 's'){
    downPressed = false;
  }
  if(key == 'j' || key == 'a'){
    leftPressed = false;
  }
  if(key == 'l' || key == 'd'){
    rightPressed = false;
  }
}
