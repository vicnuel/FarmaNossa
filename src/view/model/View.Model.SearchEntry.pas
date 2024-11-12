unit View.Model.SearchEntry;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Service.Product, Service.Local,
  System.Json, View.Products.r0200, View.Local.r0300;

type
  TViewModelSearchEntry = class(TForm)
    DataSource1: TDataSource;
    pnBottom: TPanel;
    btnClose: TBitBtn;
    btnCreate: TBitBtn;
    btnSelect: TBitBtn;
    btnUpdate: TBitBtn;
    pnGrid: TPanel;
    DBGrid1: TDBGrid;
    pnlTotal: TPanel;
    lbTotal: TLabel;
    pnTop: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    editProdName: TEdit;
    btnSearch: TButton;
    PopupMenu1: TPopupMenu;
    popUpdate: TMenuItem;
    N1: TMenuItem;
    CreateUser: TMenuItem;
    editProdId: TEdit;
    btnSeachProd: TButton;
    btnSearchLocal: TButton;
    editLocalId: TEdit;
    editLocalName: TEdit;
    lbLocal: TLabel;
    lbLocal2: TLabel;
    labelLocal: TLabel;
    dtFrom: TDateTimePicker;
    Label5: TLabel;
    dtTo: TDateTimePicker;
    btnCleanDate: TButton;
    memTable: TFDMemTable;
    procedure FormCreate(Sender: TObject);
    procedure dtFromChange(Sender: TObject);
    procedure btnCleanDateClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure popUpdateClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure dtToChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnSearchClick(Sender: TObject);
    procedure editProdIdKeyPress(Sender: TObject; var Key: Char);
    procedure editProdIdChange(Sender: TObject);
    procedure editLocalIdKeyPress(Sender: TObject; var Key: Char);
    procedure editLocalIdChange(Sender: TObject);
    procedure btnSeachProdClick(Sender: TObject);
    procedure btnSearchLocalClick(Sender: TObject);
    procedure btnCreateClick(Sender: TObject);
  private
    FidLocal: Integer;
    FidProd: Integer;
    procedure SetidLocal(const Value: Integer);
    procedure SetidProd(const Value: Integer);
    { Private declarations }
  protected
    procedure SearchData; Virtual;
    procedure SearchProduct(Id: Integer); virtual;
    property idProd : Integer read FidProd write SetidProd;
    procedure SearchLocal(Id: Integer); virtual;
    property idLocal : Integer read FidLocal write SetidLocal;
  public
    { Public declarations }
  end;

var
  ViewModelSearchEntry: TViewModelSearchEntry;

implementation

{$R *.dfm}


procedure TViewModelSearchEntry.btnCleanDateClick(Sender: TObject);
begin
  dtFrom.Format := ' ' ;
  dtTo.Format := ' ';
end;

procedure TViewModelSearchEntry.btnCloseClick(Sender: TObject);
begin
  Self.Close;
  Self.ModalResult := mrCancel;
end;

procedure TViewModelSearchEntry.btnCreateClick(Sender: TObject);
begin
  SearchData;
end;

procedure TViewModelSearchEntry.btnSeachProdClick(Sender: TObject);
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

procedure TViewModelSearchEntry.btnSearchClick(Sender: TObject);
begin
  Self.SearchData;
end;

procedure TViewModelSearchEntry.btnSearchLocalClick(Sender: TObject);
var
FViewLocal : TFormSeachLocal;
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

procedure TViewModelSearchEntry.btnSelectClick(Sender: TObject);
begin
  if (DataSource1.DataSet.IsEmpty) then
    raise Exception.Create('Selecione um registro');
  Self.Close;
  Self.ModalResult := mrOk;
end;

procedure TViewModelSearchEntry.btnUpdateClick(Sender: TObject);
begin
  if (DataSource1.DataSet.IsEmpty) then
    raise Exception.Create('Selecione um registro');
end;

procedure TViewModelSearchEntry.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (not Odd(DataSource1.DataSet.RecNo)) then
    DBGrid1.Canvas.Brush.Color := $00DDDDDD;

  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TViewModelSearchEntry.dtFromChange(Sender: TObject);
begin
  if (dtTo.Format = 'dd/MM/yyyy') and (dtTo.Date < dtFrom.Date) then
  begin
    dtTo.Format := ' ';
    raise Exception.Create('Data de fim menor que de inicio');
  end;
  dtFrom.Format := 'dd/MM/yyyy';
end;

