//<>// //<>// //<>//
////////////////////////////////////////////////////
//
//    W_UserInputLogger.pde 
//
//    
//
//    Created by: Daniel Cravens, October  2018
//
///////////////////////////////////////////////////,

////////////////
// GLOBAL VARIABLES
//////////////////
String uilOutputData, onData, offData;
boolean outputToggle;


class W_UserInputLogger extends Widget {
  Button submitButton;



  W_UserInputLogger(PApplet _parent) {
    super(_parent); //calls the parent CONSTRUCTOR method of Widget (DON'T REMOVE)
    super.dropdownWidth = 128;
    PFont font = createFont("arial", 20);

    outputToggle = false;  
    onData = new String("1");
    offData = new String("0");
    uilOutputData = offData;


    addDropdown("uilDropdown1", "On Mouse Click", Arrays.asList("Meditate|Focus", "Open|Closed", "0|1"), 2);

    //addDropdown("uilDropdown2", "Drop 2", Arrays.asList("C", "D", "E"), 1);
    //addDropdown("uilDropdown3", "Drop 3", Arrays.asList("F", "G", "H", "I"), 3);




    cp5_widget.addTextfield("Session Description")
      .setFont(font)
      .setFocus(false)
      .setColor(color(255, 0, 0))
      ;

    cp5_widget.addTextfield("Subject Name")
      .setFont(font)
      .setFocus(false)
      .setColor(color(255, 0, 0))
      ;

    cp5_widget.addTextfield("Session Objective")
      .setFont(font)
      .setFocus(false)
      .setColor(color(255, 0, 0))
      ;
    cp5_widget.addTextfield("Electrode Positions")
      .setFont(font)
      .setFocus(false)
      .setColor(color(255, 0, 0))
      ;

    submitButton = new Button((int)(x + 3), (int)(y + 3 - navHeight), 120, navHeight - 6, "submit", 12);
    submitButton.setCornerRoundess((int)(navHeight-6));
    submitButton.setFont(p6, 10);
    submitButton.setColorNotPressed(color(57, 128, 204));
    submitButton.textColorNotActive = color(255);
    submitButton.hasStroke(false);
    submitButton.setHelpText("Click this button to submit data to header");
  }

  void update() {
    super.update(); //calls the parent update() method of Widget (DON'T REMOVE)
    //put your code here...
  }

  void draw() {
    super.draw(); //calls the parent draw() method of Widget (DON'T REMOVE)
    //text(cp5_widget.get(Textfield.class, "input").getText(), 360, 130);
    //put your code here... //remember to refer to x,y,w,h which are the positioning variables of the Widget class
    pushStyle();

    cp5_widget.getController("Session Description").setPosition(x+10, y+10);
    cp5_widget.getController("Session Description").setSize(w-25, 40); 

    cp5_widget.getController("Session Objective").setPosition(x+10, y+110);
    cp5_widget.getController("Session Objective").setSize(w-25, 40);  

    cp5_widget.getController("Subject Name").setPosition(x+10, y+210);
    cp5_widget.getController("Subject Name").setSize(w-25, 40);

    cp5_widget.getController("Electrode Positions").setPosition(x+10, y+310);
    cp5_widget.getController("Electrode Positions").setSize(w-25, 40);

    submitButton.setPos((int)(x + 3), (int)(y + 3 - navHeight));  // write notes to file


    submitButton.draw();

    if (outputToggle) {            //  draw circle to illustrate whether toggle is on or off
      fill(color(0, 255, 0));
    } else {
      fill(color(255, 0, 0));
    }

    ellipse(x+w/2, y + h/4*3, w/4, w/4);

    popStyle();
  }

  void screenResized() {
    super.screenResized(); //calls the parent screenResized() method of Widget (DON'T REMOVE)

    //put your code here...
    //widgetTemplateButton.setPos(x + w/2 - widgetTemplateButton.but_dx/2, y + h/2 - widgetTemplateButton.but_dy/2);
  }

  void mousePressed() {
    super.mousePressed(); //calls the parent mousePressed() method of Widget (DON'T REMOVE)

    Textfield tfDesc = (Textfield) cp5_widget.getController("Session Description");
    Textfield tfObj = (Textfield) cp5_widget.getController("Session Objective");
    Textfield tfSubjN = (Textfield) cp5_widget.getController("Subject Name");
    Textfield tfEpos = (Textfield) cp5_widget.getController("Electrode Positions");

    if (submitButton.isMouseHere()) {
      submitButton.setIsActive(true);
    }
    if (tfDesc.isFocus() || tfObj.isFocus() || tfSubjN.isFocus()) {
      println("Disable Keyboard Shortcuts");
      controlPanel.isShortcutEnabled = false;
    }
  }

  void mouseReleased() {
    super.mouseReleased(); //calls the parent mouseReleased() method of Widget (DON'T REMOVE)

    Textfield tfDesc = (Textfield) cp5_widget.getController("Session Description");
    Textfield tfObj = (Textfield) cp5_widget.getController("Session Objective");
    Textfield tfSubjN = (Textfield) cp5_widget.getController("Subject Name");
    Textfield tfEpos = (Textfield) cp5_widget.getController("Electrode Positions");

    if (submitButton.isActive && submitButton.isMouseHere()) {
      userInputFile.writeHeader("%"+"Session Description = " + tfDesc.getText());
      userInputFile.writeHeader("%"+"Session Objective = " + tfObj.getText());
      userInputFile.writeHeader("%"+"Subject Name = " + tfSubjN.getText());
      userInputFile.writeHeader("%"+"Electrode Positions = " + tfEpos.getText());
      controlPanel.isShortcutEnabled = true;
      println("Enable Keyboard Shortcuts");
    }
    submitButton.setIsActive(false);

    if (isMouseHere()) {
      // clicked in widget
      outputToggle = !outputToggle;
      if (outputToggle) {
        uilOutputData = onData;
      } else {
        uilOutputData = offData;
      }
    }
  }


  //add custom functions here
  void customFunction() {
    //this is a fake function... replace it with something relevant to this widget
  }
};

//These functions need to be global! These functions are activated when an item from the corresponding dropdown is selected
void uilDropdown1(int n) {
  println("Item " + (n+1) + " selected from Dropdown 1");
  if (n==0) {
    // "Meditate|Focus"
    onData = "Focus";
    offData = "Meditate";
  } else if (n==1) {
    // "Open|Closed"
    onData = "Closed";
    offData = "Open";
  } else if (n==2) {
    //      "0|1"
    onData = "1";
    offData = "0";
  }

  closeAllDropdowns(); // do this at the end of all widget-activated functions to ensure proper widget interactivity ... we want to make sure a click makes the menu close
}
