void measles() {
//Measle
 if (measlesOn == true) {
 //
float measleDiameter = random(smallerDisplayDimension*1/100 , smallerDisplayDimension*1/25); //Range of measle size: small=*1/100, large=4xbigger (*1/25)
float measleRadius = measleDiameter*1/2;
println (measleRadius);
float measleX = random( rectFaceX+measleRadius, ( ( rectFaceX+rectFaceWidth) - measleRadius) );
float measleY = random( rectFaceY+measleRadius, ( ( rectFaceY+rectFaceHeight) - measleRadius) );
Boolean nightMode=false; //Note: IF-ELSE similar to ternary operator
//color red=#FF0000, measleColour=red, whiteReset=#000000;
color measleColour = ( nightMode==false ) ? color ( 255, random(0,50), random(120) ) : color ( 255, random(0,50), 0 ) ; //ternary operator for day:night
color whiteReset=#FFFFFF; // Note: need ranger here too
//
float measleRectX = measleX-measleDiameter*1/2;
float measleRectY = measleY-measleDiameter*1/2;
float measleWidth = measleDiameter;
float measleHeight = measleDiameter;
//rect( measleRectX, measleRectY, measleWidth, measleHeight);
//random values given other variables (similar to button code)
noStroke(); //Shape outline
fill(measleColour);
ellipse( measleX, measleY, measleDiameter, measleDiameter );
stroke(reset);
fill(whiteReset); //reset to first colour (i.e blackReset
 }
}
