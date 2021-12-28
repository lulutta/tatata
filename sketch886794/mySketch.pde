/* @pjs preload="1.png"; */
/* @pjs preload="1.gif"; */

PImage as, bs, cs;

int nl = 30;  
Fish[] fish_1 = new Fish[nl];
Fish[] fish_2 = new Fish[nl];
Fish[] fish_3 = new Fish[nl];
Fish[] fish_4 = new Fish[nl];
Fish[] fish_5 = new Fish[nl];
Fish[] fish_6 = new Fish[nl];

float sp = .025;
float r = 125; 
float pi = 3.145;
float e, bx, by, x3, y3, x4, y4, x5, y5, x2, y2, x1, y1, r2;
float dy2, dx2, fs, tr2, a, b, w, h, a2, b2, t, ct, tt;
int ih, cnt, tel;
float asf = -1;
boolean ft = true, left, fst = true;

void setup() {
  size(1200, 900);
  background(#17C0CE);
	frameRate(40);
  as = loadImage("1.png");
  bs = loadImage("2.gif");
  // cs = loadImage("aquarium3.png");
  w = width;
  e = w+200;
  h = height;
  x6 = -1200;

  for (int i = nl-1; i >= 0; i -= 1) fish_1[i] = new Fish(i, 1.5, 3, 3, 18);
  for (int i = nl-1; i >= 0; i -= 1) fish_2[i] = new Fish(i, 1.2, 1.8, 3, 10);
  for (int i = nl-1; i >= 0; i -= 1) fish_3[i] = new Fish(i, 3, 3, 1, 20);
  for (int i = nl-1; i >= 0; i -= 1) fish_4[i] = new Fish(i, 1, 2, 3, 10);
  for (int i = nl-1; i >= 0; i -= 1) fish_5[i] = new Fish(i, 1, 3, 1, 6);
  for (int i = nl-1; i >= 0; i -= 1) fish_6[i] = new Fish(i, 3, 3, 1.5, 30);
  
  noCursor();
  textAlign(CENTER);
  st = millis();
}

void draw() {
  background(as);
	// image(cs, 0, 0, width,height);
  strokeWeight(0);   
  x2 = mouseX;
  y2 = mouseY;
  t += 0.009;

  x3 = w/2+r*(cos(t)-pow(cos(5*t), 3));
  y3 = h/2-r*(sin(t)-pow(sin(5*t), 3));
  x4 = w/2+r*(cos(t)-pow(cos(7*t), 3));
  y4 = h/2-r*(sin(t)-pow(sin(7*t), 3));
  x5 = e/2+r*(cos(t)-pow(cos(2*t), 3));
  y5 = h/2-r*(sin(t)-pow(sin(3*t), 3));

  if (fst) {
    if (millis()-st > 10000) {
      fst = false;
      left = false;
    }
  }  
  if (left && !fst) x6 -= 20;
  if (!left && !fst) x6 += 20;
  y6 = sin(asf)*100.0+height/3;
  asf += .3; 
  if (x6 >  2*width ) {
    left = true;
    st = millis();
  }
  if (x6 <  -width && millis()-st > 20000) left = false;

  for (int i = nl-1; i >= 0; i -= 1) fish_2[i].update(x3, y3);
  for (int i = 0; i < nl; i++)       fish_2[i].swim(); 
  for (int i = nl-1; i >= 0; i -= 1) fish_5[i].update(x5, y5); 
  for (int i = 0; i < nl; i++)       fish_5[i].swim();
  for (int i = nl-1; i >= 0; i -= 1) fish_4[i].update(x4, y4); 
  for (int i = 0; i < nl; i++)       fish_4[i].swim(); 
  for (int i = nl-1; i >= 0; i -= 1) fish_6[i].update(x6, y6); 
  for (int i = 0; i < nl; i++)       fish_6[i].swim(); 
  for (int i = nl-1; i >= 0; i -= 1) fish_1[i].update(x1, y1);
  for (int i = 0; i < nl; i++)       fish_1[i].swim();   
  for (int i = nl-1; i >= 0; i -= 1) fish_3[i].update(x2, y2);
  for (int i = 0; i < nl; i++)       fish_3[i].swim(); 
	
	image(bs, mouseX, mouseY);

  tel++;
  if (tel > 25) { 
    x1 = x2-50;
    y1 = y2-50;
    tel = 0;
  }

  if (cnt < 60) {
    background(as); 
    textSize(60);
    text("Loading...", width/2, height/2);
  } else {
    ft = false;
  }

  if (ft) cnt++;
}
