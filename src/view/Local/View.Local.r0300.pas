unit View.Local.r0300;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Model.Search, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Menus, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, System.Json, Service.Local,
  System.StrUtils, View.Local.Create;

type
  TFormSeachLocal = class(TFormSeach)
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

procedure TFormSeachLocal.btnCreateClick(Sender: TObject);
var
VLocalCreate: TViewLocalCreate;
begin
  inherited;
  VLocalCreate := TViewLocalCreate.Create(nil);
  try
    VLocalCreate.ShowModal;
    btnSearch.Click;
  finally
    VLocalCreate.Free;
  end;
end;

procedure TFormSeachLocal.btnSelectClick(Sender: TObject);
var
idSelect: integer;
begin
  inherited;
  idSelect := DataSource1.DataSet.FieldByName('Codigo').AsInteger;
  Self.Close;
  Self.ResultSelect := idSelect;
  Self.ModalResult := mrOk;
end;

procedure TFormSeachLocal.btnUpdateClick(Sender: TObject);
var
VLocalCreate: TViewLocalCreate;
idSelect: Integer;
begin
  inherited;
   VLocalCreate := TViewLocalCreate.Create(nil);
  try
    idSelect := DataSource1.DataSet.FieldByName('Codigo').AsInteger;
    VLocalCreate.idRegister := idSelect;
    VLocalCreate.ShowModal;
    btnSearch.Click;
  finally
    VLocalCreate.Free;
  end;
end;

procedure TFormSeachLocal.Excluir1Click(Sender: TObject);
var idSelect: Integer;
FLocal: TServiceLocal;
begin
  inherited;
  idSelect := DataSource1.DataSet.FieldByName('Codigo').AsInteger;

  FLocal := TServiceLocal.Create;
  try
    if FLocal.DeleteLocal(idSelect) then
      DataSource1.DataSet.Delete;
    btnSearch.Click;

  finally
    FLocal.Free
  end;
end;

procedure TFormSeachLocal.FormCreate(Sender: TObject);
begin
  inherited;
   // Configurar o DataSource
  DataSource1.DataSet := memTable;

  // Configurar o DBGrid
  DBGrid1.DataSource := DataSource1;

  // Carregar os dados
  LoadData;
end;

procedure TFormSeachLocal.LoadData;
begin
    memTable.FieldDefs.Clear;
    memTable.FieldDefs.Add('Codigo', ftInteger);
    memTable.FieldDefs.Add('Descrição', ftString, 50);
    memTable.FieldDefs.Add('Status', ftString, 8);
    memTable.CreateDataSet;
end;

procedure TFormSeachLocal.SearchData;
var
  JSONArr: TJSONArray;
  JSONObj: TJSONObject;
  FLocal: TServiceLocal;
  Value: String;
//  Users : TJSONArray;
  I: Integer;
begin
  FLocal := TServiceLocal.Create;
  JSONArr := nil;
  try
    Value := editValue.Text;
    if (cbType.Text = 'Código') and (Value <> '') then
      JSONArr := FLocal.GetLocais('',Value.ToInteger())
    else
      JSONArr := FLocal.GetLocais(Value);

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
      memTable.Post;
    end;
  finally
    JSONArr.Free;
    FLocal.Free;
  end;
  inherited;
end;

end.
