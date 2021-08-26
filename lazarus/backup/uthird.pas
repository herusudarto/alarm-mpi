unit uthird;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Controls.Blinker, Controls.SegmentDisplay, controls.signalstrength, ueled;

type

  { Tfrmthird }

  Tfrmthird = class(TForm)
    Blinker1: TBlinker;
    Blinker2: TBlinker;
    CheckBox1: TCheckBox;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    SegmentDisplay1: TSegmentDisplay;
    Shape1: TShape;
    SignalStrength1: TSignalStrength;
    uELED1: TuELED;
    procedure CheckBox1Change(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
  private

  public

  end;

var
  frmthird: Tfrmthird;

implementation

{$R *.lfm}

{ Tfrmthird }

procedure Tfrmthird.Panel5Click(Sender: TObject);
begin

end;

procedure Tfrmthird.Panel1Click(Sender: TObject);
begin

end;

procedure Tfrmthird.CheckBox1Change(Sender: TObject);
begin
     uELED1.Bright:=CheckBox1.Checked;
     Blinker1.Active:=CheckBox1.Checked;
end;

end.

