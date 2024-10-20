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
  Service.Users in 'src\service\Service.Users.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  // Cria e exibe o formulário de login
  Application.HelpFile := 'Sistema de Farmacia';
  Application.Title := 'Farma Nossa - Sistema de Farmacia';
  Application.CreateForm(Tform_login, form_login);
  Application.CreateForm(TFormSeach, FormSeach);
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

