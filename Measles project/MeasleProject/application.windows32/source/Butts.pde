String buttonText= "Let's go :)";
String button2Text= "Clear";
String button3Text= "Cheerio! ";

void title() {
  titleFont = createFont ("BodoniMTBlack-Italic-48", 55);
  fill(black);
  textFont(titleFont, 70);
  text(title, titleX, titleY, titleWidth, titleHeight);
  fill(white);
}

void buttonFormat() {
  fill(black);
  textAlign (CENTER, CENTER);
  textFont(titleFont, 50);
}

void button1text() {
  buttonFormat();
  text(buttonText, buttonX, buttonY, buttonWidth, buttonHeight);
  fill(white);
}

void button2text() {
  buttonFormat();
  text(button2Text, button2X, button2Y, buttonWidth, buttonHeight);
  fill(white);
}

void button3text() {
  buttonFormat();
  text(button3Text, button3X, button3Y, buttonWidth, buttonHeight);
  fill(white);}
