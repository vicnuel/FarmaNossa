unit View.Users0100;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Model.Search, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, System.JSON,
  FireDAC.Comp.Client, Service.Users, Vcl.Menus;

type
  TFormSeachUsers = class(TFormSeach)
    memTable: TFDMemTable;
    procedure FormCreate(Sender: TObject);
  private
    procedure LoadData;
  protected
    procedure SearchData; override;
  public
    { Public declarations }
  end;

var
  FormSeachUsers: TFormSeachUsers;

implementation

{$R *.dfm}

procedure TFormSeachUsers.FormCreate(Sender: TObject);
begin
  inherited;
   // Configurar o DataSource
  DataSource1.DataSet := memTable;

  // Configurar o DBGrid
  DBGrid1.DataSource := DataSource1;

  // Carregar os dados
  LoadData;
end;

procedure TFormSeachUsers.LoadData;
begin
    memTable.FieldDefs.Clear;
    memTable.FieldDefs.Add('Codigo', ftInteger);
    memTable.FieldDefs.Add('Nome', ftString, 50);
    memTable.CreateDataSet;
end;

procedure TFormSeachUsers.SearchData;
var
  JSONArr: TJSONArray;
  JSONObj: TJSONObject;
  User: TServiceUser;
  Value: String;
//  Users : TJSONArray;
  I: Integer;
begin
  User := TServiceUser.Create;
  JSONArr := nil;
  try
    Value := editValue.Text;
    if (cbType.Text = 'Código') and (Value <> '') then
      JSONArr := User.GetUsers('',Value.ToInteger())
    else
      JSONArr := User.GetUsers(Value);

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
      memTable.FieldByName('Codigo').AsInteger := JSONObj.GetValue<Integer>('id');
      memTable.FieldByName('Nome').AsString := JSONObj.GetValue<string>('name');
      memTable.Post;
    end;
  finally
    JSONArr.Free;
    User.Free;
  end;

  inherited;
end;
end.
