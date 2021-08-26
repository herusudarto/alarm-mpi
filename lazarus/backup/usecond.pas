unit usecond;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  HMIComboBox, HMIRadioGroup, hmi_draw_basic_vector_control, BCListBox,
  kdbgrids, klabels, CheckBoxThemed, Controls.Blinker, ueled,uStringAlarm;

type

  { TfrmSensor }

  TfrmSensor = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Image1: TImage;
    KGradientLabel1: TKGradientLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    pn1: TPanel;
    pn2: TPanel;
    pn3: TPanel;
    pn4: TPanel;
    pn5: TPanel;
    pnMain: TPanel;
    pnTop: TPanel;
    pnBot: TPanel;
    pnLeft: TPanel;
    pnRight: TPanel;
    tmCl: TTimer;
    tm1: TTimer;
    uELED1: TuELED;
    uELED2: TuELED;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pnMainClick(Sender: TObject);
    procedure pnTopClick(Sender: TObject);
    procedure tm1Timer(Sender: TObject);
    procedure AckAlarm(ci:integer);
    procedure IsAlarm(ci:integer);
    procedure IsNormal(ci:integer);
    procedure tmClTimer(Sender: TObject);
  private

  public

  end;

var
  frmSensor: TfrmSensor;
  clAlarm:TColor;
  APanel:array[1..160] of TPanel;
  ALabel:array[1..160] of TLabel;
  ALed:array[1..160] of TuELed;
  IsLight:boolean;
implementation

{$R *.lfm}

{ TfrmSensor }
procedure TfrmSensor.AckAlarm(ci:integer);
begin
  if ALabel[ci].Font.Color<>clMaroon then
  ALabel[ci].Font.Color:=clMaroon;
//  ALed[ci].Color:=clRed;
//  ALed[ci].Bright:=IsLight;

end;

procedure TfrmSensor.IsAlarm(ci:integer);
begin
  if ALabel[ci].Font.Color<>clAlarm then
  ALabel[ci].Font.Color:=clAlarm;
//  ALed[ci].Color:=clRed;
//  ALed[ci].Bright:=IsLight;
end;

procedure TfrmSensor.IsNormal(ci:integer);
begin
  if ALabel[ci].Font.Color<>0 then
  ALabel[ci].Font.Color:=0;
//  ALed[ci].Color:=clGreen;
//  ALed[ci].Bright:=IsLight;

end;

procedure TfrmSensor.tmClTimer(Sender: TObject);
begin
   IsLight:=not IsLight;
   if IsLight then clAlarm:=clRed else clAlarm:=clMaroon;
end;

procedure TfrmSensor.FormCreate(Sender: TObject);
var
  c,pw,fs:integer;
