unit unit_main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, View.Users0100,
  View.Products.r0200, View.Local.r0300, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
   View.Input.r1000, View.Output.r1100, View.Stock.r1200, View.Report;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N0Cadastros1: TMenuItem;
    N0100CadastrodeOperadores1: TMenuItem;
    N0200CadastrodeProdutos1: TMenuItem;
    N0300CadastrodeLocais1: TMenuItem;
    N1ControledeEstoque1: TMenuItem;
    N1000EntradadeMercadorias1: TMenuItem;
    N1100SadasdeMercadorias1: TMenuItem;
    N1200ConsultarEstoque1: TMenuItem;
    N1: TMenuItem;
    RELRelatriodeEstoque1: TMenuItem;
    Panel1: TPanel;
    Image1: TImage;
    procedure N0100CadastrodeOperadores1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N0200CadastrodeProdutos1Click(Sender: TObject);
    procedure N0300CadastrodeLocais1Click(Sender: TObject);
    procedure N1000EntradadeMercadorias1Click(Sender: TObject);
    procedure N1100SadasdeMercadorias1Click(Sender: TObject);
    procedure N1200ConsultarEstoque1Click(Sender: TObject);
    procedure RELRelatriodeEstoque1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

procedure TForm1.N0100CadastrodeOperadores1Click(Sender: TObject);
var
FormSeachUsers: TFormSeachUsers;
begin
  FormSeachUsers := TFormSeachUsers.Create(nil);
  try
   FormSeachUsers.ShowModal;
  finally
   FreeAndNil(FormSeachUsers);
  end;

end;

procedure TForm1.N0200CadastrodeProdutos1Click(Sender: TObject);
var
 FormSeachProds: TFormSeachProduct;
begin
  FormSeachProds := TFormSeachProduct.Create(nil);
  try
    FormSeachProds.ShowModal;
  finally
    FormSeachProds.Free;
  end;
end;

procedure TForm1.N0300CadastrodeLocais1Click(Sender: TObject);
var
  FormSeachLocal: TFormSeachLocal;
begin
  FormSeachLocal := TFormSeachLocal.Create(nil);
  try
    FormSeachLocal.ShowModal;
  finally
    FormSeachLocal.Free;
  end;
end;

procedure TForm1.N1000EntradadeMercadorias1Click(Sender: TObject);
var
FormSeachInput : TViewInputSearch;
begin
  FormSeachInput := TViewInputSearch.Create(nil);
  try
    FormSeachInput.ShowModal;
  finally
     FormSeachInput.Free;
  end;
end;

procedure TForm1.N1100SadasdeMercadorias1Click(Sender: TObject);
var
SFormSeachOutput: TViewSearchOutput;
begin
  SFormSeachOutput := TViewSearchOutput.Create(nil);
  try
    SFormSeachOutput.ShowModal
  finally
    SFormSeachOutput.Free;
  end;
end;

procedure TForm1.N1200ConsultarEstoque1Click(Sender: TObject);
var
SViewStock : TViewStock;
begin
  SViewStock := TViewStock.Create(nil);
  try
    SViewStock.ShowModal;
  finally
    SViewStock.Free;
  end;
end;

procedure TForm1.RELRelatriodeEstoque1Click(Sender: TObject);
var
SViewReport : TViewReport;
begin
  SViewReport := TViewReport.Create(nil);
  try
  SViewReport.ShowModal;
  finally
    SViewReport.Free;
  end;
end;

end.
