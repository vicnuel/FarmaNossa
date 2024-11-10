unit View.Local.Create;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Model.Create, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Service.Local, System.Json, System.StrUtils;

type
  TViewLocalCreate = class(TViewModelCreate)
    cbStatus: TComboBox;
    Label2: TLabel;
    editDesc: TEdit;
    Label1: TLabel;
    Label6: TLabel;
    editCod: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCreateClick(Sender: TObject);
  private
    CloseOnShow: Boolean; // ferramenta pra fechar o modal se for preciso
  public
    { Public declarations }
  end;

var
  ViewLocalCreate: TViewLocalCreate;

implementation

{$R *.dfm}

procedure TViewLocalCreate.btnCreateClick(Sender: TObject);
var
Desc: string;
Id: Integer;
Status: Boolean;
CodeResult: Integer;
SLocal: TServiceLocal;
begin
  Desc := Trim(editDesc.Text);
  if Desc.IsEmpty then
    begin
      editDesc.SetFocus;
      raise Exception.Create('Preecha o campo Descrição');
    end;

  if cbStatus.Text = 'ATIVO' then
    Status := true
  else
    Status := False;

  if (editCod.Text <> '') and (idRegister > 0) then
    Id := idRegister
  else
   id := 0;

  SLocal := TServiceLocal.Create;
  try

      if Id > 0 then
        CodeResult := SLocal.UpdateLocal( Id, Desc, Status)
      else
        CodeResult := SLocal.CreateLocal(Desc, Status);
      case CodeResult of
      201:
        begin
          ModalResult := mrOk;
          Self.Close;
          ShowMessage('Local gravado com sucesso');
        end;
      202:
        begin
          ModalResult := mrOk;
          Self.Close;
          ShowMessage('Local atualizado com sucesso');
        end;
      404:
        ShowMessage('Local não gravado');
      else
        ShowMessage('Erro ao gravar local');
      end;
  finally
    SLocal.Free;
  end;

end;

procedure TViewLocalCreate.FormActivate(Sender: TObject);
begin
  inherited;
  if CloseOnShow then
    ModalResult := mrCancel;
end;

procedure TViewLocalCreate.FormShow(Sender: TObject);
var
SLocal: TServiceLocal;
Local: TJSONObject;
begin
  if (idRegister > 0) then
    editCod.Text :=  idRegister.ToString
  else
  begin
    inherited;
    editDesc.SetFocus;
    exit;
  end;

  SLocal := TServiceLocal.Create;
  try
    Local := SLocal.GetLocal(idRegister);
    if not Assigned( Local) then
      begin
        PostMessage(Self.Handle, WM_CLOSE, 0, 0);
        CloseOnShow := True;
        exit;
      end;
    inherited;
    editDesc.Text := Local.GetValue<string>('description');
    cbStatus.ItemIndex := ifThen( local.GetValue<Boolean>('status'), '0', '1').ToInteger;

    editDesc.SetFocus;
  finally
    SLocal.Free;
    Local.Free;
  end;
end;

end.
