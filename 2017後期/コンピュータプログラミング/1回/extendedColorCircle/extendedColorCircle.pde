int Center_X;//カンバスの中心のX座標
int Center_Y;//カンバスの中心のY座標
float Circle_Radius;//円の半径
final int Circle_N=300;//円は合計何個あるか？
int Pos=0;//今何個目の円か？
float Hue;//色指定用変数
void setup() {
  size(1000, 1000);
  background(#ffffff);
  fill(#000000);
  colorMode(HSB,360,100,100);
  Center_X=width/2;
  Center_Y=height/2;
  Circle_Radius=min(width, height)*0.45;//width,heightのうち小さい方の値を取得
}

void draw() {
  int Ellipse_R;//円の半径
  int Distance;//カンバス中心からの円までの直線距離
  float deg=360*Pos/Circle_N;//360度/N=円一つあたりの角度→*今の円の数
  float Radian=radians(deg);

  fill(Hue,100,100);//色指定
  float Ellipse_X=Center_X+cos(Radian)*Circle_Radius;//円の中心のX座標//円のX座標指定(キャスト)
  float Ellipse_Y=Center_X+sin(Radian)*Circle_Radius;//円の中心のY座標//円のY座標指定(キャスト)
  ellipse(Ellipse_X, Ellipse_Y, 10, 10);
  Pos=(Pos+1)%Circle_N;//Posの数取得
  Hue=int(Hue+1000/Circle_N*0.5)%360;//色関数指定
  print("TEST");
}