unit uAlarm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  CPort, CPortCtl, SerialPort, uStringAlarm, Types;

type

  { TfAlarm }

  TfAlarm = class(TForm)
    btAck: TButton;
    Button1: TButton;
    btAlarm: TButton;
    btNormal: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Memo1: TMemo;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    pnAdmin: TPanel;
    RadioGroup1: TRadioGroup;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure btAckClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btAlarmClick(Sender: TObject);
    procedure btNormalClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pnAdminClick(Sender: TObject);
    procedure pnAdminContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure RadioGroup1Click(Sender: TObject);
    procedure RadioGroup1SelectionChanged(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure pnAdminUpdate;
    procedure Timer2Timer(Sender: TObject);
  private

  public

  end;

const
  sNormal:byte=0;
  sAck:byte=1;
  sAlarm:byte=2;
var
  fAlarm: TfAlarm;
  IsLight:boolean;
  clAlarm:TColor;
var
  ct,ct1,ct2,ct3:integer;
implementation
uses uclosedlg;
{$R *.lfm}

{ TfAlarm }
procedure TfAlarm.pnAdminUpdate;
begin
 pnAdmin.Left:=self.Width-pnAdmin.Width;
 pnAdmin.Top:=0;
end;

procedure TfAlarm.Timer2Timer(Sender: TObject);
var c:byte;
begin

 if ct<160 then inc(ct) else ct:=1;


 //AStatus[1]:=RadioGroup1.ItemIndex;
 // for c:=10 to 20 do
 // AStatus[c]:=AStatus[1];
//ShowMessage(IntToStr(AStatus[1]));
end;

procedure TfAlarm.FormCreate(Sender: TObject);
var
  c,d,e,
    AATop,AALeft:integer;
  AGB:array[1..5] of TGroupBox;
begin
AATop:=100;

for c:=1 to 160 do
begin
ASAlarm[c]:=0;
ASNormal[c]:=1;
end;
ct:=0;
IsLight:=true;
AALeft:=50;
for e:=1 to 160 do AStatus[e]:=0;
for D:=1 to 5 do
begin
     AGB[D]:=TGroupBox.Create(self);
     AGB[D].Parent:=self;
     AGB[D].Left:=(D-1)*370 + AALeft;
     AGB[D].Width:=360;
     AGB[D].Top:=AATOP;
     AGB[D].Height:=34*24;
end;
for D:=1 to 5 do
for C:=1 to 32 do
begin
     e:=((D-1)*32)+c;

     if AShape[e]=nil then
     begin
     AShape[e]:=TPanel.Create(self);
     AShape[e].Parent:=fAlarm;
     AShape[e].Left:=AALeft+(D-1)*370+4;
     AShape[e].Top:=2+AATop+C*24;
     AShape[e].Width:=12;
     AShape[e].Height:=12;
     //AShape[e].Shape:=stRectangle;
     AShape[e].Visible:=true;
     AShape[e].Enabled:=true;
     end;


     if ALabel[e]=nil then
     begin
     ALabel[e]:=TLabel.Create(Self);
     ALabel[e].Parent:=fAlarm;
     ALabel[e].Font.Name:='Courier New';
     ALabel[e].Font.Size:=9;
     ALabel[e].Caption:=IntToStr(ANumber[e])+' '+AString[e];
     ALabel[e].Left:=20+AALeft+(D-1)*370;
     ALabel[e].Top:=AATop+C*24;
     end;
end;
end;

procedure TfAlarm.FormShow(Sender: TObject);
begin
    pnAdminUpdate;
end;

procedure TfAlarm.pnAdminClick(Sender: TObject);
begin
//     frmCloseDlg.ShowModal;
//  if frmCloseDlg.ShowModal=99999 then Application.Terminate;
if PasswordBox('Are you sure to terminate the alarm system','Enter Password Please')='99999' then Application.Terminate;
end;

procedure TfAlarm.pnAdminContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

end;

procedure TfAlarm.RadioGroup1Click(Sender: TObject);
begin

end;

procedure TfAlarm.Button1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfAlarm.btAckClick(Sender: TObject);
var
  c:integer;
begin
  Memo1.Lines.Add('Alarm Acknowledge');
  for c:=1 to 160 do
  begin
       if ASNormal[c]=1 then AStatus[c]:=sNormal else
         AStatus[c]:=sAck;
  end;

end;

procedure TfAlarm.btAlarmClick(Sender: TObject);
begin
  // first alarm received
  ASAlarm[strtoint(Edit1.Text)]:=1;
  AStatus[strtoint(Edit1.Text)]:=sAlarm;
  ASNormal[strtoint(Edit1.Text)]:=0;
  Memo1.Lines.Add('Sensor '+inttostr(ANumber[strtoint(Edit1.Text)])+' '+AString[strtoint(Edit1.Text)]+' Alarm');
end;

procedure TfAlarm.btNormalClick(Sender: TObject);
begin
  ASNormal[strtoint(Edit2.Text)]:=1;
  ASAlarm[strtoint(Edit2.Text)]:=0;
  if AStatus[strtoint(Edit2.Text)]=sAck then
  AStatus[strtoint(Edit2.Text)]:=sNormal;
  Memo1.Lines.Add('Sensor '+inttostr(ANumber[strtoint(Edit1.Text)])+' '+AString[strtoint(Edit1.Text)]+' Normal');

end;

procedure TfAlarm.FormActivate(Sender: TObject);
begin
  pnAdminUpdate;
end;

procedure TfAlarm.RadioGroup1SelectionChanged(Sender: TObject);
var c:byte;
begin
  AStatus[1]:=RadioGroup1.ItemIndex;
  for c:=10 to 20 do
  AStatus[c]:=AStatus[1];
//ShowMessage(IntToStr(AStatus[1]));
end;

procedure TfAlarm.Timer1Timer(Sender: TObject);
var
  c:integer;
begin
  IsLight:=not IsLight;
  if IsLight then clAlarm:=clRed else clAlarm:=clMaroon;

  for c:=1 to 160 do
  begin
      if AStatus[c]=sAlarm then begin
        AShape[c].Color:=clAlarm;
        AShape[c].Invalidate;
        //ALabel[c].Color:=clAlarm;
        //ALabel[c].Invalidate;
        AShape[c].Refresh;
      end;
  end;

  for c:=1 to 160 do
  if AStatus[c]<>AStatusUpdate[c] then
  begin
    if AStatus[c]=sNormal then
    begin
    AShape[c].Color:=clDefault;
    //ALabel[c].Color:=clNone;
    end;
    if AStatus[c]=sAck then
    begin
    AShape[c].Color:=clMaroon;
    //ALabel[c].Color:=clMaroon;
    end;
//    if AStatus[c]=sAlarm then AShape[c].Color:=clAlarm;
    AShape[c].Invalidate;
    //ALabel[c].Invalidate;
    AShape[c].Refresh;
    AStatusUpdate[c]:=AStatus[c];

  end;
end;

end.

