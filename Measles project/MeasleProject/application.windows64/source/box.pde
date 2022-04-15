void measlesBox() {
  measlesDiameter = random(height*1/30, height*1/15);
  measlesBoxX = random(faceX+measlesDiameter/2, faceX+faceDiameter-measlesDiameter/2);
  measlesBoxY = random(faceY+measlesDiameter/2, faceY+faceDiameter-measlesDiameter/2);
  //
  fill(measlesColor);
  ellipse(measlesBoxX, measlesBoxY, measlesDiameter, measlesDiameter);
  fill(white);
}
