import oscP5.*;
import netP5.*;
import ddf.minim.*;

Minim minim;
AudioPlayer[] songs = new AudioPlayer[3];

OscP5 oscP5;
String message = "";
String oldMessage = "";

Anime myAnime;

void setup() {
  fullScreen(2);

  oscP5 = new OscP5(this, 6000);

  minim = new Minim(this);
  songs[0] = minim.loadFile("./Assets/s_0.mp3");
  songs[1] = minim.loadFile("./Assets/s_1.mp3");
  songs[2] = minim.loadFile("./Assets/s_2.mp3");

  myAnime = new Anime();
}

void draw() {
  myAnime.display();
}

void oscEvent(OscMessage msg) {
  msg.print();
  message = msg.addrPattern();
  for (int i=0; i < msg.arguments().length; i++) {
    message = ", "+msg.arguments()[i];
  }

  if (!oldMessage.equals(message)) {
    
    if (message.equals("usa")) {      
      stopOtherSongs(0);
      songs[0].cue(65800);
      songs[0].play();
      myAnime.setSongIndex(0);
    } 
    if (message.equals("shinTakarajima")) {
      stopOtherSongs(1);
      //songs[1].cue(81000);
      songs[1].play();
      myAnime.setSongIndex(1);
    }
    if (message.equals("weAreTheChampions")) {
      stopOtherSongs(2);
      songs[2].cue(34500);
      songs[2].play();
      myAnime.setSongIndex(2);
    }
    
    oldMessage = message;
  }
}

void stopOtherSongs(int nowPlayingIndex) {
  for (int i = 0; i < songs.length; i++) {
    if (i != nowPlayingIndex && songs[i].isPlaying()) {
      songs[i].pause();
      songs[i].rewind();
    }
  }
}

void stop() {
  minim.stop();
  super.stop();
}
