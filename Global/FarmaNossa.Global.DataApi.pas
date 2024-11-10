unit FarmaNossa.Global.DataApi;

interface

uses Service.VariableInRegistry, System.SysUtils;

var
  URL: String;

function GetApiUrl(): String;

implementation

function GetApiUrl(): String;
var
  Server: String;

begin
  if URL <> '' then
  begin
    Result := URL;
  end;

  Server := Trim(GetEnvVariableFromRegistry('FARMA_NOSSA_API_URL'));
  if Server = '' then
    raise Exception.Create('Servidor não configurado');
  URL := Server;
  Result := Server;
end;

end.
