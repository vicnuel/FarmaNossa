unit View.Output.r1100;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Model.SearchEntry, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Menus, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, Service.Output,
  System.Json, System.StrUtils, View.Output.Create;

type
  TViewSearchOutput = class(TViewModelSearchEntry)
    procedure FormCreate(Sender: TObject);
    procedure btnCreateClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
  private
    procedure LoadData;
  protected
    procedure SearchData; override;
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

{ TViewModelSearchEntry1 }

procedure TViewSearchOutput.btnCreateClick(Sender: TObject);
var
FormCreate: TViewOutputCreate;
begin
  FormCreate := TViewOutputCreate.Create(nil);
  try
    FormCreate.ShowModal;
  finally
    FormCreate.Free;
  end;

  inherited;
end;

procedure TViewSearchOutput.btnUpdateClick(Sender: TObject);
var
FormCreate: TViewOutputCreate;
begin
  inherited;

  FormCreate := TViewOutputCreate.Create(nil);
  try
    FormCreate.idRegister := DataSource1.DataSet.FieldByName('Codigo').AsInteger;
    FormCreate.ShowModal;
  finally
    FormCreate.Free;
  end;

  SearchData;
end;


procedure TViewSearchOutput.FormCreate(Sender: TObject);
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

procedure TViewSearchOutput.LoadData;
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
    memTable.CreateDataSet;
end;

procedure TViewSearchOutput.SearchData;
var
  JSONArr: TJSONArray;
  JSONObj: TJSONObject;
  FInput: TServiceOutput;
  DateFrom, DateTo, lot: String;
  I: Integer;
begin
  FInput := TServiceOutput.Create;
  JSONArr := nil;
  try
    DateFrom := IfThen(dtFrom.Format = 'dd/MM/yyyy', DateToStr( dtFrom.Date), '');
    DateTo := IfThen(dtTo.Format = 'dd/MM/yyyy', DateToStr( dtTo.Date), '');
    JSONArr := FInput.GetOutputs(0, idProd, idLocal, '', DateFrom, DateTo);

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

      memTable.Post;
    end;
  finally
    JSONArr.Free;
    FInput.Free;
  end;

  inherited;
end;

end.
