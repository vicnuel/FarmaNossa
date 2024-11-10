unit View.Products.Create;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Model.Create, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Service.Product, System.json, System.StrUtils;

type
  TViewCreateProduct = class(TViewModelCreate)
    editDesc: TEdit;
    Label1: TLabel;
    cbStatus: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    cbNStock: TComboBox;
    cbInput: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    cbOutput: TComboBox;
    Label6: TLabel;
    editCod: TEdit;
    procedure btnCreateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    CloseOnShow: Boolean; // ferramenta pra fechar o modal se for preciso
  public
    { Public declarations }
  end;

var
  ViewCreateProduct: TViewCreateProduct;

implementation

{$R *.dfm}

procedure TViewCreateProduct.btnCreateClick(Sender: TObject);
var
Desc: string;
Id: Integer;
Status, NStock, SInput, SOutput: Boolean;
CodeResult: Integer;
SProduct: TServiceProduct;
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

  if cbNStock.Text = 'SIM' then
    NStock := True
  else
    NStock := False;

  if cbInput.Text = 'SIM' then
    SInput := True
  else
    SInput := False;

  if cbOutput.Text = 'SIM' then
    SOutput := True
  else
    SOutput := False;

  if editCod.Text <> '' then
    Id := StrToInt(editCod.Text)
  else
   id := 0;

  SProduct := TServiceProduct.Create;
  try

      if Id > 0 then
        CodeResult := SProduct.UpdateProduct(Status, NStock, SInput, SOutput, Id, Desc)
      else
        CodeResult := SProduct.CreateProduct(Status, NStock, SInput, SOutput, Desc);
      case CodeResult of
      201:
        begin
          ModalResult := mrOk;
          Self.Close;
          ShowMessage('Produto gravado com sucesso');
        end;
      202:
        begin
          ModalResult := mrOk;
          Self.Close;
          ShowMessage('Produto atualizado com sucesso');
        end;
      401:
        begin
          ShowMessage('Sessão inspirada. Faça login novamente!');
          ShowMessage('O sistema será encerrado!');
          Application.Terminate;
        end;
      404:
        ShowMessage('Produto não gravado');
      else
        ShowMessage('Produto não gravado');
      end;
  finally
    SProduct.Free;
  end;

end;

procedure TViewCreateProduct.FormActivate(Sender: TObject);
begin
  inherited;
  if CloseOnShow then
    ModalResult := mrCancel; // Fecha o modal com resultado de cancelamento
end;

procedure TViewCreateProduct.FormShow(Sender: TObject);
var
SProduct: TServiceProduct;
Product: TJSONObject;
begin
  if (idRegister > 0) then
    editCod.Text :=  idRegister.ToString
  else
  begin
    inherited;
    editDesc.SetFocus;
    exit;
  end;

  SProduct := TServiceProduct.Create;
  try
    Product := SProduct.GetProduct(idRegister);
    if not Assigned( Product) then
      begin
        PostMessage(Self.Handle, WM_CLOSE, 0, 0);
        CloseOnShow := True;
        exit;
      end;
    inherited;
    editDesc.Text := Product.GetValue<string>('description');
    cbStatus.ItemIndex := ifThen( Product.GetValue<Boolean>('status'), '0', '1').ToInteger;
    cbNStock.ItemIndex := ifThen( Product.GetValue<Boolean>('n_stock'), '0', '1').ToInteger;
    cbInput.ItemIndex := ifThen( Product.GetValue<Boolean>('s_input'), '0', '1').ToInteger;;
    cbOutput.ItemIndex := ifThen( Product.GetValue<Boolean>('s_output'), '0', '1').ToInteger;

    editDesc.SetFocus;
  finally
    SProduct.Free;
    Product.Free;
  end;
end;

end.
