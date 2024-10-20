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
    function GetUsers(Name: String = ''; Id: Integer = 0): TJSONArray;
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

function TServiceUser.GetUsers(Name: String = ''; Id: Integer = 0): TJSONArray;
var
IdHttp: TIdHTTP;
Response: string;
JsonValue: TJSONValue;
queryParams: string;
QueryClauses: TStringList;
//JsonArray: TJSONArray;
begin
  Result := Nil;
  QueryClauses := TStringList.Create;
  queryParams := '';
  try
    if Name <> '' then
      QueryClauses.Add('name='+ Name);
    if Id > 0 then
      QueryClauses.Add('id=' + Id.ToString);
    if QueryClauses.Count > 0 then
      queryParams := '?' + String.Join('&', QueryClauses.ToStringArray);
    
    try
      IdHttp := FApi.GetAPI;
      Response := IdHttp.Get(Url + queryParams);
      JsonValue := TJSONObject.ParseJSONValue(Response);
      if Assigned(JSONValue) and (JSONValue is TJSONArray) then
      begin
        Result := JsonValue as TJSONArray;
      end;
    except on E: EIdHTTPProtocolException do
        begin
          if IdHttp.ResponseCode = 404 then
            ShowMessage('Nenhum usuário encontrado')
          else 
            ShowMessage('Erro no login: ' + E.Message);
        end;
    end;
  finally
    QueryClauses.Free;
  end;

end;

end.

