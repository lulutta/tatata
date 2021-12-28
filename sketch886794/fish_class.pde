
class Fish {
  float hx, hy, hr, dhy, hl, gr, hx2, hy2, hr2, dhy2, first, trm;
  float dhx, bhx, hby, dhx2, htr2, hl2, rgf, ggf, bgf, fs, i, xv, yv;

  Fish(float _i, float _rgf, float _ggf, float _bgf, float _fs) {
    i = _i;
    rgf = _rgf;
    ggf = _ggf;
    bgf = _bgf;
    fs  = _fs;
    hl = 1-i/nl;
    hr = (30*pow(hl, 3)-58.5*sq(hl)+28*hl+.92)*fs/2;
    dhy = (10*pow(hl, 3)-11*sq(hl))*fs; 
    gr = 220-100*hl;
    if (i == nl-1) first = 1;   
    if (hl > .775) {
      dhx = (22*sq(hl)-30*hl+10)*fs;
      if (i==0) {
        trm = 0;
        hr = 0;
      } else {
        trm = (-86.7*sq(hl)+153.2*hl-66)*fs/2;
      }
    }  
    hr2 = r2; 
    dhy2 = dy2; 
    dhx2 = dx2; 
    htr2 = tr2;  
    r2 = hr; 
    dy2 = dhy; 
    dx2 = dhx; 
    tr2 = trm;
  }

  void update(float xv, float yv) {
    bhx = bx; 
    hby = by; 
    bx = hx; 
    by = hy; 
    if (first == 1) {
      hx = (sp*xv+hx)/(sp+1);
      hy = (sp*yv+hy)/(sp+1);
    } else {
      hx = bhx;
      hy = hby;
    }   
    hx2 = x3; 
    hy2 = y3; 
    x3 = hx; 
    y3 = hy;
  }

  void swim() {
    fill(gr/rgf, gr/ggf, gr/bgf); 
    stroke(gr-75); 
    strokeWeight(0);
    if (hl <= .775) {
      ellipse(hx, hy-dhy, hr*2, hr*2);   
      if (hl > .3 & hl <= .4) { 
        rotate(pi/4);
        a = hx-hr;  
        b = hy+hr*.4;
        ellipse(sqrt(sq(a)+sq(b))*sin(pi/4+atan(a/b)),
        sqrt(sq(a)+sq(b))*cos(pi/4+atan(a/b)), fs*(hl-.3)*15, fs*(hl-.3)*40); 
        a = hx+hr;
        ellipse(sqrt(sq(a)+sq(b))*sin(pi/4+atan(a/b)), sqrt(sq(a)+sq(b))*cos(pi/4+atan(a/b)),
        fs*(hl-.3)*40, fs*(hl-.3)*15); 
        rotate(-pi/4);
      }
      fill(gr+25); 
      strokeWeight(0);
      stroke(gr+25);
      beginShape(); 
      if (first != 1) vertex(hx2+cos(pi/6)*hr2, hy2-dhy2+sin(pi/6)*hr2);
      for (float i = pi/6; i <= 5*pi/6; i = i+pi/15) vertex(hx+cos(i)*hr, hy-dhy+sin(i)*hr);
      vertex(hx+cos(5*pi/6)*hr, hy-dhy+sin(5*pi/6)*hr);
      if (first != 1) vertex(hx2+cos(5*pi/6)*hr2, hy2-dhy2+sin(5*pi/6)*hr2);
      vertex(hx, hy-dhy+hr/3);
      endShape(CLOSE);
    } else {      
      for (int i = 1; i >= -1; i -= 2) {
        beginShape();
        vertex(hx+i*dhx, hy-dhy+hr); 
        vertex(hx2+i*dhx2, hy2-dhy2+hr2);
        vertex(hx2+i*dhx2, hy2-dhy2-hr2);
        vertex(hx+i*dhx, hy-dhy-hr);
        endShape(CLOSE);
        beginShape();
        vertex(hx+i*dhx, hy-dhy+hr); 
        vertex(hx+i*dhx-trm, hy-dhy); 
        vertex(hx+i*dhx, hy-dhy-hr);
        vertex(hx+i*dhx+trm, hy-dhy); 
        endShape(CLOSE);
        beginShape();
        vertex(hx+i*dhx-trm, hy-dhy);
        vertex(hx2+i*dhx2-htr2, hy2-dhy2); 
        vertex(hx2+i*dhx2+htr2, hy2-dhy2);
        vertex(hx+i*dhx+trm, hy-dhy);
        endShape(CLOSE);
      }
    }
  }
}