final int humanX0 = 50;                  // 人のx座標の初期値
final int dhumanX = 50;                  // 人の間隔
final int humanY0 = 300;                 // 人の列のy座標
final int humanBodyWidth = 20;           // 体の幅
final int faceDiameter = 30;             // 顔の直径
final int n = 7;                         // 人数
int Color;//色相

void setup() {
  size(400, 400);                  // ウィンドウのサイズ
  background(255, 255, 255);       // 背景色(白)
  noStroke();                      // 輪郭線を無効に
  colorMode(HSB, 360, 100, 100);   // カラーモードをHSBに

  int humanX = humanX0;
  for (int i = 0; i < n; i++) {
    int humanBodyHeight = (int)random(120, 160);// 胴体の長さ
    Color=(360/n)*i;
    drawHuman(humanX, humanY0, humanBodyHeight, Color);     // 人の描画
    humanX = humanX + dhumanX;
  }
}

/**
 *  人の形を描く(色相はランダム)
 *  @param x 人のx座標(体の中央軸)
 *  @param y 人のy座標(足元)
 *  @param bodyHeight 人の胴体の長さ
 */
void drawHuman(int x, int y, int bodyHeight, int Color) {
  fill(Color, 100, 100);                    // 色相引数
  ellipse(x, y - bodyHeight, faceDiameter, faceDiameter);                  // 顔
  rect(x - humanBodyWidth / 2, y - bodyHeight, humanBodyWidth, bodyHeight);    // 胴体
}