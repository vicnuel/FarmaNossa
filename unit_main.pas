unit unit_main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, View.Users0100;

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
    procedure N0100CadastrodeOperadores1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
begin
  FormSeachUsers := TFormSeachUsers.Create(nil);
  try
   FormSeachUsers.ShowModal;
  finally
   FreeAndNil(FormSeachUsers);
  end;

end;

end.
