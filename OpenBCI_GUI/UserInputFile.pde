// User Input File Class
// Record user inputs (e.g. mouse clicks) during recording
//
//
public class UserInputFile extends OutputFile_rawtxt {
  
  //OutputFile_rawtxt_enhanced(float _fs_Hz) {
  //  super(_fs_Hz);
  //}

  UserInputFile(float _fs_Hz, String _fileName) {
    super(_fs_Hz, _fileName + "_userdata");
      output.println("%OpenBCI User Input Logger!!!");
 
  }

  public void writeHeader(String s) {
    output.println("%");
    output.println(s);
    output.flush();
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
}
