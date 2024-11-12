unit View.Input.Create;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Model.Create, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Service.Product, Service.Local,
  System.Json, View.Products.r0200, View.Local.r0300, Service.Lot,
  Service.Input, System.StrUtils, Vcl.Mask;

type
  TViewInputCreate = class(TViewModelCreate)
    Label6: TLabel;
    editCod: TEdit;
    Label1: TLabel;
    btnSeachProd: TButton;
    editProdId: TEdit;
    editProdName: TEdit;
    Label3: TLabel;
    btnSearchLocal: TButton;
    editLocalId: TEdit;
    Label4: TLabel;
    editLocalName: TEdit;
    Label2: TLabel;
    dtFab: TDateTimePicker;
    labelLocal: TLabel;
    dtExp: TDateTimePicker;
    btnCleanDateExp: TButton;
    Label5: TLabel;
    editLot: TEdit;
    Label7: TLabel;
    editQuant: TEdit;
    Label8: TLabel;
    procedure btnSeachProdClick(Sender: TObject);
    procedure editProdIdChange(Sender: TObject);
    procedure editProdIdKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure editProdIdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editLocalIdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSearchLocalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnCleanDateExpClick(Sender: TObject);
    procedure dtFabChange(Sender: TObject);
    procedure dtExpChange(Sender: TObject);
    procedure editLotKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editLotExit(Sender: TObject);
    procedure btnCreateClick(Sender: TObject);
    procedure editQuantKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure editLocalIdChange(Sender: TObject);
  private
    FidLocal: Integer;
    FidProd: Integer;
    CloseOnShow: Boolean;
    procedure SetidLocal(const Value: Integer);
    procedure SetidProd(const Value: Integer);
    { Private declarations }
  protected
    procedure SearchProduct(Id: Integer);
    property idProd: Integer read FidProd write SetidProd;
    procedure SearchLocal(Id: Integer);
    property idLocal: Integer read FidLocal write SetidLocal;
    procedure SearchLot(Lot: String);
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TViewInputCreate.btnCleanDateExpClick(Sender: TObject);
begin
  inherited;
  dtExp.Format := ' ';
  dtFab.Format := ' ';
  editLot.Text := '';

  editLot.Enabled := True;
  dtFab.Enabled := True;
  dtExp.Enabled := True;
end;

procedure TViewInputCreate.btnCreateClick(Sender: TObject);
var
  status: Integer;
  SInput: TServiceInput;
begin
  if loading then
    exit;
  if (Trim(editLot.Text) <> '') then
    SearchLot(Trim(editLot.Text));

  if idProd <= 0 then
  begin
    ShowMessage('Escolha o produto');
    editProdId.SetFocus;
    exit;
  end;

  if idLocal <= 0 then
  begin
    ShowMessage('Escolha o local');
    editLocalId.SetFocus;
    exit;
  end;

  if Trim(editLot.Text) = '' then
  begin
    ShowMessage('Informe o lote do produto');
    editLot.SetFocus;
    exit;
  end;

  if dtFab.Format = ' ' then
  begin
    ShowMessage('Informe a data de fabricação do lote');
    dtFab.SetFocus;
    exit;
  end;

  if dtExp.Format = ' ' then
  begin
    ShowMessage('Informe a data de expiração do lote');
    dtExp.SetFocus;
    exit;
  end;

  if (dtExp.Format <> 'dd/MM/yyyy') and (dtExp.Date < dtFab.Date) then
  begin
    dtExp.Format := ' ';
    raise Exception.Create('Data de vencimento menor que de fabricação');
  end;

  if Trim(editQuant.Text) = '' then
  begin
    ShowMessage('Informe a quantidade');
    editQuant.SetFocus;
    exit;
  end;

  if StrtoFloat(editQuant.Text) <= 0 then
  begin
    ShowMessage('Informe a quantidade');
    editQuant.SetFocus;
    exit;
  end;

  loading := True;
  Screen.Cursor := crHourGlass;
  btnCreate.Enabled := false;

  SInput := TServiceInput.Create;
  try
    if idRegister > 0 then
      status := SInput.UpdateInput(idRegister, idProd, idLocal,
        StrtoFloat(editQuant.Text), Trim(editLot.Text), DateToStr(dtFab.Date),
        DateToStr(dtExp.Date))
    else
      status := SInput.CreateInput(idProd, idLocal, StrtoFloat(editQuant.Text),
        Trim(editLot.Text), DateToStr(dtFab.Date), DateToStr(dtExp.Date));

    case status of
      201:
        begin
          ShowMessage('Entrada lançada com sucesso');
          inherited;
        end;
      202:
        begin
          ShowMessage('Entrada atualizada com sucesso');
          inherited;
        end;
      406:
        begin
        end;
    else
      ShowMessage('Entrada não lançada');
    end;

  finally
    SInput.Free;
    loading := false;
    Screen.Cursor := crDefault;
    btnCreate.Enabled := True;
  end;

  // inherited;
