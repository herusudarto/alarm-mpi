program Alarm;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, lazcontrols, uecontrols, umain, usecond, uStringAlarm, uthird, uAlarm;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(Tfrmthird, frmthird);
  Application.CreateForm(TfAlarm, fAlarm);
  Application.CreateForm(TfrmSensor, frmSensor);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

