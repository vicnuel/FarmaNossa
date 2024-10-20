unit View.Model.Search;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFormSeach = class(TForm)
    pnTop: TPanel;
    pnBottom: TPanel;
    pnGrid: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    cbType: TComboBox;
    Label2: TLabel;
    editValue: TEdit;
    btnSearch: TButton;
    btnClose: TBitBtn;
    btnCreate: TBitBtn;
    btnSelect: TBitBtn;
    DBGrid1: TDBGrid;
    pnlTotal: TPanel;
    lbTotal: TLabel;
    DataSource1: TDataSource;
    procedure btnCloseClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure editValueKeyPress(Sender: TObject; var Key: Char);
    procedure editValueKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSearchClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cbTypeChange(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure SearchData; Virtual;
  public
    { Public declarations }
  end;

var
  FormSeach: TFormSeach;

implementation

{$R *.dfm}

procedure TFormSeach.SearchData;
begin
  lbTotal.Caption := 'Registros: 000000';
  if (DataSource1.DataSet.IsEmpty) then
    Exit;

  lbTotal.Caption := 'Registros: ' + FormatFloat('000000', DataSource1.DataSet.RecordCount);
end;

procedure TFormSeach.btnCloseClick(Sender: TObject);
begin
  Self.Close;
  Self.ModalResult := mrCancel;
end;

procedure TFormSeach.btnSearchClick(Sender: TObject);
begin
  Self.SearchData;
end;

procedure TFormSeach.btnSelectClick(Sender: TObject);
begin
  if (DataSource1.DataSet.IsEmpty) then
    raise Exception.Create('Selecione um regitro');
  Self.Close;
  Self.ModalResult := mrOk;
end;

procedure TFormSeach.cbTypeChange(Sender: TObject);
begin
  editValue.Text := '';
  if cbType.Text = 'Código' then
    editValue.NumbersOnly := True
  else
    editValue.NumbersOnly := False;


end;

procedure TFormSeach.DBGrid1DblClick(Sender: TObject);
begin
  btnSelect.Click;
end;

procedure TFormSeach.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (not Odd(DataSource1.DataSet.RecNo)) then
    DBGrid1.Canvas.Brush.Color := $00DDDDDD;

  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFormSeach.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (not DataSource1.DataSet.IsEmpty) then
    btnSelect.Click;
end;

procedure TFormSeach.editValueKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_UP: DataSource1.DataSet.Prior;
    VK_DOWN: DataSource1.DataSet.Next;
  end;
end;

procedure TFormSeach.editValueKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (not DataSource1.DataSet.IsEmpty) then // Se a tecla pressionada for "Enter"
  begin
    Key := #0; // Anula o som do "beep"
    btnSearch.Click;
  end;
end;

procedure TFormSeach.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFormSeach.FormShow(Sender: TObject);
begin
  Self.ModalResult := mrCancel;
  editValue.SetFocus;
end;

end.
