unit Service.Users;

interface

uses Util.ApiAccess, System.SysUtils, System.Classes,
System.JSON, FarmaNossa.Global.DataApi, IdHTTP, Vcl.Dialogs;

type
  TServiceUser = Class
  FApi: TApiHelper;
  Url: String;
  public
    constructor Create;
    destructor Destroy; override;
    function GetUsers(): TJSONArray;
End;

const
_URL_API_USER = '/user';

implementation

constructor TServiceUser.Create;
begin
  FApi := TApiHelper.Create;
  Url := GetApiUrl() + _URL_API_USER
end;

destructor TServiceUser.Destroy;
begin
  FApi.Free;
  inherited;
end;

function TServiceUser.GetUsers(): TJSONArray;
var
IdHttp: TIdHTTP;
Response: string;
JsonValue: TJSONValue;
//JsonArray: TJSONArray;
begin
  Result := Nil;
  try
    IdHttp := FApi.GetAPI;
    Response := IdHttp.Get(Url);
    JsonValue := TJSONObject.ParseJSONValue(Response);
    if Assigned(JSONValue) and (JSONValue is TJSONArray) then
    begin
      Result := JsonValue as TJSONArray;
    end;
  except on E: EIdHTTPProtocolException do
      begin
        ShowMessage('Erro no login: ' + E.Message);
      end;
  end;

end;

end.

