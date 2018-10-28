 //<>// //<>//
////////////////////////////////////////////////////
//
//    W_UserInputLogger.pde (ie "Widget Template")
//
//    This is a Template Widget, intended to be used as a starting point for OpenBCI Community members that want to develop their own custom widgets!
//    Good luck! If you embark on this journey, please let us know. Your contributions are valuable to everyone!
//
//    Created by: Conor Russomanno, November 2016
//
///////////////////////////////////////////////////,

class W_UserInputLogger extends Widget {

  //to see all core variables/methods of the Widget class, refer to Widget.pde
  //put your custom variables here...
  //Button widgetTemplateButton;


  W_UserInputLogger(PApplet _parent) {
    super(_parent); //calls the parent CONSTRUCTOR method of Widget (DON'T REMOVE)
    super.dropdownWidth = 128;
    PFont font = createFont("arial", 20);

    //This is the protocol for setting up dropdowns.
    //Note that these 3 dropdowns correspond to the 3 global functions below
    //You just need to make sure the "id" (the 1st String) has the same name as the corresponding function
    addDropdown("uilDropdown1", "On Mouse Click", Arrays.asList("Meditate|Focus", "Open|Closed", "0|1"), 2);

    //addDropdown("uilDropdown2", "Drop 2", Arrays.asList("C", "D", "E"), 1);
    //addDropdown("uilDropdown3", "Drop 3", Arrays.asList("F", "G", "H", "I"), 3);




    cp5_widget.addTextfield("Session Description")
      .setFont(font)
      .setFocus(true)
      .setColor(color(255, 0, 0))
      ;

    cp5_widget.addTextfield("Subject Name")
      .setFont(font)
      .setFocus(true)
      .setColor(color(255, 0, 0))
      ;

    cp5_widget.addTextfield("Session Objective")
      .setFont(font)
      .setFocus(true)
      .setColor(color(255, 0, 0))
      ;
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

      popStyle();
  }

  void screenResized() {
    super.screenResized(); //calls the parent screenResized() method of Widget (DON'T REMOVE)

    //put your code here...
    //widgetTemplateButton.setPos(x + w/2 - widgetTemplateButton.but_dx/2, y + h/2 - widgetTemplateButton.but_dy/2);
  }

  void mousePressed() {
    super.mousePressed(); //calls the parent mousePressed() method of Widget (DON'T REMOVE)

    //put your code here...
    //if (widgetTemplateButton.isMouseHere()) {
    //  widgetTemplateButton.setIsActive(true);
    //}
  }

  void mouseReleased() {
    super.mouseReleased(); //calls the parent mouseReleased() method of Widget (DON'T REMOVE)

    //put your code here...
    //if (widgetTemplateButton.isActive && widgetTemplateButton.isMouseHere()) {
    //  widgetTemplateButton.goToURL();
    //}
    //widgetTemplateButton.setIsActive(false);
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
    //do this
  } else if (n==1) {
    //do this instead
  }

  closeAllDropdowns(); // do this at the end of all widget-activated functions to ensure proper widget interactivity ... we want to make sure a click makes the menu close
}
