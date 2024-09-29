unit unit_login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage;

type
  Tform_login = class(TForm)
    pnl_background: TPanel;
    pnl_left: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    pnl_user: TPanel;
    Label6: TLabel;
    edit_user: TEdit;
    Panel2: TPanel;
    pnl_pass: TPanel;
    Label7: TLabel;
    Edit2: TEdit;
    Panel3: TPanel;
    Panel1: TPanel;
    btn_login: TSpeedButton;
    btn_close: TSpeedButton;
    Label8: TLabel;
    Image1: TImage;
    procedure btn_closeClick(Sender: TObject);
    procedure btn_loginClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_login: Tform_login;

implementation

{$R *.dfm}

procedure Tform_login.btn_loginClick(Sender: TObject);
begin
  Close;
end;

procedure Tform_login.FormActivate(Sender: TObject);
begin
  pnl_background.Left :=  Round((form_login.Width - pnl_background.Width)/2);
  pnl_background.Top :=  Round((form_login.Height - pnl_background.Height)/2);

end;

procedure Tform_login.btn_closeClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.
