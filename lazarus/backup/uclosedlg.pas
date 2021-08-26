unit uclosedlg;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, MaskEdit;

type

  { TfrmCloseDlg }

  TfrmCloseDlg = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  frmCloseDlg: TfrmCloseDlg;

implementation

{$R *.lfm}

{ TfrmCloseDlg }

procedure TfrmCloseDlg.Button1Click(Sender: TObject);
begin
  if Edit1.Text='Keluar' then frmCloseDlg.ModalResult:=99999;
  self.close;
end;

end.

