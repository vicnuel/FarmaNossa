unit View.Model.Create;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TViewModelCreate = class(TForm)
    pnData: TPanel;
    npFooter: TPanel;
    btnCancel: TBitBtn;
    btnCreate: TBitBtn;
    procedure btnCancelClick(Sender: TObject);
    procedure btnCreateClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    FIdregister: Integer;
    FLoading: Boolean;
  public
    property idRegister: Integer read FIdregister write FIdregister;
    property loading: Boolean read FLoading write FLoading;
  end;

var
  ViewModelCreate: TViewModelCreate;

implementation

{$R *.dfm}

procedure TViewModelCreate.btnCancelClick(Sender: TObject);
begin

  self.Close;
  self.ModalResult := mrCancel;

end;

procedure TViewModelCreate.btnCreateClick(Sender: TObject);
begin
  loading := false;
  Screen.Cursor := crDefault;
  btnCreate.Enabled := True;
  self.Close;
  self.ModalResult := mrOk;
end;

procedure TViewModelCreate.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case (Key) of
    VK_F4:
      begin
        if (ssAlt in Shift) then
          Key := 0;
      end;
    VK_ESCAPE:
      btnCancel.Click;

    VK_F3:
      btnCreate.Click;
  end;
end;

procedure TViewModelCreate.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then // Se a tecla pressionada for "Enter"
  begin
    Key := #0; // Anula o som do "beep"
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

end.
