program Alarm;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, lazcontrols, uecontrols, CPortLib10, umain, usecond, uStringAlarm,
  uthird, uAlarm, uclosedlg;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TfAlarm, fAlarm);
  Application.CreateForm(Tfrmthird, frmthird);
  Application.CreateForm(TfrmSensor, frmSensor);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmCloseDlg, frmCloseDlg);
  Application.Run;
end.