end;

procedure TViewInputCreate.btnSeachProdClick(Sender: TObject);
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

procedure TViewInputCreate.btnSearchLocalClick(Sender: TObject);
var
  FSeachLocal: TFormSeachLocal;
begin
  inherited;
  FSeachLocal := TFormSeachLocal.Create(nil);
  try
    FSeachLocal.ShowModal;
    if FSeachLocal.ResultSelect > 0 then
      SearchLocal(FSeachLocal.ResultSelect);

  finally
    FSeachLocal.Free;
  end;
end;

procedure TViewInputCreate.Button1Click(Sender: TObject);
begin
  inherited;
  dtFab.Format := ' ';
end;

procedure TViewInputCreate.dtExpChange(Sender: TObject);
begin
  inherited;
  dtExp.Format := 'dd/MM/yyyy';
  if (dtFab.Format = 'dd/MM/yyyy') and (dtExp.Date < dtFab.Date) then
  begin
    dtExp.Format := ' ';
    raise Exception.Create('Data de vencimento menor que de fabricação');
  end;

  if (Trim(editLot.Text) <> '') then
    SearchLot(Trim(editLot.Text));
end;

procedure TViewInputCreate.dtFabChange(Sender: TObject);
begin
  inherited;
  dtFab.Format := 'dd/MM/yyyy';
  if (dtExp.Format = 'dd/MM/yyyy') and (dtExp.Date < dtFab.Date) then
  begin
    dtExp.Format := ' ';
    raise Exception.Create('Data de vencimento menor que de fabricação');
  end;
  if (Trim(editLot.Text) <> '') then
    SearchLot(Trim(editLot.Text));
end;

procedure TViewInputCreate.editLocalIdChange(Sender: TObject);
begin
  inherited;
  if (Trim(editLocalId.Text) = '') then
  begin
    idLocal := 0;
    editLocalName.Text := '';
    exit;
  end;
  if (Trim(editLocalId.Text).ToInteger() <> idLocal) then
  begin
    idLocal := 0;
    editLocalName.Text := '';
  end;
end;

procedure TViewInputCreate.editLocalIdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_RETURN:
      begin
        if (Trim(editLocalId.Text) <> '') then
          SearchLocal(Trim(editLocalId.Text).ToInteger());
      end;
  end;
end;

procedure TViewInputCreate.editLotExit(Sender: TObject);
begin
  inherited;
  if (Trim(editLot.Text) <> '') then
    SearchLot(Trim(editLot.Text));
end;

procedure TViewInputCreate.editLotKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_RETURN:
      begin
        if (Trim(editLot.Text) <> '') then
          SearchLot(Trim(editLot.Text));
      end;
  end;
end;

procedure TViewInputCreate.editProdIdChange(Sender: TObject);
begin
  if (Trim(editProdId.Text) = '') then
  begin
    idProd := 0;
    editProdName.Text := '';
    exit;
  end;
  if (Trim(editProdId.Text).ToInteger() <> idProd) then
  begin
    idProd := 0;
    editProdName.Text := '';
  end;

end;

