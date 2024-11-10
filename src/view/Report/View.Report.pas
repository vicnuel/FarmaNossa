unit View.Report;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Model.SearchEntry, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Vcl.StdCtrls, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Menus, System.JSON,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, Service.Report;

type
  TViewReport = class(TViewModelSearchEntry)
    cbReport: TComboBox;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure cbReportChange(Sender: TObject);
  private
    procedure loadColumns;
    procedure Report01;
    procedure Report02;
    procedure Report03;
    procedure Report04;
  protected
    procedure SearchData; override;
  public
    { Public declarations }
  end;

var
  ViewReport: TViewReport;

implementation

{$R *.dfm}
{ TViewReport }

procedure TViewReport.cbReportChange(Sender: TObject);
begin
  inherited;
  loadColumns;
end;

procedure TViewReport.FormCreate(Sender: TObject);
begin
  inherited;
  // Configurar o DataSource
  DataSource1.DataSet := memTable;

  // Configurar o DBGrid
  DBGrid1.DataSource := DataSource1;

  // Carregar os dados
  loadColumns;
end;

procedure TViewReport.loadColumns;
begin
  if cbReport.ItemIndex = 1 then
  begin
    editLocalId.Visible := false;
    editLocalName.Visible := false;
    btnSearchLocal.Visible := false;
    lbLocal.Visible := false;
    lbLocal2.Visible := false;
  end
  else
  begin
    editLocalId.Visible := true;
    editLocalName.Visible := true;
    btnSearchLocal.Visible := true;
    lbLocal.Visible := true;
    lbLocal2.Visible := true;
  end;

  memTable.Close;
  case cbReport.ItemIndex of
    0:
      begin
        // Limpar dados existentes
//        if not memTable.DataSource.DataSet.IsEmpty then
//          memTable.EmptyDataSet;
        memTable.FieldDefs.Clear;
        memTable.FieldDefs.Add('Cod Local', ftInteger);
        memTable.FieldDefs.Add('Local', ftString, 25);
        memTable.FieldDefs.Add('Cod Prod', ftInteger);
        memTable.FieldDefs.Add('Produto', ftString, 20);
        memTable.FieldDefs.Add('Lote', ftString, 15);
        memTable.FieldDefs.Add('Fabricação', ftString, 10);
        memTable.FieldDefs.Add('Vencimento', ftString, 10);
        memTable.FieldDefs.Add('Emissão', ftString, 10);
        memTable.FieldDefs.Add('Hora', ftString, 10);
        memTable.FieldDefs.Add('E/S', ftString, 2);
        memTable.FieldDefs.Add('Quantidade', ftFloat);
        memTable.CreateDataSet;
      end;
    1:
      begin
        // Limpar dados existentes
//        if not memTable.DataSource.DataSet.IsEmpty then
//          memTable.EmptyDataSet;
        memTable.FieldDefs.Clear;
        memTable.FieldDefs.Add('Cod Prod', ftInteger);
        memTable.FieldDefs.Add('Produto', ftString, 20);
        memTable.FieldDefs.Add('Quantidade', ftFloat);
        memTable.CreateDataSet;
      end;
    2:
      begin
        // Limpar dados existentes
//        if not memTable.DataSource.DataSet.IsEmpty then
//          memTable.EmptyDataSet;
        memTable.FieldDefs.Clear;
        memTable.FieldDefs.Add('Cod Prod', ftInteger);
        memTable.FieldDefs.Add('Produto', ftString, 20);
        memTable.FieldDefs.Add('Lote', ftString, 15);
        memTable.FieldDefs.Add('Fabricação', ftString, 10);
        memTable.FieldDefs.Add('Vencimento', ftString, 10);
        memTable.FieldDefs.Add('Quantidade', ftFloat);
        memTable.CreateDataSet;
      end;
    3:
      begin
        // Limpar dados existentes
//        if not memTable.DataSource.DataSet.IsEmpty then
//          memTable.EmptyDataSet;
        memTable.FieldDefs.Clear;
        memTable.FieldDefs.Add('Cod Local', ftInteger);
        memTable.FieldDefs.Add('Local', ftString, 25);
        memTable.FieldDefs.Add('Cod Prod', ftInteger);
        memTable.FieldDefs.Add('Produto', ftString, 20);
        memTable.FieldDefs.Add('Lote', ftString, 15);
        memTable.FieldDefs.Add('Fabricação', ftString, 10);
        memTable.FieldDefs.Add('Vencimento', ftString, 10);
        memTable.FieldDefs.Add('Quantidade', ftFloat);
        memTable.CreateDataSet;
      end;
  end;
  memTable.Open;
end;

procedure TViewReport.Report01;
var
  JSONArr: TJSONArray;
  JSONObj: TJSONObject;
  SReport: TServiceReport;
  // Users : TJSONArray;
  i: Integer;
