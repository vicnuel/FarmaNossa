unit View.Config;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Service.VariableInRegistry,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TViewFormConfig = class(TForm)
    pnData: TPanel;
    Label1: TLabel;
    editServer: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TViewFormConfig.BitBtn1Click(Sender: TObject);
var
Server: String;
begin
  Server := Trim(editServer.Text);

  if Server = '' then
  begin
    editServer.SetFocus;
    raise Exception.Create('Digite o endereço do servidor');
  end;


  SetEnvVariableInRegistry('FARMA_NOSSA_API_URL', Server);

  Self.Close;
  Self.ModalResult := mrOk;

  ShowMessage('Configurações salvas');

end;
procedure TViewFormConfig.BitBtn2Click(Sender: TObject);
begin
  Self.Close;
  Self.ModalResult := mrCancel;
end;

procedure TViewFormConfig.FormCreate(Sender: TObject);
var
  Server: String;
begin

  Server := Trim(GetEnvVariableFromRegistry('FARMA_NOSSA_API_URL'));

  if (Server = '') then
    exit;

  editServer.Text := Server;
end;

end.
