unit View.Output.Create;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.Json,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Model.Create, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, View.Products.r0200, Service.Product, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Vcl.Menus, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Service.Stock, Service.Output;

type
  TViewOutputCreate = class(TViewModelCreate)
    editCod: TEdit;
    Label6: TLabel;
    btnSeachProd: TButton;
    Label1: TLabel;
    editProdId: TEdit;
    Label2: TLabel;
    editProdName: TEdit;
    Label8: TLabel;
    editQuant: TEdit;
    pnGrid: TPanel;
    DBGrid1: TDBGrid;
    pnlTotal: TPanel;
    lbTotal: TLabel;
    memTable: TFDMemTable;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    popUpdate: TMenuItem;
    N1: TMenuItem;
    procedure editQuantKeyPress(Sender: TObject; var Key: Char);
    procedure btnSeachProdClick(Sender: TObject);
    procedure editProdIdKeyPress(Sender: TObject; var Key: Char);
    procedure editProdIdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editProdIdChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnCreateClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    idProd: Integer;
    N_Stock: Boolean;
    CloseOnShow: Boolean;
    procedure SearchProduct(Id: Integer);
    procedure LoadData;
    procedure SearchStock;
  public
    { Public declarations }
  end;

var
  ViewOutputCreate: TViewOutputCreate;

implementation

{$R *.dfm}

procedure TViewOutputCreate.btnCreateClick(Sender: TObject);
var
Quant, QuantSelect: Double;
IdLocal, statusRes: Integer;
Lot: String;
SOutput: TServiceOutput;
begin
  if idProd <= 0 then
    raise Exception.Create('Selecione um produto');

  if (DataSource1.DataSet.IsEmpty) then
    raise Exception.Create('Selecione um local e lote');

  if not TryStrToFloat(editQuant.Text, Quant) then
    raise Exception.Create('Informe a quantidade de saída');

  QuantSelect := DataSource1.DataSet.FieldByName('Quantidade').AsFloat;

  if ((not N_Stock) and ( Quant > QuantSelect)) then
    raise Exception.Create('Produto não aceita estoque negativo, escolha outro lot e local ou altere a quantidade');


  IdLocal := DataSource1.DataSet.FieldByName('Cod. local').AsInteger;

  Lot := DataSource1.DataSet.FieldByName('Lote').AsString;

  SOutput := TServiceOutput.Create;
  try
    if idRegister > 0 then
      statusRes := SOutput.UpdateOutput(idRegister, idProd, IdLocal, Lot, Quant)
    else
      statusRes := SOutput.CreateOutput(idProd, IdLocal, Lot, Quant);
    case statusRes of
      201:
      begin
        ShowMessage('Saída lancada com sucesso');
        inherited;
      end;
      202:
      begin
        ShowMessage('Saída atualizada com sucesso');
        inherited;
      end;
      406: begin

      end
      else
      raise Exception.Create('Erro ao lançar saída!');
    end;
  finally
    SOutput.Free;
  end;

end;

procedure TViewOutputCreate.btnSeachProdClick(Sender: TObject);
var
  FViewProd: TFormSeachProduct;
begin
  FViewProd := TFormSeachProduct.Create(nil);
  try
    FViewProd.ShowModal;

    if (FViewProd.ResultSelect > 0) then
      SearchProduct(FViewProd.ResultSelect);
  finally
    FViewProd.Free;
  end;
end;

procedure TViewOutputCreate.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (not Odd(DataSource1.DataSet.RecNo)) then
    DBGrid1.Canvas.Brush.Color := $00DDDDDD;

  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TViewOutputCreate.editProdIdChange(Sender: TObject);
begin

  if (Trim(editProdId.Text) = '') then
  begin
    idProd := 0;
    editProdName.Text := '';
    memTable.EmptyDataSet;
    exit;
  end;
  if (Trim(editProdId.Text).ToInteger() <> idProd) then
  begin
    idProd := 0;
    memTable.EmptyDataSet;
    editProdName.Text := '';
  end;
end;

procedure TViewOutputCreate.editProdIdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_RETURN:
      begin
        if (Trim(editProdId.Text) <> '') then
          SearchProduct(Trim(editProdId.Text).ToInteger());
      end;
  end;
end;

procedure TViewOutputCreate.editProdIdKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key = #13) then // Se a tecla pressionada for "Enter"
  begin
    Key := #0; // Anula o som do "beep"

    if (Trim(editProdId.Text) <> '') then
      SearchProduct(Trim(editProdId.Text).ToInteger());

    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TViewOutputCreate.editQuantKeyPress(Sender: TObject; var Key: Char);
var
  s: string;
  i: Integer;
  DecimalSeparator: Char;
begin
  DecimalSeparator := ','; // Configura o separador decimal para vírgula

  // Permite Backspace
  if Key = #8 then
    exit;

  // Permite apenas dígitos, uma vírgula, e controla apenas uma vírgula
  if not(Key in ['0' .. '9', DecimalSeparator]) then
    Key := #0;

  s := TEdit(Sender).Text;

  if Key = DecimalSeparator then
  begin
    // Permite a vírgula apenas uma vez
    if Pos(DecimalSeparator, s) > 0 then
      Key := #0;
  end
  else
  begin
    // Garante que a vírgula apareça apenas depois de um número
    if (Length(s) = 0) and (Key = DecimalSeparator) then
      Key := #0;
  end;
end;

procedure TViewOutputCreate.FormActivate(Sender: TObject);
begin
  inherited;
  if CloseOnShow then
    ModalResult := mrCancel;
