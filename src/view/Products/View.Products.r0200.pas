unit View.Products.r0200;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Model.Search, Data.DB, Vcl.Menus,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, Service.Product,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Json,  System.StrUtils, View.Products.Create;

type
  TFormSeachProduct = class(TFormSeach)
    memTable: TFDMemTable;
    procedure FormCreate(Sender: TObject);
    procedure btnCreateClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
  private
    procedure LoadData;
  protected
    procedure SearchData; override;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFormSeachProduct.btnCreateClick(Sender: TObject);
var
VProductCreate: TViewCreateProduct;
begin
  VProductCreate := TViewCreateProduct.Create(nil);
  try
    VProductCreate.ShowModal;
    btnSearch.Click;
  finally
    VProductCreate.Free;
  end;

end;

procedure TFormSeachProduct.btnSelectClick(Sender: TObject);
var
idSelect: Integer;
begin
  inherited;
  idSelect := DataSource1.DataSet.FieldByName('Codigo').AsInteger;
  Self.Close;
  Self.ResultSelect := idSelect;
  Self.ModalResult := mrOk;
end;

procedure TFormSeachProduct.btnUpdateClick(Sender: TObject);
var idSelect: Integer;
VProductCreate: TViewCreateProduct;
begin
  inherited;
  idSelect := DataSource1.DataSet.FieldByName('Codigo').AsInteger;
  VProductCreate := TViewCreateProduct.Create(nil);
  try
    VProductCreate.idRegister := idSelect;
    VProductCreate.ShowModal;
    btnSearch.Click;
  finally
    VProductCreate.Free;
  end;

end;

procedure TFormSeachProduct.Excluir1Click(Sender: TObject);
var idSelect: Integer;
FProduct: TServiceProduct;
begin
  inherited;
  idSelect := DataSource1.DataSet.FieldByName('Codigo').AsInteger;

  FProduct := TServiceProduct.Create;
  try
    if FProduct.DeleteProduct(idSelect) then
      DataSource1.DataSet.Delete;
    btnSearch.Click;

  finally
    FProduct.Free
  end;
end;

procedure TFormSeachProduct.FormCreate(Sender: TObject);
begin
  inherited;
   // Configurar o DataSource
  DataSource1.DataSet := memTable;

  // Configurar o DBGrid
  DBGrid1.DataSource := DataSource1;

  // Carregar os dados
  LoadData;
end;

procedure TFormSeachProduct.LoadData;
begin
    memTable.FieldDefs.Clear;
    memTable.FieldDefs.Add('Codigo', ftInteger);
    memTable.FieldDefs.Add('Descrição', ftString, 50);
    memTable.FieldDefs.Add('Status', ftString, 8);
    memTable.FieldDefs.Add('Estoque Neg.', ftString, 8);
    memTable.FieldDefs.Add('Entrada', ftString, 8);
    memTable.FieldDefs.Add('Saida', ftString, 8);
    memTable.CreateDataSet;
end;

procedure TFormSeachProduct.SearchData();
var
  JSONArr: TJSONArray;
  JSONObj: TJSONObject;
  FProd: TServiceProduct;
  Value: String;
//  Users : TJSONArray;
  I: Integer;
begin
  FProd := TServiceProduct.Create;
  JSONArr := nil;
  try
    Value := editValue.Text;
    if (cbType.Text = 'Código') and (Value <> '') then
      JSONArr := FProd.GetProducts('',Value.ToInteger())
    else
      JSONArr := FProd.GetProducts(Value);

    // Limpar dados existentes
    memTable.EmptyDataSet;

    if not Assigned( JSONArr) then
      exit;

    // Preencher o TFDMemTable com os dados do JSON
    memTable.Open;
    for I := 0 to JSONArr.Count - 1 do
    begin
      JSONObj := JSONArr.Items[I] as TJSONObject;
      memTable.Append;
      memTable.FieldByName('Codigo').AsInteger :=
        JSONObj.GetValue<Integer>('id');
      memTable.FieldByName('Descrição').AsString :=
        JSONObj.GetValue<string>('description');
      memTable.FieldByName('status').AsString :=
        ifThen( JSONObj.GetValue<Boolean>('status'), 'ATIVO', 'INATIVO');
      memTable.FieldByName('Estoque Neg.').AsString :=
        ifThen( JSONObj.GetValue<Boolean>('n_stock'), 'SIM', 'NÃO');
      memTable.FieldByName('Entrada').AsString :=
        ifThen( JSONObj.GetValue<Boolean>('s_input'), 'SIM', 'NÃO');
      memTable.FieldByName('Saida').AsString :=
        ifThen( JSONObj.GetValue<Boolean>('s_output'), 'SIM', 'NÃO');
      memTable.Post;
    end;
  finally
    JSONArr.Free;
    FProd.Free;
  end;

  inherited;
end;

end.
