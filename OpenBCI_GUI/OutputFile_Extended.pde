// User Input File Class
// Record user inputs (e.g. mouse clicks) during recording
//
//
public class OutputFile_Extended extends OutputFile_rawtxt {

  //OutputFile_rawtxt_enhanced(float _fs_Hz) {
  //  super(_fs_Hz);
  //}

  OutputFile_Extended(float _fs_Hz, String _fileName) {
    super(_fs_Hz, _fileName + "_userdata");
    //output.println("%OpenBCI User Input Logger!!!");
    //output.println("%Col 1 = index; col 2 = Theta; col 3 = Alpha; col 4 = Beta; col 5 = Gamma; col 6 = Delta");
    
  }

  public void writeHeader(String s) {
 //   output.print("%");
 //   output.println(s);
 //   output.flush();
  }
  public void writeData(int sampleIndex, String s) {
    //get current date time with Date()
    Date date = new Date();

    if (output != null) {
      output.print(Integer.toString(sampleIndex));
      output.print(", " + s);
      output.println( ", " + dateFormat.format(date));
      //output.flush();
    }
  }

  

  public void writeData(int sampleIndex, float powerBands[], String s) {
    Date date = new Date();

    if (output != null) {
      output.print(Integer.toString(sampleIndex));
      output.print(", " + powerBands[THETA]);
      output.print(", " + powerBands[ALPHA]);
      output.print(", " + powerBands[BETA]);
      output.print(", " + powerBands[GAMMA]);
      output.print(", " + powerBands[DELTA]);
      output.print(", " + s);
      output.println( ", " + dateFormat.format(date));
      //output.flush();
    }
  }
}