end;

procedure TViewOutputCreate.FormCreate(Sender: TObject);
begin
  inherited;
  // Configurar o DataSource
  DataSource1.DataSet := memTable;

  // Configurar o DBGrid
  DBGrid1.DataSource := DataSource1;

  // Atribuir o evento OnDrawColumnCell
  DBGrid1.OnDrawColumnCell := DBGrid1DrawColumnCell;

  // Carregar os dados
  LoadData;
end;

procedure TViewOutputCreate.FormShow(Sender: TObject);
var
SOutput: TServiceOutput;
JsonObj: TJSONObject;
begin
  inherited;
  if idRegister <= 0 then
    begin
      editProdId.SetFocus;
      exit;
    end;
  editCod.Text := idRegister.ToString;
  SOutput := TServiceOutput.Create;
  try
    JsonObj := SOutput.GetOutput(idRegister);
    if not Assigned(JsonObj) then
    begin
      PostMessage(Self.Handle, WM_CLOSE, 0, 0);
      CloseOnShow := True;
      exit;
    end;
    inherited;

    SearchProduct(JsonObj.GetValue<Integer>('product_id'));

    editQuant.Text := FormatFloat('0.##', JsonObj.GetValue<Double>('quantity')
      ).Replace('.', ',');

  finally
    SOutput.Free;
    JsonObj.Free;
  end;
end;

procedure TViewOutputCreate.LoadData;
begin
  memTable.FieldDefs.Clear;
  memTable.FieldDefs.Add('Cod. local', ftInteger);
  memTable.FieldDefs.Add('Local', ftString, 15);
  memTable.FieldDefs.Add('Lote', ftString, 8);
  memTable.FieldDefs.Add('Quantidade', ftFloat);
  memTable.FieldDefs.Add('Fabricação', ftString, 16);
  memTable.FieldDefs.Add('Vencimento', ftString, 16);
  memTable.CreateDataSet;
end;

procedure TViewOutputCreate.SearchProduct(Id: Integer);
var
  SProd: TServiceProduct;
  JsonObject: TJSONObject;
  status, s_output: Boolean;
begin
  SProd := TServiceProduct.Create();
  try
    JsonObject := SProd.GetProduct(Id);
    if Assigned(JsonObject) then
    begin
      status := JsonObject.GetValue<Boolean>('status');
      if not status then
      begin
        ShowMessage('Produto Inativo');
        idProd := 0;
        editProdId.Text := '';
        editProdName.Text := '';
        memTable.EmptyDataSet;
        editProdId.SetFocus;
        exit;
      end;

      s_output := JsonObject.GetValue<Boolean>('s_output');
      if not s_output then
      begin
        ShowMessage('Produto não permite saída');
        idProd := 0;
        editProdId.Text := '';
        editProdName.Text := '';
        memTable.EmptyDataSet;
        editProdId.SetFocus;
        exit;
      end;
      idProd := JsonObject.GetValue<Integer>('id');
      editProdId.Text := idProd.ToString;
      editProdName.Text := JsonObject.GetValue<string>('description');
      N_Stock := JsonObject.GetValue<Boolean>('n_stock');
      SearchStock;
    end
    else
    begin
      idProd := 0;
      editProdId.Text := '';
      editProdName.Text := '';
      memTable.EmptyDataSet;
      editProdId.SetFocus;
    end;
  finally
    SProd.Free;
    JsonObject.Free;
  end;
end;

procedure TViewOutputCreate.SearchStock;
var
  JSONArr: TJSONArray;
  JSONObj: TJSONObject;
  SStock: TServiceStock;
  DateFrom, DateTo, lot: String;
  I: Integer;
begin
  SStock := TServiceStock.Create;
  JSONArr := nil;
  try
    if not idProd > 0 then
      begin
        ShowMessage('Selecione um produto');
        exit;
      end;
    JSONArr := SStock.GetByProdLocalLot(idProd, idRegister);

    // Limpar dados existentes
    memTable.EmptyDataSet;

    if not Assigned( JSONArr) then
    begin
      idProd := 0;
      editProdId.Text := '';
      editProdName.Text := '';

      ShowMessage('Nenhum estoque encotrado');

      editProdId.SetFocus;
      exit;
    end;


    // Preencher o TFDMemTable com os dados do JSON
    memTable.Open;
    for I := 0 to JSONArr.Count - 1 do
    begin
      JSONObj := JSONArr.Items[I] as TJSONObject;
      memTable.Append;

      memTable.FieldByName('Cod. Local').AsInteger :=
        JSONObj.GetValue<integer>('local_id');
      memTable.FieldByName('Local').AsString :=
        JSONObj.GetValue<string>('local_desc');
      memTable.FieldByName('Lote').AsString :=
        JSONObj.GetValue<string>('lot');

      memTable.FieldByName('Quantidade').AsFloat :=
        JSONObj.GetValue<Double>('quantity');

      memTable.FieldByName('Fabricação').AsString :=
        JSONObj.GetValue<string>('manufacture_date');

      memTable.FieldByName('Vencimento').AsString :=
        JSONObj.GetValue<string>('expiry_date');

      memTable.Post;
    end;
  finally
    JSONArr.Free;
    SStock.Free;
  end;

  lbTotal.Caption := 'Opções: 000000';
  if (DataSource1.DataSet.IsEmpty) then
    Exit;

  lbTotal.Caption := 'Opções: ' + FormatFloat('000000', DataSource1.DataSet.RecordCount);
end;

end.
