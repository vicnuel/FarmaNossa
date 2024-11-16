unit View.Report;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Model.SearchEntry, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Vcl.StdCtrls, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Menus,
  System.JSON,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls,
  Service.Report,
  frxClass, frxExportBaseDialog, frxExportPDF, frxDBSet, frxExportXLS;

type
  TViewReport = class(TViewModelSearchEntry)
    cbReport: TComboBox;
    Label6: TLabel;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    frxXLSExport1: TfrxXLSExport;
    btnExport: TMenuItem;
    N2: TMenuItem;
    frxDBDataset2: TfrxDBDataset;
    frxDBDataset3: TfrxDBDataset;
    frxDBDataset4: TfrxDBDataset;
    procedure FormCreate(Sender: TObject);
    procedure cbReportChange(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
  private
    procedure loadColumns;
    procedure Report01;
    procedure Report02;
    procedure Report03;
    procedure Report04;
    procedure ExportReportToPDF(const FileName: string);
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

procedure TViewReport.btnExportClick(Sender: TObject);
begin
  inherited;
  // ExportReportToPDF('relatorio.pdf');

  // Reinicializar componentes do relatório
  frxReport1.Clear;
  frxReport1.EngineOptions.DestroyForms := true;
  // Garante que formulários internos sejam destruídos
  frxDBDataset1.Clear;
  frxDBDataset2.Clear;
  frxDBDataset3.Clear;
  frxDBDataset4.Clear;

  frxReport1.Clear;
  case cbReport.ItemIndex of
    0:
      begin
        frxDBDataset1.DataSet := memTable;
        frxReport1.DataSet := frxDBDataset1;
        frxReport1.LoadFromFile
          ('C:\Users\victo\OneDrive\Documentos\GitHub\Delphi\FarmaNossa\FR3\MODELO01.fr3');
      end;
    1:
      begin
        frxDBDataset2.DataSet := memTable;
        frxReport1.DataSet := frxDBDataset2;
        frxReport1.LoadFromFile
          ('C:\Users\victo\OneDrive\Documentos\GitHub\Delphi\FarmaNossa\FR3\MODELO02.fr3');
      end;
    2:
      begin
        frxDBDataset3.DataSet := memTable;
        frxReport1.DataSet := frxDBDataset3;
        frxReport1.LoadFromFile
          ('C:\Users\victo\OneDrive\Documentos\GitHub\Delphi\FarmaNossa\FR3\MODELO03.fr3');
      end;
    3:
      begin
        frxDBDataset4.DataSet := memTable;
        frxReport1.DataSet := frxDBDataset4;
        frxReport1.LoadFromFile
          ('C:\Users\victo\OneDrive\Documentos\GitHub\Delphi\FarmaNossa\FR3\MODELO04.fr3');
      end;
  end;
  // (frxReport1.FindComponent('m_data') as TfrxMemoView).Text   := '12/11/2024';

  frxReport1.PreviewOptions.AllowEdit := False;
  frxReport1.ShowReport;

end;

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
    editLocalId.Visible := False;
    editLocalName.Visible := False;
    btnSearchLocal.Visible := False;
    lbLocal.Visible := False;
    lbLocal2.Visible := False;
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
        // if not memTable.DataSource.DataSet.IsEmpty then
        // memTable.EmptyDataSet;
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
        // if not memTable.DataSource.DataSet.IsEmpty then
        // memTable.EmptyDataSet;
        memTable.FieldDefs.Clear;
        memTable.FieldDefs.Add('Cod Prod', ftInteger);
        memTable.FieldDefs.Add('Produto', ftString, 20);
        memTable.FieldDefs.Add('Quantidade', ftFloat);
        memTable.CreateDataSet;
      end;
    2:
      begin
        // Limpar dados existentes
        // if not memTable.DataSource.DataSet.IsEmpty then
        // memTable.EmptyDataSet;
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
        // if not memTable.DataSource.DataSet.IsEmpty then
        // memTable.EmptyDataSet;
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

procedure TViewReport.ExportReportToPDF(const FileName: string);
var
  Page: TfrxReportPage;
  TitleBand: TfrxReportTitle;
  HeaderBand: TfrxPageHeader;
  FooterBand: TfrxPageFooter;
  Memo: TfrxMemoView;
  DataBand: TfrxMasterData;
  FieldData: TField;
  FieldMemo: TfrxMemoView;
  i: Integer;
  ColWidth: Double;
begin
  try
    // Reinicializar componentes do relatório
    frxReport1.Clear;
    frxReport1.EngineOptions.DestroyForms := true;
    // Garante que formulários internos sejam destruídos
    frxDBDataset1.Clear;
    frxDBDataset2.Clear;
    frxDBDataset3.Clear;
    frxDBDataset4.Clear;

    // Criar uma nova página no relatório
    Page := TfrxReportPage.Create(frxReport1);
    Page.CreateUniqueName;
    Page.LeftMargin := 10;
    Page.RightMargin := 12;
    Page.TopMargin := 5;
    Page.BottomMargin := 5;
    Page.Orientation := TPrinterOrientation.poLandscape;

    // Criar título do relatório
    TitleBand := TfrxReportTitle.Create(Page);
    TitleBand.CreateUniqueName;
    TitleBand.Height := 50;
    Memo := TfrxMemoView.Create(TitleBand);
    Memo.CreateUniqueName;

    case cbReport.ItemIndex of
      0:
        Memo.Text := 'Relatório: ' + 'Ficha de estoque';
      1:
        Memo.Text := 'Relatório: ' + 'Relação de produtos';
      2:
        Memo.Text := 'Relatório: ' + 'Relação de produtos por lote';
      3:
        Memo.Text := 'Relatório: ' + 'Produtos em estoque por Local';
    end;
    Memo.Width := Page.Width;
    Memo.Height := 50;
    Memo.HAlign := haCenter;
    Memo.Font.Size := 18;
    Memo.Font.Style := [fsBold];

    // Criar banda de cabeçalho para os nomes das colunas
    HeaderBand := TfrxPageHeader.Create(Page);
    HeaderBand.CreateUniqueName;
    // HeaderBand.Width := Page.Width - 20;
    HeaderBand.Height := 30;

    ColWidth := (Page.Width - 30) / memTable.FieldCount;

    // Adicionar os nomes das colunas ao cabeçalho
    for i := 0 to memTable.FieldCount - 1 do
    begin
      FieldData := memTable.Fields[i];
      FieldMemo := TfrxMemoView.Create(HeaderBand);
      FieldMemo.CreateUniqueName;
      FieldMemo.SetBounds(i * ColWidth, 0, ColWidth, 20);
      FieldMemo.Text := FieldData.DisplayName; // Nome legível da coluna
      FieldMemo.HAlign := haCenter;
      FieldMemo.Font.Style := [fsBold]; // Colocar o nome da coluna em negrito
      // FieldMemo.GapX := 2;
    end;

    // Criar banda de dados
    DataBand := TfrxMasterData.Create(Page);
    DataBand.CreateUniqueName;
    // DataBand.DataSet := frxDBDataset1;
    DataBand.Height := 20;

    // Configurar o frxDBDataset1 com a nova tabela de dados
    case cbReport.ItemIndex of
      0:
        begin
          frxDBDataset1.DataSet := memTable;
          DataBand.DataSet := frxDBDataset1;
        end;
      1:
        begin
          frxDBDataset2.DataSet := memTable;
          DataBand.DataSet := frxDBDataset2;
        end;
      2:
        begin
          frxDBDataset3.DataSet := memTable;
          DataBand.DataSet := frxDBDataset3;
        end;
      3:
        begin
          frxDBDataset4.DataSet := memTable;
          DataBand.DataSet := frxDBDataset4;
        end;
    end;

    // Adicionar os campos dos dados
    for i := 0 to memTable.FieldCount - 1 do
    begin
      FieldData := memTable.Fields[i];
      FieldMemo := TfrxMemoView.Create(DataBand);
      FieldMemo.CreateUniqueName;
      FieldMemo.SetBounds(i * ColWidth, 0, ColWidth, 20);

      case cbReport.ItemIndex of
        0:
          FieldMemo.DataSet := frxDBDataset1;
        1:
          FieldMemo.DataSet := frxDBDataset2;
        2:
          FieldMemo.DataSet := frxDBDataset3;
        3:
          FieldMemo.DataSet := frxDBDataset4;
      end;
      FieldMemo.DataField := FieldData.FieldName;
      FieldMemo.HAlign := haCenter;
      FieldMemo.Text := '[' + FieldData.FieldName + ']';
      // FieldMemo.Border := [bpBottom];
    end;

    // Criar banda de rodapé para data e hora
    FooterBand := TfrxPageFooter.Create(Page);
    FooterBand.CreateUniqueName;
    FooterBand.Height := 20;
    Memo := TfrxMemoView.Create(FooterBand);
    Memo.CreateUniqueName;
    Memo.Width := Page.Width;
    Memo.Height := 20;
    Memo.Text := 'Data e Hora: ' + DateTimeToStr(Now);
    Memo.HAlign := haCenter;
    Memo.VAlign := vaCenter;
    Memo.Font.Size := 10;

    // Adicionar a página ao relatório
    // frxReport1.Pages.Add(Page);

    // Preparar e exportar o relatório
    // frxReport1.PrepareReport;
    frxReport1.ShowReport;
    // frxPDFExport1.FileName := FileName;
    // frxReport1.Export(frxPDFExport1);
  finally
    // Page.Clear;
    // TitleBand.Clear;
    // HeaderBand.Clear;
    // DataBand.Clear;
    // FooterBand.Clear;
  end;
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
      memTable.FieldByName('Lote').AsString := JSONObj.GetValue<string>('lot');

      memTable.FieldByName('Fabricação').AsString :=
        JSONObj.GetValue<string>('manufacture_date');

      memTable.FieldByName('Vencimento').AsString :=
        JSONObj.GetValue<string>('expiry_date');

      memTable.FieldByName('Emissão').AsString :=
        JSONObj.GetValue<string>('created_at');

      memTable.FieldByName('Hora').AsString :=
        JSONObj.GetValue<string>('created_time');

      memTable.FieldByName('E/S').AsString := JSONObj.GetValue<string>('type');

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
      memTable.FieldByName('Lote').AsString := JSONObj.GetValue<string>('lot');

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
      memTable.FieldByName('Lote').AsString := JSONObj.GetValue<string>('lot');

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
    0:
      Report01;
    1:
      Report02;
    2:
      Report03;
    3:
      Report04;
  end;
  inherited;
end;

end.
