//Global Variables

color red = #F01313, white = #FFFFFF, blue = #63B5EA,cream=#FFEFCE, pink = #F5C1E0, darkPink = #FC82CC, lightgreen=#92E5A0 ;
color buttonColour, measlesColor = red; 
float measlesDiameter, measlesBoxX, measlesBoxY;
float measles3X, measles3Y, measles3X2, measles3Y2, measles4X, measles4Y, measles4X2, measles4Y2, measles5X, measles5Y;
int buttonX, buttonY, buttonWidth, buttonHeight, button2X, button2Y, button3X, button3Y;
Boolean measlesOn=false, eyesOn=false;
PVector leftEye;
float rectXPic1, rectYPic1, rectWidthPic1, rectHeightPic1;
PImage pic1;
color black=#000000;
float imageWidthRatioPic1=0.0, imageHeightRatioPic1=0.0;
Boolean widthPic1Larger=false, heightPic1Larger=false;
int largerPic1Dimension, smallerPic1Dimension;
float pic1WidthAdjusted, pic1HeightAdjusted;
PVector rightEye;
int reset, smallerDisplayDimension, mouthOpen;
float rectFaceX, rectFaceY, rectFaceWidth, rectFaceHeight;
float faceX, faceY, faceDiameter;
float leftEyeX, leftEyeY, rightEyeX, rightEyeY, eyeDiameter;
float mouthX1, mouthY1, mouthX2, mouthY2;
float xNose1, yNose1, xNose2, yNose2, xNose3, yNose3;
String title = "Bawk! Chicken Pox.";
float titleX, titleY, titleWidth, titleHeight;
PFont titleFont;
color green=#144607, resetDefaultInk=#FFFFFF;
float angleRotate;


//
//float rectXPic1, rectYPic1, rectWidthPic1, rectHeightPic1;
//PImage pic1;


