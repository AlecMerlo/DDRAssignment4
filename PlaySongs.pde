void setupSong(){
  noteTime.clear();
  noteType.clear();
  //  h e l p
  switch(songChosen){
    case 0:
      bpm = 125;
      
      noteType.add(1);
      noteTime.add(0);
      noteType.add(2);
      noteTime.add(10);
      noteType.add(2);
      noteTime.add(14);
      noteType.add(3);
      noteTime.add(28);
      noteType.add(0);
      noteTime.add(32);
      noteType.add(0);
      noteTime.add(36);
      noteType.add(1);
      noteTime.add(46);
      noteType.add(2);
      noteTime.add(56);
      noteType.add(2);
      noteTime.add(60);
      noteType.add(3);
      noteTime.add(74);
      noteType.add(0);
      noteTime.add(78);
      noteType.add(0);
      noteTime.add(82);
      noteType.add(0);
      noteTime.add(92);
      noteType.add(0);
      noteTime.add(106);
      noteType.add(3);
      noteTime.add(109);
      noteType.add(1);
      noteTime.add(112);
      noteType.add(1);
      noteTime.add(132);
      noteType.add(2);
      noteTime.add(135);
      noteType.add(0);
      noteTime.add(138);
      noteType.add(0);
      noteTime.add(141);
      noteType.add(1);
      noteTime.add(144);
      noteType.add(2);
      noteTime.add(147);
      noteType.add(0);
      noteTime.add(150);
      noteType.add(1);
      noteTime.add(156);
      noteType.add(1);
      noteTime.add(166);
      noteType.add(0);
      noteTime.add(170);
      noteType.add(0);
      noteTime.add(174);
      noteType.add(0);
      noteTime.add(184);
      noteType.add(0);
      noteTime.add(198);
      noteType.add(3);
      noteTime.add(201);
      noteType.add(1);
      noteTime.add(204);
      noteType.add(1);
      noteTime.add(222);
      noteType.add(2);
      noteTime.add(225);
      noteType.add(3);
      noteTime.add(228);
      noteType.add(0);
      noteTime.add(231);
      noteType.add(0);
      noteTime.add(234);
      noteType.add(3);
      noteTime.add(237);
      noteType.add(2);
      noteTime.add(240);
      noteType.add(0);
      noteTime.add(243);
      noteType.add(1);
      noteTime.add(248);
      
      
      break;
    case 1:
      bpm = 126;
      
      noteType.add(0);
      noteTime.add(0);
      noteType.add(0);
      noteTime.add(4);
      noteType.add(0);
      noteTime.add(8);
      noteType.add(0);
      noteTime.add(12);
      noteType.add(3);
      noteTime.add(18);
      noteType.add(1);
      noteTime.add(21);
      noteType.add(2);
      noteTime.add(24);
      noteType.add(2);
      noteTime.add(27);
      noteType.add(2);
      noteTime.add(31);
      noteType.add(2);
      noteTime.add(35);
      noteType.add(3);
      noteTime.add(39);
      noteType.add(3);
      noteTime.add(42);

      break;
  }
}

void playSong(){
  if(frame % (bpm / 4) == 0){
    switch(songChosen){
      // California Gurls
      case 0:
        if(beat == 0){
          californiaGurls.play();
        }
        break;
      // Absolute Territory
      case 1:
        if(beat == 0){
          absoluteTerritory.play();
        }
        break;
    } 
    if(health < 100){
      health += 2;
    }
    beat += 1;
  }
  
  for(int i = 0; i < noteType.size(); i++){
    if(((noteTime.get(i) * 5 - frame) + (bpm * 2)) * 10 < -150){
      missedFrame = 10;
      health -= 25;
      noteType.remove(i);
      noteTime.remove(i);
    }
  }
  
  background(100);
  if(missedFrame > 0){
    stroke(100,100,100, missedFrame * 20);
    fill(missedFrame * 20,0,0, missedFrame * 5);
    ellipse(300,450,400,400);
    missedFrame -=1;
  }
  if(hitFrame > 0){
    stroke(100,100,100, hitFrame * 20);
    fill(0,100,0, hitFrame * 5);
    ellipse(300,450,400,400);
    hitFrame -=1;
  }
  displayAndParticles();
  fill(255,100,100);
  rect(0,0,health * 6,20);
  frame += 1;
  //checks every frame 
  if(health <= 0){
    reset();
  }
}

// the 4 lines under the circles
void drawLines(){
  stroke(25);
  strokeWeight(6);
  line(90, 100, 90, 900);
  line(230, 100, 230, 900);
  line(370, 100, 370, 900);
  line(510, 100, 510, 900);
}

void displayAndParticles(){
  // making the bg particles move
  moveParticles();
  //let there be light!
  drawParticles();
  drawLines();
  displayNotes();
  hitParticleMoveAndDisplay();
}

void displayNotes(){
  stroke(25);
  // hit placement (as in circles showing where the player can hit the notes)
  // left
  fill(150 + (int(leftPressed) * 50), 100, 100);
  ellipse(90, 100, 100, 100);
  // up
  fill(100, 150 + (int(upPressed) * 50), 100);
  ellipse(370, 100, 100, 100);
  // down
  fill(150 + (int(downPressed) * 50), 150 + (int(downPressed) * 50), 100);
  ellipse(230, 100, 100, 100);
  // right
  fill(100, 100, 150 + (int(rightPressed) * 50));
  ellipse(510, 100, 100, 100);
  
  //displaying the notes to hit
  for(int i = 0; i < noteType.size(); i++){
    // if statements are to figure out which direction the note is facing
    // up
    fill(0, 150, 0);
    if(noteType.get(i) == 0){
      // draws a circle following the track tied to its directon, to the speed of the song
      // starts by positioning the note on when its supposed to be played, followed by multiplying it by 50 to properly space out the notes, then subtracting frame to move it up, and multiplying frame by 10 to get to the correct speed.
      // adding 200 to fix the offset, then adding two bars to give some room before the song starts (bpm (a bar) * 20 (one bar being 10))
      // I could multiply the whole thing by 10 to make it easier to read but I think it's fine as is
      ellipse(370, (noteTime.get(i) * 50 - frame * 10) + 200 + (bpm * 20), 90, 90);
    }
    // down
    fill(150, 150, 0);
    if(noteType.get(i) == 1){
      ellipse(230, (noteTime.get(i) * 50 - frame * 10) + 200 + (bpm * 20), 90, 90);
    }
    // left
    fill(150, 0, 0);
    if(noteType.get(i) == 2){
      ellipse(90, (noteTime.get(i) * 50 - frame * 10) + 200 + (bpm * 20), 90, 90);
    }
    // right
    fill(0, 0, 150);
    if(noteType.get(i) == 3){
      ellipse(510, (noteTime.get(i) * 50 - frame * 10) + 200 + (bpm * 20), 90, 90);
    }
  }
}
