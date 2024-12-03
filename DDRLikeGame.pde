import processing.sound.*;

SoundFile californiaGurls;
SoundFile absoluteTerritory;

int beat = -8;
int bpm = 0;
int frame = 0;
int songChosen = 0;
boolean playingSong = false;
boolean upPressed = false, downPressed = false, leftPressed = false, rightPressed = false;
PFont font;

ArrayList<Integer> noteTime = new ArrayList<Integer>();
ArrayList<Integer> noteType = new ArrayList<Integer>();

void setup(){
  size(600,900);
  
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
  
  text("California Gurls\n\nAbsolute Territory", 200, 110);
  ellipse(150, songChosen * 80 + 100, 30, 30);
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
          noteType.remove(i);
          noteTime.remove(i);
        }
        break;
      }
    }
    rightPressed = true;
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
