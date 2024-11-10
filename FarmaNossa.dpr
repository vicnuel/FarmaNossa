program FarmaNossa;

uses
  Vcl.Forms,
  unit_main in 'unit_main.pas' {Form1},
  unit_login in 'unit_login.pas' {form_login},
  Vcl.Themes,
  Vcl.Styles,
  FarmaNossa.Global.Auth in 'Global\FarmaNossa.Global.Auth.pas',
  View.Model.Search in 'src\view\model\View.Model.Search.pas' {FormSeach},
  View.Users0100 in 'src\view\Users\View.Users0100.pas' {FormSeachUsers},
  Util.ApiAccess in 'src\util\Util.ApiAccess.pas',
  FarmaNossa.Global.DataApi in 'Global\FarmaNossa.Global.DataApi.pas',
  Service.Users in 'src\service\Service.Users.pas',
  View.Model.Create in 'src\view\model\View.Model.Create.pas' {ViewModelCreate},
  View.Users.Create in 'src\view\Users\View.Users.Create.pas' {ViewUserCreate},
  View.Products.r0200 in 'src\view\Products\View.Products.r0200.pas' {FormSeachProduct},
  Service.Product in 'src\service\Service.Product.pas',
  View.Products.Create in 'src\view\Products\View.Products.Create.pas' {ViewCreateProduct},
  Service.Local in 'src\service\Service.Local.pas',
  View.Local.r0300 in 'src\view\Local\View.Local.r0300.pas' {FormSeachLocal},
  View.Local.Create in 'src\view\Local\View.Local.Create.pas' {ViewLocalCreate},
  Service.Input in 'src\service\Service.Input.pas',
  View.Model.SearchEntry in 'src\view\model\View.Model.SearchEntry.pas' {ViewModelSearchEntry},
  View.Input.r1000 in 'src\view\Input\View.Input.r1000.pas' {ViewInputSearch},
  View.Input.Create in 'src\view\Input\View.Input.Create.pas' {ViewInputCreate},
  Service.Lot in 'src\service\Service.Lot.pas',
  Service.Output in 'src\service\Service.Output.pas',
  View.Output.r1100 in 'src\view\Output\View.Output.r1100.pas' {ViewSearchOutput},
  View.Output.Create in 'src\view\Output\View.Output.Create.pas' {ViewOutputCreate},
  Service.Stock in 'src\service\Service.Stock.pas',
  View.Stock.r1200 in 'src\view\Stock\View.Stock.r1200.pas' {ViewStock},
  Service.Report in 'src\service\Service.Report.pas',
  View.Report in 'src\view\Report\View.Report.pas' {ViewReport},
  Service.VariableInRegistry in 'src\service\Service.VariableInRegistry.pas',
  View.Config in 'src\view\Config\View.Config.pas' {ViewFormConfig};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  // Cria e exibe o formulário de login
  Application.HelpFile := 'Sistema de Farmacia';
  Application.Title := 'Farma Nossa - Sistema de Farmacia';
  Application.CreateForm(Tform_login, form_login);
  if form_login.ShowModal = 1 then
  begin
    // Se o login for bem-sucedido, exibe o formulário principal
    form_login.Free;
    Application.CreateForm(TForm1, Form1);
    Application.Run;
  end
  else
  begin
    // Se o login não for bem-sucedido, encerra a aplicação
    Application.Terminate;
  end;
end.