begin
  pw:=362;
  pn1.Width:=pw;
  pn2.Width:=pw;
  pn3.Width:=pw;
  pn4.Width:=pw;
  pn5.Width:=pw;
  fs:=9;
  for c:=1 to 32 do
  begin
   APanel[c]:=TPanel.Create(self);
   ALabel[c]:=TLabel.Create(self);
   ALabel[c].Parent:=APanel[c];
   ALabel[c].Font.Name:='Courier New';
   ALabel[c].Font.Size:=fs;
   ALabel[c].Caption:=AString[c];
   ALed[c]:=TuELED.Create(self);
   ALed[c].Parent:=APanel[c];
   ALabel[c].Left:=ALed[c].Width;
   APanel[c].Parent:=pn1;
   APanel[c].BevelOuter:=bvNone;
   APanel[c].Align:=alTop;
   APanel[c].top:=(c-1)*30;
   APanel[c].Left:=0;
   APanel[c].Height:=30;
   APanel[c].Width:=300;
   APanel[c].Caption:='';//inttostr(c);
  end;
  for c:=33 to 64 do
  begin
   APanel[c]:=TPanel.Create(self);
   ALabel[c]:=TLabel.Create(self);
   ALabel[c].Parent:=APanel[c];
   ALabel[c].Font.Name:='Courier New';
   ALabel[c].Font.Size:=fs;
   ALabel[c].Caption:=AString[c];
   ALed[c]:=TuELED.Create(self);
   ALed[c].Parent:=APanel[c];
   ALabel[c].Left:=ALed[c].Width;
   APanel[c].Parent:=pn2;
   APanel[c].BevelOuter:=bvNone;
   APanel[c].Align:=alTop;
   APanel[c].top:=(c-1)*30;
   APanel[c].Left:=0;
   APanel[c].Height:=30;
   APanel[c].Width:=300;
   APanel[c].Caption:='';//inttostr(c);
  end;

  for c:=65 to 96 do
  begin
   APanel[c]:=TPanel.Create(self);
   ALabel[c]:=TLabel.Create(self);
   ALabel[c].Parent:=APanel[c];
   ALabel[c].Font.Name:='Courier New';
   ALabel[c].Font.Size:=fs;
   ALabel[c].Caption:=AString[c];
   ALed[c]:=TuELED.Create(self);
   ALed[c].Parent:=APanel[c];
   ALabel[c].Left:=ALed[c].Width;
   APanel[c].Parent:=pn3;
   APanel[c].BevelOuter:=bvNone;
   APanel[c].Align:=alTop;
   APanel[c].top:=(c-1)*30;
   APanel[c].Left:=0;
   APanel[c].Height:=30;
   APanel[c].Width:=300;
   APanel[c].Caption:='';//inttostr(c);
  end;

  for c:=97 to 128 do
  begin
   APanel[c]:=TPanel.Create(self);
   ALabel[c]:=TLabel.Create(self);
   ALabel[c].Parent:=APanel[c];
   ALabel[c].Font.Name:='Courier New';
   ALabel[c].Font.Size:=fs;
   ALabel[c].Caption:=AString[c];
   ALed[c]:=TuELED.Create(self);
   ALed[c].Parent:=APanel[c];
   ALabel[c].Left:=ALed[c].Width;
   APanel[c].Parent:=pn4;
   APanel[c].BevelOuter:=bvNone;
   APanel[c].Align:=alTop;
   APanel[c].top:=(c-1)*30;
   APanel[c].Left:=0;
   APanel[c].Height:=30;
   APanel[c].Width:=300;
   APanel[c].Caption:='';//inttostr(c);
  end;

  for c:=129 to 160 do
  begin
   APanel[c]:=TPanel.Create(self);
   ALabel[c]:=TLabel.Create(self);
   ALabel[c].Parent:=APanel[c];
   ALabel[c].Font.Name:='Courier New';
   ALabel[c].Font.Size:=fs;
   ALabel[c].Caption:=AString[c];
   ALed[c]:=TuELED.Create(self);
   ALed[c].Parent:=APanel[c];
   ALabel[c].Left:=ALed[c].Width;
   APanel[c].Parent:=pn5;
   APanel[c].BevelOuter:=bvNone;
   APanel[c].Align:=alTop;
   APanel[c].top:=(c-1)*30;
   APanel[c].Left:=0;
   APanel[c].Height:=30;
   APanel[c].Width:=300;
   APanel[c].Caption:='';//inttostr(c);
  end;


end;

procedure TfrmSensor.Button1Click(Sender: TObject);
var c:integer;
begin
     for c:=1 to 160 do
     begin
     IsNormal(c);
     label2.Caption:=inttostr(c);
     end;
end;

procedure TfrmSensor.Button2Click(Sender: TObject);
var c:integer;
begin
     for c:=1 to 160 do
     begin
     IsAlarm(c);
     label3.Caption:=inttostr(c);

     end;
end;

procedure TfrmSensor.Button3Click(Sender: TObject);
var c:integer;
begin
     for c:=1 to 160 do
     begin

     AckAlarm(c);
     label4.Caption:=inttostr(c);

     end;
end;

procedure TfrmSensor.pnMainClick(Sender: TObject);
begin

end;

procedure TfrmSensor.pnTopClick(Sender: TObject);
begin

end;

procedure TfrmSensor.tm1Timer(Sender: TObject);
begin

end;

end.

