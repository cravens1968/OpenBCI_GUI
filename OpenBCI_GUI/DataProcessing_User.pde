
//------------------------------------------------------------------------
//                       Global Variables & Instances
//------------------------------------------------------------------------

DataProcessing_User dataProcessing_user;
boolean drawEMG = false; //if true... toggles on EEG_Processing_User.draw and toggles off the headplot in Gui_Manager
boolean drawAccel = false;
boolean drawPulse = false;
boolean drawFFT = true;
boolean drawBionics = false;
boolean drawHead = true;


String oldCommand = "";
boolean hasGestured = false;

//------------------------------------------------------------------------
//                            Classes
//------------------------------------------------------------------------

class DataProcessing_User {
  private float fs_Hz;  //sample rate
  private int n_chan;

  boolean switchesActive = false;
  int bufferIndex = 0; 
  int maxBuffer = 500;  // 10 seconds-ish

  float pwrAlpha, pwrBeta, pwrTheta, pwrGamma, pwrDelta;
  float aveAlpha, aveBeta, aveTheta, aveGamma, aveDelta;



  Button leftConfig = new Button(3*(width/4) - 65, height/4 - 120, 20, 20, "\\/", fontInfo.buttonLabel_size);
  Button midConfig = new Button(3*(width/4) + 63, height/4 - 120, 20, 20, "\\/", fontInfo.buttonLabel_size);
  Button rightConfig = new Button(3*(width/4) + 190, height/4 - 120, 20, 20, "\\/", fontInfo.buttonLabel_size);



  //class constructor
  DataProcessing_User(int NCHAN, float sample_rate_Hz) {
    n_chan = NCHAN;
    fs_Hz = sample_rate_Hz;
  }

  //add some functions here...if you'd like

  //here is the processing routine called by the OpenBCI main program...update this with whatever you'd like to do
  public void process(float[][] data_newest_uV, //holds raw bio data that is new since the last call
    float[][] data_long_uV, //holds a longer piece of buffered EEG data, of same length as will be plotted on the screen
    float[][] data_forDisplay_uV, //this data has been filtered and is ready for plotting on the screen
    FFT[] fftData) {              //holds the FFT (frequency spectrum) of the latest data

    //for example, you could loop over each EEG channel to do some sort of time-domain processing
    //using the sample values that have already been filtered, as will be plotted on the display
    float EEG_value_uV;

    if (bufferIndex++ < maxBuffer) {

      pwrDelta +=  dataProcessing.headWidePower[DELTA];
      pwrAlpha +=  dataProcessing.headWidePower[ALPHA];
      pwrTheta +=  dataProcessing.headWidePower[THETA];
      pwrBeta +=  dataProcessing.headWidePower[BETA];
      pwrGamma +=  dataProcessing.headWidePower[GAMMA];
    } else {
      aveDelta = pwrDelta / bufferIndex;
      aveAlpha = pwrAlpha / bufferIndex;
      aveTheta = pwrTheta / bufferIndex;
      aveBeta = pwrBeta / bufferIndex;
      aveGamma = pwrGamma / bufferIndex;
      println("10 s ave: " + aveAlpha +", " + aveBeta +", " + aveTheta+", " + aveDelta+", " + aveGamma);
      bufferIndex = 0;
      aveDelta = 0;
      aveAlpha = 0;
      aveTheta = 0;
      aveBeta = 0;
      aveGamma = 0;
      pwrDelta = 0;
      pwrAlpha = 0;
      pwrTheta = 0;
      pwrBeta = 0;
      pwrGamma = 0;
    }
    //println("bufferindx: " + bufferIndex);
  }
}