//
void setup() 
{
//
  buttonX = width*43/50;
  buttonY = height*1/9;
  button2X = buttonX;
  button2Y = height*19/50;
  button3X = buttonX;
  button3Y = height*13/20;
  buttonWidth = height*1/6;
  buttonHeight = height*1/8;
 background(#96F0ED);
 //

  //
   leftEye = new PVector(displayWidth*.38, displayHeight*.28);
 rightEye = new PVector(displayWidth*.57, displayHeight*.28);
//
//Display Geometry, Display orientation: landscape, portrait, or square
  fullScreen(); //size (500, 600);  //displayWidth & displayHeight
  println(displayWidth, displayHeight);
  //Population
  titleX = displayWidth*1/5;
  titleY = displayHeight*1/30;
  titleWidth = displayWidth*3/5; //Rect ends at 4/5's of width
  titleHeight = displayHeight*1/10; //Rect ends at 2/10's of height
  //
  //Fonts from OS (Operating System)
  //String[] fontList = PFont.list(); //To list all fonts available on OS
  //printArray(fontList); //For listing all possible fonts to choose from, then createFont
  titleFont = createFont("Baskerville old face", 58); //Verify the font exists in ProcessingJava
  // Tools / Create Font / Find Font / Do not press "OK", known bug
  //
  
//

  //Display Geometry
fullScreen(); //size(); displayWidth, displayHeight
//Landscape, not square or portrait
println (width, height, displayWidth, displayHeight); //Verification of values
int appWidth = width, appHeight = height; //Swap with displayWidth, displayHeight for testing
println(appWidth, appHeight);

//
//Display Orientation: a few comparisons for IFs
//Computer tells us the orientation, go
String orientation = ( displayWidth >= displayHeight ) ? "Landscape or Square": "Portrait"; 
println("Display Orientation:", orientation); //Verify Veriables
if ( orientation=="Portrait" ) println("Turn your phun");

if ( orientation=="Landscape or Square") 
{
  //Empty IF
} else { 
  println("Turn your phun");
} //FUN 
//
//Variable Population: notice using appWidth & appHeight to move between size() & fullScreen()
smallerDisplayDimension = appHeight; //ALWAYS in Landscape
reset = smallerDisplayDimension / smallerDisplayDimension; //returns "1"
rectFaceX = (appWidth*1/2) - (smallerDisplayDimension*1/2);
rectFaceY =appHeight*0;
rectFaceWidth = smallerDisplayDimension; //Square Shape
rectFaceHeight = smallerDisplayDimension; //Square Shape
faceX = appWidth*1/2;
faceY = appHeight*1/2;
faceDiameter = smallerDisplayDimension;
leftEyeX = appWidth*1.5/4;
leftEyeY = appHeight*1/4;
rightEyeX = appWidth*2.5/4;
rightEyeY = leftEyeY; //Best Practice: change one line of code
eyeDiameter = smallerDisplayDimension*1/4;
mouthX1 = leftEyeX;
mouthY1 = appHeight*3/4;
mouthX2 = rightEyeX;
mouthY2 = mouthY1;
mouthOpen = smallerDisplayDimension*1/4;
xNose1 = faceX;
yNose1 = leftEyeY;
xNose2 = faceX - leftEyeY*1/2;
yNose2 = faceY;
xNose3 = faceX + leftEyeY*1/2;
yNose3 = faceY ;
//
//Face: Circle = Inscribing a Circle in a Square
//Center a circle on display orientation
//rect(rectFaceX, rectFaceY, rectFaceWidth, rectFaceHeight);
fill(#FFF5F0);
ellipse(faceX, faceY, faceDiameter, faceDiameter);

 pic1 = loadImage("190726-fever-guide-gif.jpg"); //Dimensions: width 1920, height 1280
   int pic1Width = 606;
   int pic1Height = 3000;
   //Choosing larger image dimension
if (pic1Width >= pic1Height) { //ID Larger Dimension: Landscape and Square
  largerPic1Dimension = pic1Width;
  smallerPic1Dimension = pic1Height;
  widthPic1Larger = true;
} else { //ID Larger Dimension: Portrait
  largerPic1Dimension = pic1Height;
  smallerPic1Dimension = pic1Width;
  heightPic1Larger = true;
} //End pic1 larger dimension ID
println (smallerPic1Dimension, largerPic1Dimension);
//Calculating Aspect Ratios
//Note:single line IF's can be summarized to IF-ELSE or IFELSEIF-ELSE
if (widthPic1Larger == true) imageWidthRatioPic1 = float(largerPic1Dimension) / float(largerPic1Dimension);
if (widthPic1Larger == true ) imageHeightRatioPic1 = float(smallerPic1Dimension) / float(largerPic1Dimension);
if ( heightPic1Larger == true) imageWidthRatioPic1 = float(smallerPic1Dimension) / float(largerPic1Dimension);
if ( heightPic1Larger == true) imageHeightRatioPic1 = float(largerPic1Dimension) / float(largerPic1Dimension);
 println (imageWidthRatioPic1, imageHeightRatioPic1);
 //Using ratios to change the image, width, and height properties of rectangle
rectXPic1 = displayWidth*0;
rectYPic1 = displayHeight*1/1090;
rectWidthPic1 = displayWidth*1/2;
rectHeightPic1 = displayHeight*1/2;
pic1WidthAdjusted = rectWidthPic1 * imageWidthRatioPic1;
pic1HeightAdjusted = rectHeightPic1 * imageHeightRatioPic1;
println(pic1Width, pic1Height);
println( pic1WidthAdjusted, pic1HeightAdjusted);
//
} //End setup
void draw() {

  button1();
  button1text();
  button2();
  button2text();
  button3();
  button3text();
  face();

  //rect(rectXPic1, rectYPic1, rectWidthPic1, rectHeightPic1); 
image(pic1, rectXPic1+(rectXPic1 * 0.48), rectYPic1+(6), pic1WidthAdjusted, pic1HeightAdjusted);
strokeWeight(0);
  stroke(#FFF5F0);

  pushMatrix();
  float angle1 = radians(45);
  translate(100, 180);
  rotate(angle1);
  fill(#000000);
  text("101°F",490, 300);
  popMatrix();
  // 


  PVector mouseVector = new PVector(mouseX, mouseY);

  PVector leftPupil = leftEye.copy().add(mouseVector.copy().sub(leftEye).setMag(30)) ;
  PVector rightPupil = rightEye.copy().add(mouseVector.copy().sub(rightEye).setMag(30));
 //


//
 //smooth();
//noStroke();
//fill(#D80B0B);
//beginShape();
//vertex(50, 15);
//bezierVertex(50, -5, 10, 5, 50, 40);
//vertex(50, 15);
//bezierVertex(50, -5, 10, 5, 50, 40);
//endShape();
//

//

measles();
//

////Left Eye
//rect(leftEyeX-eyeDiameter*1/2, leftEyeY-eyeDiameter*1/2, eyeDiameter, eyeDiameter);
ellipse(leftEyeX, leftEyeY, eyeDiameter, eyeDiameter);
//
//Right Eye
//rect(rightEyeX-eyeDiameter*1/2, rightEyeY-eyeDiameter*1/2, eyeDiameter, eyeDiameter);
ellipse(rightEyeX, rightEyeY, eyeDiameter, eyeDiameter);
//
 //eyes
  fill(#0F6719);
  ellipse(leftEye.x, leftEye.y, 300, 300);
  ellipse(rightEye.x+150, rightEye.y+0, 300, 300);
  fill(0);
  ellipse(leftPupil.x, leftPupil.y, 200, 200);
  ellipse(rightPupil.x+150, rightPupil.y+10, 200, 200);
  //
    

//Nose
fill(#FFDF24);

//rect(xNose2, yNose1, xNose3-xNose2, yNose3-yNose1);
triangle(xNose1, yNose1, xNose2, yNose2, xNose3, yNose3);


//
fill(#F04D5B);
 arc(1370, 1335, 1050, 1200, 0, 9.14);
//Mouth
fill(#F04D5B);
int mouthWidth = int (mouthX2 - mouthX1);
int mouthHeight = mouthOpen;
//rect(mouthX1-mouthOpen*1/2, mouthY1-mouthOpen*1/2, mouthWidth+mouthOpen, mouthHeight);
strokeWeight(mouthOpen); //testing: 100=400/4 mouthOpen=height*1/4
line(mouthX1, mouthY1, mouthX2, mouthY2);
strokeWeight(reset); //reset to 1 pixel
//

fill(#E38ECE);
 arc(1370, 1335, 1050, 900, 0, 3.14);
 
 //Layout our text space and typographical features
 fill(#FFF5F0);
   reset();
fill(#E38ECE);

  //

  rect(titleX, titleY, titleWidth, titleHeight);
 fill(green); //Ink, hexidecimal copied from Color Selector
 textAlign(CENTER, CENTER); //Align X&Y, see Processing.org / Reference
 //Values: [ LEFT | CENTER | RIGHT ] & [ TOP | CENTER | BOTTOM | BASEMENT ]
 textFont(titleFont, 150); //Change the number until it fits
 text(title, titleX, titleY, titleWidth, titleHeight);
 fill(resetDefaultInk);
  

} //End draw
//
 void keyPressed() 
 {
   if (key == 'q' || key == 'Q') exit();
 } //End keypressed
//
 void mousePressed() 
 {
     eyesOn = false;
    measlesOn = false;
   if ( mouseX>buttonX && mouseX<buttonX+buttonWidth && mouseY>buttonY && mouseY<buttonY+buttonHeight) measlesOn = true;
  if ( mouseX>button2X && mouseX<button2X+buttonWidth && mouseY>button2Y && mouseY<button2Y+buttonHeight) measlesOn = false;
  if ( mouseX>button3X && mouseX<button3X+buttonWidth && mouseY>button3Y && mouseY<button3Y+buttonHeight) exit();
 } //End mousePressed
//
//End Main Program