begin
  SReport := TServiceReport.Create;
  JSONArr := nil;
  try

    JSONArr := SReport.GetAll('r01', idProd, '', idLocal);

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
      memTable.FieldByName('Cod Local').AsInteger :=
        JSONObj.GetValue<Integer>('local_id');
      memTable.FieldByName('Local').AsString :=
        JSONObj.GetValue<string>('local_desc');
      memTable.FieldByName('Cod Prod').AsInteger :=
        JSONObj.GetValue<Integer>('product_id');
      memTable.FieldByName('Produto').AsString :=
        JSONObj.GetValue<string>('product_desc');
       memTable.FieldByName('Lote').AsString :=
        JSONObj.GetValue<string>('lot');

      memTable.FieldByName('Fabricação').AsString :=
        JSONObj.GetValue<string>('manufacture_date');

      memTable.FieldByName('Vencimento').AsString :=
        JSONObj.GetValue<string>('expiry_date');

      memTable.FieldByName('Emissão').AsString :=
        JSONObj.GetValue<string>('created_at');

      memTable.FieldByName('Hora').AsString :=
        JSONObj.GetValue<string>('created_time');

       memTable.FieldByName('E/S').AsString :=
        JSONObj.GetValue<string>('type');

      memTable.FieldByName('Quantidade').AsFloat :=
        JSONObj.GetValue<Double>('quantity');
      memTable.Post;
    end;
  finally
    JSONArr.Free;
    SReport.Free;
  end;
end;

procedure TViewReport.Report02;
var
  JSONArr: TJSONArray;
  JSONObj: TJSONObject;
  SReport: TServiceReport;
  // Users : TJSONArray;
  i: Integer;
begin
  SReport := TServiceReport.Create;
  JSONArr := nil;
  try

    JSONArr := SReport.GetAll('r02', idProd);

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
      memTable.FieldByName('Cod Prod').AsInteger :=
        JSONObj.GetValue<Integer>('product_id');
      memTable.FieldByName('Produto').AsString :=
        JSONObj.GetValue<string>('product_desc');
      memTable.FieldByName('Quantidade').AsFloat :=
        JSONObj.GetValue<Double>('quantity');
      memTable.Post;
    end;
  finally
    JSONArr.Free;
    SReport.Free;
  end;
end;

procedure TViewReport.Report03;
var
  JSONArr: TJSONArray;
  JSONObj: TJSONObject;
  SReport: TServiceReport;
  // Users : TJSONArray;
  i: Integer;
begin
  SReport := TServiceReport.Create;
  JSONArr := nil;
  try

    JSONArr := SReport.GetAll('r03', idProd, '', idLocal);

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
      memTable.FieldByName('Cod Prod').AsInteger :=
        JSONObj.GetValue<Integer>('product_id');
      memTable.FieldByName('Produto').AsString :=
        JSONObj.GetValue<string>('product_desc');
       memTable.FieldByName('Lote').AsString :=
        JSONObj.GetValue<string>('lot');

      memTable.FieldByName('Fabricação').AsString :=
        JSONObj.GetValue<string>('manufacture_date');

      memTable.FieldByName('Vencimento').AsString :=
        JSONObj.GetValue<string>('expiry_date');

      memTable.FieldByName('Quantidade').AsFloat :=
        JSONObj.GetValue<Double>('quantity');
      memTable.Post;
    end;
  finally
    JSONArr.Free;
    SReport.Free;
  end;
end;

procedure TViewReport.Report04;
var
  JSONArr: TJSONArray;
  JSONObj: TJSONObject;
  SReport: TServiceReport;
  // Users : TJSONArray;
  i: Integer;
begin
  SReport := TServiceReport.Create;
  JSONArr := nil;
  try

    JSONArr := SReport.GetAll('r04', idProd, '', idLocal);

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
      memTable.FieldByName('Cod Local').AsInteger :=
        JSONObj.GetValue<Integer>('local_id');
      memTable.FieldByName('Local').AsString :=
        JSONObj.GetValue<string>('local_desc');
      memTable.FieldByName('Cod Prod').AsInteger :=
        JSONObj.GetValue<Integer>('product_id');
      memTable.FieldByName('Produto').AsString :=
        JSONObj.GetValue<string>('product_desc');
       memTable.FieldByName('Lote').AsString :=
        JSONObj.GetValue<string>('lot');

      memTable.FieldByName('Fabricação').AsString :=
        JSONObj.GetValue<string>('manufacture_date');

      memTable.FieldByName('Vencimento').AsString :=
        JSONObj.GetValue<string>('expiry_date');

      memTable.FieldByName('Quantidade').AsFloat :=
        JSONObj.GetValue<Double>('quantity');
      memTable.Post;
    end;
  finally
    JSONArr.Free;
    SReport.Free;
  end;
end;

procedure TViewReport.SearchData;
begin
  case cbReport.ItemIndex of
    0: Report01;
    1: Report02;
    2: Report03;
    3: Report04;
  end;
  inherited;
end;

end.
