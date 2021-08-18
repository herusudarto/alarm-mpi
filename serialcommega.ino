int pinarr[32]={
    37,36,35,34,33,32,31,30,//Relay 1 (1-8)
    22,23,24,25,26,27,28,29,//relay 2 (9-16)
    41,40,43,42,45,44,47,46,
    62,63,64,65,66,67,68,69
    
};
int pinState[32];
int c,dled,dataavail,msgreported;
//int kedipcepat,kediplambat;

String acommand[]={"Que","Exe"}; // command array
String aparam="All";
String bparam[]={"On","Of"};

String scommand;
char aInput[255];

String s;

void setup() { // initialization
  msgreported=1;
  Serial.begin(115200);
  // put your setup code here, to run once:
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }  
  dled=0;
  pinMode(LED_BUILTIN, OUTPUT);
    Serial.println("serialomega.ino");
  
}
  
void loop() { // main loop
  blinkforlife();// for ensuring mcu is running not halted
  processcommand();
  parsecommand();
  if (msgreported==0){
    Serial.println(s);
    Serial.println("Command "+scommand);
    msgreported=1;
    s="";
  }
}
void parsecommand(void){
String stmp;
  int i;
  scommand="";//reset
  for (i=0;i<3;i++){
    if (s.substring(0,3)==acommand[i]){
        scommand=acommand[i];
      }
  }
  if(scommand=="Que"){
    Serial.println("Query oh");
  }
  if(scommand=="Exe"){
    Serial.println("Execute oh");
  }
}



void processcommand(void){
  int j,cx;
  aInput[0]="";
  s="";
  c=0;
  
  dataavail=0;
  while(Serial.available()>0){
    for(cx=0;cx<100;cx++){
      blinkforlife();
      }
    //delayMicroseconds(1000);
    aInput[c]=Serial.read();
    if(aInput[c]=='\n'){
      dataavail=1;
    }
        c+=1;
   }
   if(dataavail>0){
   msgreported=0;
      for(j=0;j<c;j++){
        if (j>0){
          if((s[j-1]!=' ')&&(aInput[j]!=' ')){
            s+=aInput[j];
          }
         }
         else{
           s+=aInput[j];
         }
       }
        s.trim();
      dataavail=0;
   }
  
}
void blinkforlife(void){
  dled+=1;
  if (dled>10000){
    dled=0;
  }          /// blinking led yang tidak menggunakan delay sehingga tidak mengganggu main loop
  if (dled<5000){
    if (digitalRead(LED_BUILTIN)!=HIGH){
    digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
    }
  }
  if (dled>5000){
    if (digitalRead(LED_BUILTIN)!=LOW){
    digitalWrite(LED_BUILTIN, LOW);   // turn the LED on (HIGH is the voltage level)
    }
  }

}
