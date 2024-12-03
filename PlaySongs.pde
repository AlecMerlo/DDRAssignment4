void setupSong(){
  noteTime.clear();
  noteType.clear();
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
      noteTime.add(130);
      noteType.add(2);
      noteTime.add(133);
      noteType.add(0);
      noteTime.add(136);
      noteType.add(0);
      noteTime.add(139);
      noteType.add(1);
      noteTime.add(142);
      noteType.add(2);
      noteTime.add(145);
      noteType.add(0);
      noteTime.add(148);
      noteType.add(1);
      noteTime.add(154);
      
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
      noteTime.add(20);
      noteType.add(2);
      noteTime.add(22);
      noteType.add(2);
      noteTime.add(26);
      noteType.add(2);
      noteTime.add(30);
      noteType.add(2);
      noteTime.add(34);
      noteType.add(3);
      noteTime.add(40);
      noteType.add(3);
      noteTime.add(42);
      noteType.add(0);
      noteTime.add(44);
      noteType.add(0);
      noteTime.add(48);
      noteType.add(0);
      noteTime.add(52);
      noteType.add(0);
      noteTime.add(56);
      noteType.add(3);
      noteTime.add(60);
      noteType.add(1);
      noteTime.add(62);
      noteType.add(2);
      noteTime.add(64);

      break;
  }
}

void playSong(){
  if(frame % (bpm / 4) == 0){
    switch(songChosen){
      //California Gurls
      case 0:
        if(beat == 0){
          californiaGurls.play();
        }
        break;
      //Absolute Territory
      case 1:
        if(beat == 0){
          absoluteTerritory.play();
        }
        break;
    } 
    beat += 1;
  }
  
  for(int i = 0; i < noteType.size(); i++){
    if(((noteTime.get(i) * 5 - frame) + (bpm * 2)) * 10 < -150){
      noteType.remove(i);
      noteTime.remove(i);
    }
  }
  
  background(100);
  displayNotes();
  frame += 1;
}

void displayNotes(){
  //hit placement
  //left
  fill(150 + (int(leftPressed) * 50), 100, 100);
  ellipse(90, 100, 100, 100);
  //up
  fill(100, 150 + (int(upPressed) * 50), 100);
  ellipse(370, 100, 100, 100);
  //down
  fill(150 + (int(downPressed) * 50), 150 + (int(downPressed) * 50), 100);
  ellipse(230, 100, 100, 100);
  //right
  fill(100, 100, 150 + (int(rightPressed) * 50));
  ellipse(510, 100, 100, 100);
  
  for(int i = 0; i < noteType.size(); i++){
    //up
    fill(0, 150, 0);
    if(noteType.get(i) == 0){
      ellipse(370, ((noteTime.get(i) * 5 - frame) + 20 + (bpm * 2)) * 10, 90, 90);
    }
    //down
    fill(150, 150, 0);
    if(noteType.get(i) == 1){
      ellipse(230, ((noteTime.get(i) * 5 - frame) + 20 + (bpm * 2)) * 10, 90, 90);
    }
    //left
    fill(150, 0, 0);
    if(noteType.get(i) == 2){
      ellipse(90, ((noteTime.get(i) * 5 - frame) + 20 + (bpm * 2)) * 10, 90, 90);
    }
    //right
    fill(0, 0, 150);
    if(noteType.get(i) == 3){
      ellipse(510, ((noteTime.get(i) * 5 - frame) + 20 + (bpm * 2)) * 10, 90, 90);
    }
  }
}
