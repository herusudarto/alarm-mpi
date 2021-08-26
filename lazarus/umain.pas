unit umain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  kgrids, klog, kcontrols, BCListBox,uStringAlarm,usecond;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    Button1: TButton;
    rgA1: TCheckGroup;
    pnMain: TPanel;
    rgA2: TCheckGroup;
    rgA3: TCheckGroup;
    rgA4: TCheckGroup;
    rgA5: TCheckGroup;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;
const
   Days : array[0..6] of string =
   (
     'Sun', 'Mon', 'Tue', 'Wed',
     'Thu', 'Fri', 'Sat'
   ) ;

var
  frmMain: TfrmMain;
implementation
procedure init;
begin

end;

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.FormCreate(Sender: TObject);
var c:integer;
begin
    rgA1.Width:=Screen.Width div 6;
    rgA2.Width:=rgA1.Width;
    rgA3.Width:=rgA1.Width;
    rgA4.Width:=rgA1.Width;
    rgA5.Width:=rgA1.Width;
    rgA1.Caption:='';
    rgA2.Caption:='';
    rgA3.Caption:='';
    rgA4.Caption:='';
    rgA5.Caption:='';
//    rgA1.
      for c:=1 to 32 do
          rgA1.Items.Add(AString[c]);
      for c:=33 to 64 do
          rgA2.Items.Add(AString[c]);
      for c:=65 to 96 do
          rgA3.Items.Add(AString[c]);
      for c:=97 to 128 do
          rgA4.Items.Add(AString[c]);
      for c:=129 to 160 do
          rgA5.Items.Add(AString[c]);


    rgA1.Left:=0;
    rgA2.Left:=1;
    rgA3.Left:=2;
    rgA4.Left:=3;
    rgA5.Left:=4;
    rgA1.Align:=alLeft;
    rgA2.Align:=alLeft;
    rgA3.Align:=alLeft;
    rgA4.Align:=alLeft;
    rgA5.Align:=alLeft;

end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
    frmSensor.ShowModal;
  rgA2.Checked[2]:=not rgA2.Checked[2];
  if (rgA2.Checked[2]) then rgA2.Caption:=UpperCase(rgA2.Caption) else
  rgA2.Caption:=LowerCase(rgA2.Caption);
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin

end;

end.