procedure TViewInputCreate.editProdIdKeyDown(Sender: TObject; var Key: Word;
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

procedure TViewInputCreate.editProdIdKeyPress(Sender: TObject; var Key: Char);
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

procedure TViewInputCreate.editQuantKeyPress(Sender: TObject; var Key: Char);
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

procedure TViewInputCreate.FormActivate(Sender: TObject);
begin
  inherited;
  if CloseOnShow then
    ModalResult := mrCancel;
end;

procedure TViewInputCreate.FormCreate(Sender: TObject);
begin
  inherited;
  dtFab.Format := ' ';
  dtExp.Format := ' ';
  idProd := 0;
  idLocal := 0;

end;

procedure TViewInputCreate.FormShow(Sender: TObject);
var
  SInput: TServiceInput;
  JsonInput: TJSONObject;
begin
  inherited;
  Self.ModalResult := mrCancel;
  if (idRegister > 0) then
    editCod.Text := idRegister.ToString
  else
  begin
    inherited;
    editProdId.SetFocus;
    exit;
  end;

  SInput := TServiceInput.Create;
  try
    JsonInput := SInput.GetInput(idRegister);
    if not Assigned(JsonInput) then
    begin
      PostMessage(Self.Handle, WM_CLOSE, 0, 0);
      CloseOnShow := True;
      exit;
    end;
    inherited;

    SearchProduct(JsonInput.GetValue<Integer>('product_id'));
    SearchLocal(JsonInput.GetValue<Integer>('local_id'));
    editLot.Text := JsonInput.GetValue<string>('lot');
    SearchLot(editLot.Text);

    editQuant.Text := FormatFloat('0.##', JsonInput.GetValue<Double>('quantity')
      ).Replace('.', ',');

  finally
    SInput.Free;
    JsonInput.Free;
  end;

end;

procedure TViewInputCreate.SearchLocal(Id: Integer);
var
  SLocal: TServiceLocal;
  JsonObject: TJSONObject;
  status: Boolean;
begin
  SLocal := TServiceLocal.Create();
  try
    JsonObject := SLocal.GetLocal(Id);
    if Assigned(JsonObject) then
    begin
      status := JsonObject.GetValue<Boolean>('status');
      if not status then
      begin
        ShowMessage('Local Inativo');
        idLocal := 0;
        editLocalId.Text := '';
        editLocalName.Text := '';
        editLocalId.SetFocus;
        exit;
      end;
      idLocal := JsonObject.GetValue<Integer>('id');
      editLocalId.Text := idLocal.ToString;
      editLocalName.Text := JsonObject.GetValue<string>('description');
    end
    else
    begin
      idLocal := 0;
      editLocalId.Text := '';
      editLocalName.Text := '';
      editLocalId.SetFocus;
    end;
  finally
    SLocal.Free;
    JsonObject.Free;
  end;

end;

procedure TViewInputCreate.SearchLot(Lot: String);
var
  SLot: TServiceLot;
  DateExp, DateFab: String;
  JsonObj: TJSONObject;
begin
  SLot := TServiceLot.Create;
  try
    JsonObj := SLot.Get(Lot);
    if Assigned(JsonObj) then
    begin
      editLot.Text := JsonObj.GetValue<string>('lot');
      DateExp := JsonObj.GetValue<string>('expiry_date');
      DateFab := JsonObj.GetValue<string>('manufacture_date');

      dtFab.Date := StrToDate(DateFab);
      dtExp.Date := StrToDate(DateExp);

      editLot.Enabled := false;
      dtFab.Format := 'dd/MM/yyyy';
      dtExp.Format := 'dd/MM/yyyy';

      dtFab.Enabled := false;
      dtExp.Enabled := false;

      editQuant.SetFocus;

    end;

  finally
    SLot.Free;
    JsonObj.Free;
  end;
end;

procedure TViewInputCreate.SearchProduct(Id: Integer);
var
  SProd: TServiceProduct;
  JsonObject: TJSONObject;
  status, s_input: Boolean;
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
        editProdId.SetFocus;
        exit;
      end;

      s_input := JsonObject.GetValue<Boolean>('s_input');
      if not s_input then
      begin
        ShowMessage('Produto não permite entrada');
        idProd := 0;
        editProdId.Text := '';
        editProdName.Text := '';
        editProdId.SetFocus;
        exit;
      end;
      idProd := JsonObject.GetValue<Integer>('id');
      editProdId.Text := idProd.ToString;
      editProdName.Text := JsonObject.GetValue<string>('description');
    end
    else
    begin
      idProd := 0;
      editProdId.Text := '';
      editProdName.Text := '';
      editProdId.SetFocus;
    end;
  finally
    SProd.Free;
    JsonObject.Free;
  end;
end;

procedure TViewInputCreate.SetidLocal(const Value: Integer);
begin
  FidLocal := Value;
end;

procedure TViewInputCreate.SetidProd(const Value: Integer);
begin
  FidProd := Value;
end;

end.
