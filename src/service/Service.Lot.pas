unit Service.Lot;

interface

uses Vcl.Forms, Util.ApiAccess, System.SysUtils, System.Classes,
  System.JSON, FarmaNossa.Global.DataApi, IdHTTP, Vcl.Dialogs;

type
  TServiceLot = Class
    FApi: TApiHelper;
    Url: String;
  public
    constructor Create;
    destructor Destroy; override;
    function Get(Lot: String): TJSONObject;
  End;

const
  _URL_API_USER = '/lot';

implementation

constructor TServiceLot.Create;
begin
  FApi := TApiHelper.Create;
  Url := GetApiUrl() + _URL_API_USER
end;

destructor TServiceLot.Destroy;
begin
  FApi.Free;
  inherited;
end;

function TServiceLot.Get(Lot: String): TJSONObject;
var
  IdHTTP: TIdHTTP;
  Response: string;
  JsonValue: TJSONValue;
  // JsonArray: TJSONArray;
begin
  Result := Nil;
  if Trim(Lot) = '' then
    exit;

  try
    IdHTTP := FApi.GetAPI;
    Response := IdHTTP.Get(Url + '/' + Lot);
    JsonValue := TJSONObject.ParseJSONValue(Response);
    if Assigned(JsonValue) and (JsonValue is TJSONObject) then
    begin
      Result := JsonValue as TJSONObject;
    end;
  except
    on E: EIdHTTPProtocolException do
    begin
      case IdHTTP.ResponseCode of
        401:
          begin
            ShowMessage('Sessão inspirada. Faça login novamente!');
            ShowMessage('O sistema será encerrado!');
            Application.Terminate;
          end;
        404:
          begin

          end
      else
        ShowMessage('Erro ao buscar Lot: ' + E.Message);
      end;
    end;
  end;

end;

end.
