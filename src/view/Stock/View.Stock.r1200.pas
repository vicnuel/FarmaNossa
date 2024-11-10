unit View.Stock.r1200;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, Vcl.StdCtrls, Vcl.Menus, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Json,
  System.StrUtils, Service.Stock, View.Local.r0300, Service.Local, System.Math;

type
  TViewStock = class(TForm)
    DataSource1: TDataSource;
    memTable: TFDMemTable;
    pnGrid: TPanel;
    DBGrid1: TDBGrid;
    pnlTotal: TPanel;
    lbTotal: TLabel;
    pnTop: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnSearch: TButton;
    btnSearchLocal: TButton;
    editLocalId: TEdit;
    editLocalName: TEdit;
    PopupMenu1: TPopupMenu;
    popUpdate: TMenuItem;
    N1: TMenuItem;
    pnProd: TPanel;
    pnStock: TPanel;
    pnTotalStock: TPanel;
    lbTotalStock: TLabel;
    DBGrid2: TDBGrid;
    cbType: TComboBox;
    editValue: TEdit;
    Label5: TLabel;
    cbStatus: TComboBox;
    Label2: TLabel;
    Label6: TLabel;
    cbStock: TComboBox;
    editQuant: TEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    memTable2: TFDMemTable;
    DataSource2: TDataSource;
    procedure cbTypeChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure editValueKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editValueKeyPress(Sender: TObject; var Key: Char);
    procedure cbStatusChange(Sender: TObject);
    procedure btnSearchLocalClick(Sender: TObject);
    procedure editLocalIdChange(Sender: TObject);
    procedure editLocalIdKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure editQuantKeyPress(Sender: TObject; var Key: Char);
    procedure cbStockChange(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    statusProd: String;
    IdLocal: Integer;
    GreaterThan, LessThan: Double;
    ZeroStock: String;
    StatusSeachProd : Boolean;
    procedure LoadDataProd;
    procedure LoadDataStock;
    procedure SeachDataProd;
    procedure SeachDataStock;
    procedure SearchLocal(Id: Integer);
    procedure CloseForm;
    procedure configStock;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TViewStock.btnSearchClick(Sender: TObject);
begin
  SeachDataProd;
end;

procedure TViewStock.btnSearchLocalClick(Sender: TObject);
var
  FViewLocal: TFormSeachLocal;
begin
  FViewLocal := TFormSeachLocal.Create(nil);
  try
    FViewLocal.ShowModal;

    if (FViewLocal.ResultSelect > 0) then
      SearchLocal(FViewLocal.ResultSelect);
  finally
    FViewLocal.Free;
  end;
end;

procedure TViewStock.cbStatusChange(Sender: TObject);
begin
  case cbStatus.ItemIndex of
    2:
      statusProd := '';
    0:
      statusProd := 'true';
    1:
      statusProd := 'false';
  end;
end;

procedure TViewStock.cbTypeChange(Sender: TObject);
begin
  editValue.Text := '';
  if cbType.Text = 'Código' then
    editValue.NumbersOnly := True
  else
    editValue.NumbersOnly := False;
end;

procedure TViewStock.CloseForm;
begin
  Self.Close;
  Self.ModalResult := mrCancel;
end;

procedure TViewStock.configStock;
begin
  // 0 Mostrar Tudo
  // 1 Não Mostrar Estoque Zerado
  // 2 Estoque Maior que
  // 3 Estoque Menor que
  // 5 Estoque Igual a
  case cbStock.ItemIndex of
    0:
      begin
        ZeroStock := 'true';
        GreaterThan := NaN;
        LessThan := NaN;
        editQuant.Visible := False;
      end;
    1:
      begin
        ZeroStock := 'false';
        GreaterThan := NaN;
        LessThan := NaN;
        editQuant.Visible := False;
      end;
    2:
      begin
        ZeroStock := '';
        editQuant.Visible := True;
        GreaterThan := StrToFloatDef(editQuant.Text, NaN);
        LessThan := NaN;
      end;
    3:
      begin
        ZeroStock := '';
        editQuant.Visible := True;
        GreaterThan := NaN;
        LessThan := StrToFloatDef(editQuant.Text, NaN);
      end;
    4:
      begin
        ZeroStock := '';
        editQuant.Visible := True;
        GreaterThan := StrToFloatDef(editQuant.Text, NaN);
        LessThan := StrToFloatDef(editQuant.Text, NaN);
      end;
  end;
end;

procedure TViewStock.cbStockChange(Sender: TObject);
begin
  configStock;
end;

procedure TViewStock.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  if DataSource1.DataSet.IsEmpty then
    exit;

  SeachDataStock;
end;

procedure TViewStock.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (not Odd(DataSource1.DataSet.RecNo)) then
    DBGrid1.Canvas.Brush.Color := $00DDDDDD;

  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TViewStock.editLocalIdChange(Sender: TObject);
begin
  if (Trim(editLocalId.Text) = '') then
  begin
    IdLocal := 0;
    editLocalName.Text := '';
    exit;
  end;
  if ((Trim(editLocalId.Text).ToInteger() <> IdLocal) and (IdLocal <> 0)) then
  begin
    IdLocal := 0;
    editLocalName.Text := '';
  end;

end;

procedure TViewStock.editLocalIdKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then // Se a tecla pressionada for "Enter"
  begin
    Key := #0; // Anula o som do "beep"

    if (Trim(editLocalId.Text) <> '') then
      SearchLocal(Trim(editLocalId.Text).ToInteger());

    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TViewStock.editQuantKeyPress(Sender: TObject; var Key: Char);
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

procedure TViewStock.editValueKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_UP:
      DataSource1.DataSet.Prior;
    VK_DOWN:
      DataSource1.DataSet.Next;
  end;
end;

procedure TViewStock.editValueKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then // Se a tecla pressionada for "Enter"
  begin
    Key := #0; // Anula o som do "beep"
    btnSearch.Click;
  end;
end;

procedure TViewStock.FormCreate(Sender: TObject);
begin
  // Status padrão
  statusProd := 'true';

  // configurar tabela de produto
  // Configurar o DataSource
  DataSource1.DataSet := memTable;

  // Configurar o DBGrid
  DBGrid1.DataSource := DataSource1;

  // cofigurar tabela de estoque
  DataSource2.DataSet := memTable2;
  DBGrid2.DataSource := DataSource2;

  // Carregar os dados
  LoadDataProd;

  LoadDataStock;

end;

procedure TViewStock.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case (Key) of
    VK_F4:
      begin
        if (ssAlt in Shift) then
          Key := 0;
      end;
    VK_ESCAPE:
      CloseForm;
  end;
end;

procedure TViewStock.LoadDataProd;
begin

  // produto
  memTable.FieldDefs.Clear;
  memTable.FieldDefs.Add('Codigo', ftInteger);
  memTable.FieldDefs.Add('Descrição', ftString, 25);
  memTable.FieldDefs.Add('Status', ftString, 8);
  memTable.FieldDefs.Add('Estoque Neg.', ftString, 8);
  memTable.FieldDefs.Add('Entrada', ftString, 8);
  memTable.FieldDefs.Add('Saida', ftString, 8);
  memTable.FieldDefs.Add('Estoque', ftFloat);
  memTable.CreateDataSet;

end;

procedure TViewStock.LoadDataStock;
begin
  memTable2.FieldDefs.Clear;
  memTable2.FieldDefs.Add('Lote', ftString, 10);
  memTable2.FieldDefs.Add('Local', ftString, 15);
  memTable2.FieldDefs.Add('Estoque', ftFloat);
  memTable2.FieldDefs.Add('Data Fab', ftString, 10);
  memTable2.FieldDefs.Add('Data Venc', ftString, 10);
  memTable2.CreateDataSet;
end;

procedure TViewStock.SeachDataProd;
var
  JSONArr: TJSONArray;
  JSONObj: TJSONObject;
  FProd: TServiceStock;
  Value: String;
  // Users : TJSONArray;
  i: Integer;
begin
  StatusSeachProd := False;
  FProd := TServiceStock.Create;
  JSONArr := nil;
  try
    Value := editValue.Text;
    configStock;

    if editQuant.Text = '' then
    begin
      GreaterThan := NaN;
      LessThan := NaN;
    end;

    if (cbType.Text = 'Código') and (Value <> '') then
      JSONArr := FProd.GetAll(Value.ToInteger(), statusProd, '', IdLocal,
        ZeroStock, GreaterThan, LessThan)
    else
      JSONArr := FProd.GetAll(0, statusProd, Value, IdLocal, ZeroStock,
        GreaterThan, LessThan);

    // Limpar dados existentes
    memTable.EmptyDataSet;

    if not Assigned(JSONArr) then
      exit;

    // Preencher o TFDMemTable com os dados do JSON
    memTable.Open;
    for i := 0 to JSONArr.Count - 1 do
    begin
      JSONObj := JSONArr.Items[i] as TJSONObject;
      memTable.Append;
      memTable.FieldByName('Codigo').AsInteger :=
        JSONObj.GetValue<Integer>('product_id');
      memTable.FieldByName('Descrição').AsString :=
        JSONObj.GetValue<string>('product_desc');
      memTable.FieldByName('status').AsString :=
        ifThen(JSONObj.GetValue<Boolean>('status'), 'ATIVO', 'INATIVO');
      memTable.FieldByName('Estoque Neg.').AsString :=
        ifThen(JSONObj.GetValue<Boolean>('n_stock'), 'SIM', 'NÃO');
      memTable.FieldByName('Entrada').AsString :=
        ifThen(JSONObj.GetValue<Boolean>('s_input'), 'SIM', 'NÃO');
      memTable.FieldByName('Saida').AsString :=
        ifThen(JSONObj.GetValue<Boolean>('s_output'), 'SIM', 'NÃO');
      memTable.FieldByName('Estoque').AsFloat :=
        JSONObj.GetValue<Double>('quantity');
      memTable.Post;
    end;
  finally
    JSONArr.Free;
    FProd.Free;
  end;
  lbTotal.Caption := 'Registros: 000000';
  if (DataSource1.DataSet.IsEmpty) then
    exit;

  lbTotal.Caption := 'Registros: ' + FormatFloat('000000',
    DataSource1.DataSet.RecordCount);
  StatusSeachProd := True;
  SeachDataStock;
end;

procedure TViewStock.SeachDataStock;
var
  JSONArr: TJSONArray;
  JSONObj: TJSONObject;
  SStock: TServiceStock;
  DateFrom, DateTo, lot: String;
  i, IdProd: Integer;
begin
  if DataSource1.DataSet.IsEmpty or (not StatusSeachProd) then
    exit;

  IdProd := DataSource1.DataSet.FieldByName('Codigo').AsInteger;
  SStock := TServiceStock.Create;
  JSONArr := nil;
  try
    if not IdProd > 0 then
    begin
      ShowMessage('Selecione um produto');
      exit;
    end;
    JSONArr := SStock.GetByProdLocalLot(IdProd);

    // Limpar dados existentes
    memTable2.EmptyDataSet;

    if not Assigned(JSONArr) then
    begin
      exit;
    end;

    // Preencher o TFDMemTable com os dados do JSON
    memTable2.Open;
    for i := 0 to JSONArr.Count - 1 do
    begin
      JSONObj := JSONArr.Items[i] as TJSONObject;
      memTable2.Append;

      memTable2.FieldByName('Local').AsString :=
        JSONObj.GetValue<string>('local_desc');
      memTable2.FieldByName('Lote').AsString := JSONObj.GetValue<string>('lot');

      memTable2.FieldByName('Estoque').AsFloat :=
        JSONObj.GetValue<Double>('quantity');

      memTable2.FieldByName('Data Fab').AsString :=
        JSONObj.GetValue<string>('manufacture_date');

      memTable2.FieldByName('Data Venc').AsString :=
        JSONObj.GetValue<string>('expiry_date');

      memTable2.Post;
    end;
  finally
    JSONArr.Free;
    SStock.Free;
  end;

  lbTotalStock.Caption := 'Opções: 000000';
  if (DataSource2.DataSet.IsEmpty) then
    exit;

  lbTotalStock.Caption := 'Opções: ' + FormatFloat('000000',
    DataSource2.DataSet.RecordCount);
end;

procedure TViewStock.SearchLocal(Id: Integer);
var
  SLocal: TServiceLocal;
  JsonObject: TJSONObject;
begin
  SLocal := TServiceLocal.Create();
  try
    JsonObject := SLocal.GetLocal(Id);
    if Assigned(JsonObject) then
    begin
      IdLocal := JsonObject.GetValue<Integer>('id');
      editLocalId.Text := IdLocal.ToString;
      editLocalName.Text := JsonObject.GetValue<string>('description');
    end
    else
    begin
      IdLocal := 0;
      editLocalId.Text := '';
      editLocalName.Text := '';
      editLocalId.SetFocus;
    end;
  finally
    SLocal.Free;
    JsonObject.Free;
  end;

end;

end.
