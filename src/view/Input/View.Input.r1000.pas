 unit View.Input.r1000;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Model.SearchEntry, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Menus, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, Service.Input,
  System.Json, System.StrUtils, View.Input.Create;

type
  TViewInputSearch = class(TViewModelSearchEntry)
    procedure FormCreate(Sender: TObject);
    procedure btnCreateClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure CreateUserClick(Sender: TObject);
  private
    procedure LoadData;
  protected
    procedure SearchData; override;
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

{ TViewInputSearch }


procedure TViewInputSearch.btnCreateClick(Sender: TObject);
var
FViewInputCreate: TViewInputCreate;
begin
  inherited;
  FViewInputCreate := TViewInputCreate.Create(nil);
  try
    FViewInputCreate.ShowModal;
    btnSearch.Click;
  finally
    FViewInputCreate.Free;
  end;

end;

procedure TViewInputSearch.btnUpdateClick(Sender: TObject);
var
FViewInputCreate: TViewInputCreate;
idSelect: Integer;
begin
  inherited;
  idSelect := DataSource1.DataSet.FieldByName('Codigo').AsInteger;
  FViewInputCreate := TViewInputCreate.Create(nil);
  try
    FViewInputCreate.idRegister :=  idSelect;
    FViewInputCreate.ShowModal;
    btnSearch.Click;
  finally
    FViewInputCreate.Free;
  end;

end;

procedure TViewInputSearch.CreateUserClick(Sender: TObject);
begin
  inherited;
  btnCreate.Click;
end;

procedure TViewInputSearch.FormCreate(Sender: TObject);
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

procedure TViewInputSearch.LoadData;
begin
  memTable.FieldDefs.Clear;
    memTable.FieldDefs.Add('Codigo', ftInteger);
    memTable.FieldDefs.Add('Cod. Prod', ftInteger);
    memTable.FieldDefs.Add('Produto', ftString, 15);
    memTable.FieldDefs.Add('Cod. local', ftInteger);
    memTable.FieldDefs.Add('Local', ftString, 15);
    memTable.FieldDefs.Add('Lote', ftString, 8);
    memTable.FieldDefs.Add('Quantidade', ftFloat);
    memTable.FieldDefs.Add('Emissão', ftString, 16);
    memTable.FieldDefs.Add('Fabricação', ftString, 10);
    memTable.FieldDefs.Add('Validade', ftString, 10);
    memTable.CreateDataSet;
end;

procedure TViewInputSearch.SearchData;
var
  JSONArr: TJSONArray;
  JSONObj: TJSONObject;
  FInput: TServiceInput;
  DateFrom, DateTo, lot: String;
  I: Integer;
begin
  FInput := TServiceInput.Create;
  JSONArr := nil;
  try
    DateFrom := IfThen(dtFrom.Format = 'dd/MM/yyyy', DateToStr( dtFrom.Date), '');
    DateTo := IfThen(dtTo.Format = 'dd/MM/yyyy', DateToStr( dtTo.Date), '');
    JSONArr := FInput.GetInputs(0, idProd, idLocal, '', DateFrom, DateTo);

    // Limpar dados existentes
    memTable.EmptyDataSet;

    if not Assigned( JSONArr) then
    begin
      ShowMessage('Nenhuma entrada encontrada');
      exit;
    end;


    // Preencher o TFDMemTable com os dados do JSON
    memTable.Open;
    for I := 0 to JSONArr.Count - 1 do
    begin
      JSONObj := JSONArr.Items[I] as TJSONObject;
      memTable.Append;
      memTable.FieldByName('Codigo').AsInteger :=
        JSONObj.GetValue<Integer>('id');
      memTable.FieldByName('Cod. Prod').AsInteger :=
        JSONObj.GetValue<integer>('product_id');
      memTable.FieldByName('Produto').AsString :=
        JSONObj.GetValue<string>('product_desc');
      memTable.FieldByName('Cod. Local').AsInteger :=
        JSONObj.GetValue<integer>('local_id');
      memTable.FieldByName('Local').AsString :=
        JSONObj.GetValue<string>('local_desc');
      memTable.FieldByName('Lote').AsString :=
        JSONObj.GetValue<string>('lot');

      memTable.FieldByName('Quantidade').AsFloat :=
        JSONObj.GetValue<Double>('quantity');

      memTable.FieldByName('Emissão').AsString :=
        JSONObj.GetValue<string>('created');

      memTable.FieldByName('Fabricação').AsString :=
        JSONObj.GetValue<string>('manufacture_date');

      memTable.FieldByName('Validade').AsString :=
        JSONObj.GetValue<string>('expiry_date');

      memTable.Post;
    end;
  finally
    JSONArr.Free;
    FInput.Free;
  end;

  inherited;
end;

end.