procedure TViewModelSearchEntry.dtToChange(Sender: TObject);
begin
  if (dtFrom.Format = 'dd/MM/yyyy') and (dtTo.Date < dtFrom.Date) then
  begin
    dtTo.Format := ' ';
    raise Exception.Create('Data de fim menor que de inicio');
  end;
  dtTo.Format := 'dd/MM/yyyy';
end;

procedure TViewModelSearchEntry.editLocalIdChange(Sender: TObject);
begin
   if (
    Trim(editLocalId.Text) = ''
  ) then
    begin
      idLocal :=  0;
      editLocalName.Text := '';
      exit;
    end;
  if (
    (Trim(editLocalId.Text).ToInteger() <> idLocal) and (idLocal <> 0)
  ) then
    begin
      idLocal :=  0;
      editLocalName.Text := '';
    end;

end;

procedure TViewModelSearchEntry.editLocalIdKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then // Se a tecla pressionada for "Enter"
  begin
    Key := #0; // Anula o som do "beep"

    if (Trim(editLocalId.Text) <> '') then
      SearchLocal(Trim(editLocalId.Text).ToInteger());


    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TViewModelSearchEntry.editProdIdChange(Sender: TObject);
begin
  if (
    Trim(editProdId.Text) = ''
  ) then
    begin
      idProd :=  0;
      editProdName.Text := '';
      exit;
    end;
  if (
    Trim(editProdId.Text).ToInteger() <> idProd
  ) then
    begin
      idProd :=  0;
      editProdName.Text := '';
    end;

end;

procedure TViewModelSearchEntry.editProdIdKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then // Se a tecla pressionada for "Enter"
  begin
    Key := #0; // Anula o som do "beep"

    if (Trim(editProdId.Text) <> '') then
      SearchProduct(Trim(editProdId.Text).ToInteger());


    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TViewModelSearchEntry.FormCreate(Sender: TObject);
begin
  dtFrom.Format := ' ' ;
  dtTo.Format := ' ';
  idProd := 0;
  idLocal := 0;
end;

procedure TViewModelSearchEntry.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case (Key) of
      VK_F4:
      begin
        if (ssAlt in Shift) then
          Key := 0;
      end;
      VK_ESCAPE: btnClose.Click;
    end;
end;

procedure TViewModelSearchEntry.FormShow(Sender: TObject);
begin
  Self.ModalResult := mrCancel;
  editProdId.SetFocus;

  dtFrom.Date := Now;
  dtTo.Date := Now;

  dtFrom.Format := 'dd/MM/yyyy';
  dtTo.Format := 'dd/MM/yyyy';

//  SearchData;
end;

procedure TViewModelSearchEntry.popUpdateClick(Sender: TObject);
begin
  btnSearch.Click;
end;

procedure TViewModelSearchEntry.SearchData;
begin
  lbTotal.Caption := 'Registros: 000000';
  if (DataSource1.DataSet.IsEmpty) then
    Exit;

  lbTotal.Caption := 'Registros: ' + FormatFloat('000000', DataSource1.DataSet.RecordCount);
end;

procedure TViewModelSearchEntry.SearchLocal(Id: Integer);
var
SLocal: TServiceLocal;
JsonObject: TJSONObject;
begin
  SLocal := TServiceLocal.Create();
  try
    JsonObject := SLocal.GetLocal(id);
    if Assigned(JsonObject) then
    begin
      idLocal :=  JsonObject.GetValue<integer>('id');
      editLocalId.Text := idLocal.ToString;
      editLocalName.Text := JsonObject.GetValue<string>('description');
    end
    else
      begin
        idLocal :=  0;
        editLocalId.Text := '';
        editLocalName.Text := '';
        editLocalId.SetFocus;
      end;
  finally
    SLocal.Free;
    JsonObject.Free;
  end;

end;

procedure TViewModelSearchEntry.SearchProduct(Id: Integer);
var
SProd: TServiceProduct;
JsonObject: TJSONObject;
begin
  SProd := TServiceProduct.Create();
  try
    JsonObject := SProd.GetProduct(id);
    if Assigned(JsonObject) then
    begin
      idProd :=  JsonObject.GetValue<integer>('id');
      editProdId.Text := idProd.ToString;
      editProdName.Text := JsonObject.GetValue<string>('description');
    end
    else
      begin
        idProd :=  0;
        editProdId.Text := '';
        editProdName.Text := '';
        editProdId.SetFocus;
      end;
  finally
    SProd.Free;
    JsonObject.Free;
  end;

end;

procedure TViewModelSearchEntry.SetidLocal(const Value: Integer);
begin
  FidLocal := Value;
end;

procedure TViewModelSearchEntry.SetidProd(const Value: Integer);
begin
  FidProd := Value;
end;

end.
