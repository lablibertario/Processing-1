final float vx0min = -7;            // vxの初期値の下限
final float vx0max = 5;             // vxの初期値の上限
final float vy0min = 4;             // vyの初期値の下限
final float vy0max = 15;            // vyの初期値の上限
final float fps = 60;               // 1秒間あたりのフレーム数
final float gravity = 9.8 / fps;    // 1フレームあたりの重力加速度
final float elas = 0.98;            // 反発係数
final float d = 40;                 // ボールの直径
final float hueMax = 360.0;         // 色相の最大値
Ball Ball0;
Ball Ball1;
Ball Ball2;
Ball Ball3;
Ball Ball4;
Ball Ball5;

void setup() {
  frameRate(fps);
  size(480, 480);
  noStroke();
  colorMode(HSB, hueMax, 100, 100);
  fill(0, 0, 0);
  
  Ball0=new Ball();
  Ball1=new Ball();
  Ball2=new Ball();
  Ball3=new Ball();
  Ball4=new Ball();
  Ball5=new Ball();
  
}

void draw() {
  background(0, 0, 100);
  Ball0.move();
  Ball1.move();
  Ball2.move();
  Ball3.move();
  Ball4.move();
  Ball5.move();
}

class Ball {
  float X  =random(d / 2, width - d / 2);;// ボールの中心のx座標
  float Y  =random(d / 2, height / 5);;// ボールの中心のy座標
  float VX =random(vx0min, vx0max);;// ボールの速度のx成分
  float VY =random(vy0min, vy0max);;// ボールの速度のy成分
  boolean isNeighbor(float x1, float y1, float x2, float y2, float distance) {
  float dx = x1 - x2;
  float dy = y1 - y2;
  return dx * dx + dy * dy < distance * distance;
}
  void move() {
    if (isNeighbor(this.X, this.Y, mouseX, mouseY, d / 2)) {
    fill(0, 100, 100);
    catchBall();
  } else {
    fill(180, 100, 100);
    boundBall();
  }
    draw(VX,VY);
    ellipse(this.X, this.Y, d, d);
  }
  void boundBall(){
    X+= VX;          // ボールが速度ぶん移動する
    VY += gravity;           // 速度のy成分に重力加速度を加算する
    Y  += VY;          // ボールが速度ぶん移動する
    if (X < d / 2) {
      VX = - VX * elas;
      X = d / 2;
    } else if (X > width - d / 2) {
      VX = - VX  * elas;
      X = width - d / 2;
    }
    if (Y > height - d / 2) {
      VY = - VY * elas;
      Y = height - d / 2;
    } else if (Y < d / 2) {
      VY = - VY * elas;
      Y = d / 2;
    }
  }
  void catchBall(){
    X+=(mouseX-pmouseX);
    Y+=(mouseY-pmouseY);
    VX=(mouseX-pmouseX);
    VY=(mouseY-pmouseY);
  }
  void draw(float vx, float vy) {
    fill(((sqrt(vx * vx + vy * vy) * 16) % hueMax), 100, 100);
  }
}