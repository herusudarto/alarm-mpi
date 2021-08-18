char aInp[255];
int c,dled,dataavail,msgreported;
String s,scommand;
String acommand[]={"Que","Exe"}; // command array
String aparam="All";
String bparam[]={"On","Of"};
String * fstring[100]; //
String rstring[100];
int strIndex=0;
//String s="";
String splitstr(){

  if (strIndex == -1)
    return "";
  byte i = s.indexOf('^',strIndex)+1;
  strIndex = s.indexOf('^',i);
  if (strIndex == -1)
    return "";
  else
    return s.substring(i,strIndex);

  
}

void setup() {
  int ccc;
  

msgreported=1;  
  // put your setup code here, to run once:
  pinMode(LED_BUILTIN, OUTPUT);
    Serial.println("serialomega.ino");
//for (ccc=0;ccc<100;ccc++){
//  fstring[ccc] = & rstring[ccc];
 //}  
Serial.begin(115200);
while(!Serial){};
dled=0;
}

void loop() {
  
  int i,cx,ccc;
strIndex=0;  
//String * fstring[100]; //
//String rstring[100];
  
  // put your main code here, to run repeatedly:
  blinkforlife();// for ensuring mcu is running not halted
  processcommand();
  if (s[0]!='^'){s='^'+s;}
 // parsecommand();

  
  if (msgreported==0){
    cx=countparam(s);

  
  Serial.println(cx-1);
  for (ccc=0;ccc<100;ccc++){
  fstring[ccc] = & rstring[ccc];
  }  


  for (i=0;i<cx-1;i++){
    *fstring[i]=splitstr();
  }
  for (i=0;i<cx-1;i++){
    Serial.println(*fstring[i]);
   }
    Serial.println(s);

//    Serial.println("Command "+scommand);
    msgreported=1;
    s="";
  }
}
int countparam(String sc){
  int ccp,cnt=0;
  for (ccp=0;ccp<sc.length();ccp++){
    if(sc[ccp]=='^'){cnt++;}
    
  }return cnt;
}


void processcommand(void){
  int j,cx;
  aInp[0]="";
  s="";
  c=0;
  
  dataavail=0;
  blinkforlife();
  while(Serial.available()>0){
    for(cx=0;cx<100;cx++){
      blinkforlife();
      }
    //delayMicroseconds(1000);
    aInp[c]=Serial.read();
    if(aInp[c]=='\n'){
      dataavail=1;
    }
        c+=1;
   }
   if(dataavail>0){
   msgreported=0;
      for(j=0;j<c;j++){
        if (j>0){
          if((s[j-1]!=' ')&&(aInp[j]!=' ')){
            s+=aInp[j];
          }
         }
         else{
           s+=aInp[j];
         }
       }
        s.trim();
      dataavail=0;
   }
  
}


void blinkforlife(void){
  dled+=1;
  if (dled>1000){
    dled=0;
  }          /// blinking led yang tidak menggunakan delay sehingga tidak mengganggu main loop
  if (dled<500){
    if (digitalRead(LED_BUILTIN)!=HIGH){
    digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
    }
  }
  if (dled>500){
    if (digitalRead(LED_BUILTIN)!=LOW){
    digitalWrite(LED_BUILTIN, LOW);   // turn the LED on (HIGH is the voltage level)
    }
  }

}
