unit unit_login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, REST.Types, System.NetEncoding, IdBaseComponent, Service.VariableInRegistry,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, IdIOHandler, View.Config,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdCoder,
  IdCoder3to4, IdCoderMIME, FarmaNossa.Global.Auth, System.JSON, FarmaNossa.Global.DataApi;

type
  Tform_login = class(TForm)
    pnl_background: TPanel;
    pnl_left: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    pnl_user: TPanel;
    Label6: TLabel;
    edit_user: TEdit;
    Panel2: TPanel;
    pnl_pass: TPanel;
    Label7: TLabel;
    edit_pass: TEdit;
    Panel3: TPanel;
    Panel1: TPanel;
    btn_login: TSpeedButton;
    btn_close: TSpeedButton;
    Label8: TLabel;
    Image1: TImage;
    IdHTTP1: TIdHTTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    IdEncoderMIME1: TIdEncoderMIME;
    btnConfig: TImage;
    procedure btn_closeClick(Sender: TObject);
    procedure btn_loginClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnConfigClick(Sender: TObject);
  private
    function login(Name:String; Password: String): Boolean;
  public
    { Public declarations }
  end;

var
  form_login: Tform_login;

implementation

{$R *.dfm}

function Tform_login.login(Name:String; Password: String): Boolean;
var
  IdHTTP: TIdHTTP;
  IdSSLIOHandler: TIdSSLIOHandlerSocketOpenSSL;
  AuthValue: String;
  Response: String;
  JSONValue: TJSONValue;
  JSONObj: TJSONObject;
begin
  Result := False;
  IdHTTP := TIdHTTP.Create(nil);
  IdSSLIOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  JSONObj := nil;
  try
    IdHTTP.IOHandler := IdSSLIOHandler;
    IdHTTP.Request.ContentType := 'application/json';
    AuthValue := 'Basic ' + TIdEncoderMIME.EncodeString(Name + ':' + Password);
    IdHTTP.Request.CustomHeaders.Values['Authorization'] := AuthValue;

    try
      Response := IdHTTP.Get(GetApiUrl() + '/login');
      JSONValue := TJSONObject.ParseJSONValue(Response);
      if Assigned(JSONValue) and (JSONValue is TJSONObject) then
      begin
        JSONObj := JSONValue as TJSONObject;
        AuthToken := JSONObj.GetValue<string>('token');
        Result := True;
      end
      else
        Result := False;
    except
      on E: EIdHTTPProtocolException do
      begin
//        ShowMessage('Erro no login: ' + E.Message);
      end;
      on E: Exception do
        Result := False;
    end;
  finally
    IdHTTP.Free;
    IdSSLIOHandler.Free;
    JSONObj.Free;
  end;
end;

procedure Tform_login.btn_loginClick(Sender: TObject);
var
logged: Boolean;
Name: String;
Pass: String;
Server: String;
begin
  Server := Trim(GetEnvVariableFromRegistry('FARMA_NOSSA_API_URL'));

  if (Server = '') then
  begin
    raise Exception.Create('Configure o servidor!');
  end;

  name := trim(edit_user.Text);
  pass := trim(edit_pass.Text);

  if (Name.Length = 0) then
  begin
    ShowMessage('Preencha o nome de usuário');
    edit_user.SetFocus;
    exit;
  end;

  if (Pass.Length = 0) then
   begin
    ShowMessage('Preencha a senha de usuário');
    edit_pass.SetFocus;
    exit;
  end;

  logged := Self.login(Name, Pass);

  if logged then
    ModalResult := mrOk // logado
  Else
    begin
      ShowMessage('Usuário ou senha inválido');
       ModalResult := mrNone;
    end;

//  Close;
end;

procedure Tform_login.FormActivate(Sender: TObject);
begin
  pnl_background.Left :=  Round((form_login.Width - pnl_background.Width)/2);
  pnl_background.Top :=  Round((form_login.Height - pnl_background.Height)/2);

end;

procedure Tform_login.FormCreate(Sender: TObject);
begin
//  edit_user.SetFocus;
end;

procedure Tform_login.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then // Se a tecla pressionada for "Enter"
  begin
    Key := #0; // Anula o som do "beep"
    if Sender = edit_pass then // Se o foco está no último TEdit (edit_pass)
      btn_login.Click
 // Move o foco para o botão de login
    else
      Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tform_login.btnConfigClick(Sender: TObject);
var
SViewConfig : TViewFormConfig;
begin
  SViewConfig := TViewFormConfig.Create(nil);
  try
    SViewConfig.ShowModal;
  finally
    SViewConfig.Free;
  end;

end;

procedure Tform_login.btn_closeClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.
