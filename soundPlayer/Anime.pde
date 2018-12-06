class Anime {
  int shapesNum = 100;
  Shape[] shapes = new Shape[shapesNum];
  int songNum = 3;
  color[][] colorSet = new color[songNum+1][3];
  int songIndex = songNum;
  String[] songTitle = {"U.S.A.", "新宝島", "We Are the Champions", ""};
  String[] singerName = {"DA PUMP", "サカナクション", "Queen", "Touch the figure!"};
  PImage[] songImage = new PImage[songNum];
  PFont font;

  Anime() {
    textAlign(CENTER, CENTER);
    imageMode(CENTER);
    rectMode(CENTER);

    for (int i = 0; i < shapes.length; i++) {
      shapes[i] = new Shape();
    }

    // usa
    colorSet[0][0] = color(0, 0, 0);
    colorSet[0][1] = color(222, 4, 229);
    colorSet[0][2] = color(10, 113, 221);

    // shin-takarajima
    colorSet[1][0] = color(58, 77, 90);
    colorSet[1][1] = color(232, 184, 83);
    colorSet[1][2] = color(240, 240, 240);

    // we are the champions
    colorSet[2][0] = color(220, 182, 63);
    colorSet[2][1] = color(109, 41, 35);
    colorSet[2][2] = color(225, 220, 233);

    // wait
    colorSet[3][0] = color(180);
    colorSet[3][1] = color(200);
    colorSet[3][2] = color(230);

    songImage[0] = loadImage("./Assets/j_0.jpg");
    songImage[1] = loadImage("./Assets/j_1.jpg");
    songImage[2] = loadImage("./Assets/j_2.jpg");

    String[] fontList;
    fontList= PFont.list();
    font = createFont(fontList[245], 80);
    textFont(font);
  }

  void display() {
    background(colorSet[songIndex][0]);
    for (int j = 0; j < shapes.length; j++) {
      shapes[j].display();
      shapes[j].move();
    }

    noStroke();
    fill(255, 200);
    rect(width/2, height/2, width*0.75, height*0.9, 10);

    if (songIndex < songNum) {
      image(songImage[songIndex], width/2, height/2+100);
    }

    fill(0);
    noStroke();
    textSize(80);
    text(songTitle[songIndex], width/2, height/7);
    textSize(55);
    text(singerName[songIndex], width/2, height/7+100);
  }

  void setSongIndex(int tmpIndex) {
    songIndex = tmpIndex;
    for (int k = 0; k < shapes.length; k++) {
      shapes[k].changeColor(colorSet[songIndex][1], colorSet[songIndex][2]);
    }
  }
}

class Shape {
  int vertexNum = 6;
  float x = random(width);
  float y = random(height);
  float r = random(20, 50);
  float speed = random(1, 3);
  color shapeColorA = (100);
  color shapeColorB = (200);
  color c;
  boolean isFill = false;

  Shape() {
    isFill = random(10) < 5 ? true : false;
    c = random(10) < 5 ? shapeColorA : shapeColorB;
  }

  void display() {
    if (isFill) {
      noStroke();
      fill(c);
    } else {
      strokeWeight(5);
      stroke(c);
      noFill();
    }

    pushMatrix();
    translate(x, y);
    rotate(radians(90));

    beginShape();
    for (int i = 0; i < vertexNum; i++) {
      vertex(r * cos(radians(360 * i/vertexNum)), r * sin(radians(360 * i/vertexNum)));
    }
    endShape(CLOSE);

    popMatrix();
  }

  void move() {
    y += speed;
    if (y > height + r) {
      y = - r;
    }
  }

  void changeColor(color tmpColorA, color tmpColorB) {
    c = random(10) < 5 ? tmpColorA : tmpColorB;
  }
}
