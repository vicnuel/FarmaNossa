program FarmaNossa;

uses
  Vcl.Forms,
  unit_main in 'unit_main.pas' {Form1},
  unit_login in 'unit_login.pas' {form_login};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

//  Application.CreateForm(Tform_login, form_login);
  form_login := Tform_login.Create(nil);
  form_login.ShowModal;

  Application.CreateForm(TForm1, Form1);

  form_login.Hide;
  form_login.Free;

  Application.Run;
end.
