unit View.Users.Create;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,System.Json,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Model.Create, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Service.Users;

type
  TViewUserCreate = class(TViewModelCreate)
    editName: TEdit;
    Label1: TLabel;
    editLogin: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    editPass: TEdit;
    editCod: TEdit;
    Label6: TLabel;
    procedure btnCreateClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
    CloseOnShow: Boolean; // ferramenta pra fechar o modal se for preciso
  public
    { Public declarations }
  end;

var
  ViewUserCreate: TViewUserCreate;

implementation

{$R *.dfm}

procedure TViewUserCreate.btnCreateClick(Sender: TObject);
var
  Name, Login, Password: String;
  User: TServiceUser;
  StatusResult: Integer;
begin
  if loading then
      exit;
  Name := Trim(editName.Text);
  Login := Trim(editLogin.Text);
  Password := Trim(editPass.Text);

  if Name.IsEmpty then
  begin
    editName.SetFocus;
    raise Exception.Create('Preecha o campo nome');
  end;

  if Login.IsEmpty and (not idRegister > 0) then
  begin
    editLogin.SetFocus;
    raise Exception.Create('Preecha o campo Login');
  end;

  if Password.IsEmpty then
  begin
    editPass.SetFocus;
    raise Exception.Create('Preecha o campo Senha de Acesso');
  end;

  loading := true;
  Screen.Cursor := crHourGlass;
  btnCreate.Enabled := false;

  User := TServiceUser.Create;
  try
    if idRegister > 0 then
      StatusResult := user.Update(idRegister, Name, Password)
    else
      StatusResult := User.CreateUser(Name, Login, Password);

    case StatusResult of
      201:
        begin
          ModalResult := mrOk;
          Self.Close;
          ShowMessage('Usuário criado com sucesso');
        end;
      202:
        begin
          ModalResult := mrOk;
          Self.Close;
          ShowMessage('Usuário Atualizado com sucesso');
        end;
      401:
        begin
          ShowMessage('Sessão inspirada. Faça login novamente!');
          ShowMessage('O sistema será encerrado!');
          Application.Terminate;
        end;
      404:
        ShowMessage('Usuário não gravado');
      409:
        begin
          ShowMessage('Login já se encontra cadastrado, escolha outro!');
          editLogin.Text := '' ;
          editLogin.SetFocus;
        end;
    end;

  finally
       User.Free;
       loading := false;
    Screen.Cursor := crDefault;
    btnCreate.Enabled := True;
  end;

end;

procedure TViewUserCreate.FormActivate(Sender: TObject);
begin
 inherited;
  if CloseOnShow then
    ModalResult := mrCancel; // Fecha o modal com resultado de cancelamento
end;

procedure TViewUserCreate.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then // Se a tecla pressionada for "Enter"
  begin
    Key := #0; // Anula o som do "beep"
    if Sender = editPass then
      btnCreate.Click
    else
      Perform(WM_NEXTDLGCTL, 0, 0);
    exit;
  end;
end;

procedure TViewUserCreate.FormShow(Sender: TObject);
var
SUser: TServiceUser;
User: TJSONObject;
begin
  if not (idRegister > 0) then
    begin
      inherited;
      editName.SetFocus;
      exit;
    end;

    SUser := TServiceUser.Create;
    try
      User := SUser.Get(idRegister);
      if not Assigned(User) then
        begin
          PostMessage(Self.Handle, WM_CLOSE, 0, 0);
          CloseOnShow := True;
//          ShowMessage('Usuário não encontrado');
          exit;
        end;

      editLogin.Enabled := false;
      editLogin.Color := $00DDDDDD;

      editCod.Text := User.GetValue<integer>('id').ToString;
      editName.Text := User.GetValue<String>('name');

    finally
      User.Free;
      SUser.Free;
    end;

end;

end.
