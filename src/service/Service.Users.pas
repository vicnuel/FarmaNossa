unit Service.Users;

interface

uses Vcl.Forms, Util.ApiAccess, System.SysUtils, System.Classes,
System.JSON, FarmaNossa.Global.DataApi, IdHTTP, Vcl.Dialogs;

type
  TServiceUser = Class
  FApi: TApiHelper;
  Url: String;
  public
    constructor Create;
    destructor Destroy; override;
    function GetUsers(Name: String = ''; Id: Integer = 0): TJSONArray;
    function CreateUser(Name, Login, Password: String): Integer;
    function Get(Id: Integer): TJSONObject;
    function Update(Id: Integer; Name, Password: String): Integer;
    function Delete(Id: Integer): Boolean;
End;

const
_URL_API_USER = '/user';

implementation

constructor TServiceUser.Create;
begin
  FApi := TApiHelper.Create;
  Url := GetApiUrl() + _URL_API_USER
end;

function TServiceUser.Delete(Id: Integer): Boolean;
var
  IdHTTP: TIdHTTP;
  Response: string;
begin
  Result := False;
  if Id < 0 then
    exit;

    try
      IdHTTP := FApi.GetAPI;
      Response := IdHTTP.Delete(Url + '/' + Id.ToString);

      Result := IdHTTP.ResponseCode = 200;
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
              ShowMessage('Usuário não deletado');
            406:
              ShowMessage('Não é possivel deletar usuário com movimentação');
        else
          ShowMessage('Erro ao deletar usuário: ' + E.Message);
        end;
      end;
    end;

end;

destructor TServiceUser.Destroy;
begin
  FApi.Free;
  inherited;
end;

function TServiceUser.Get(Id: Integer): TJSONObject;
var
  IdHTTP: TIdHTTP;
  Response: string;
  JsonValue: TJSONValue;
  // JsonArray: TJSONArray;
begin
  Result := Nil;
  if Id < 0 then
    exit;

    try
      IdHTTP := FApi.GetAPI;
      Response := IdHTTP.Get(Url + '/' + Id.ToString);
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
              ShowMessage('Nenhum Usuário encontrado');
        else
          ShowMessage('Erro ao buscar Usuário: ' + E.Message);
        end;
      end;
    end;

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
          case IdHttp.ResponseCode of
            401:
              begin
                ShowMessage('Sessão inspirada. Faça login novamente!');
                ShowMessage('O sistema será encerrado!');
                Application.Terminate;
              end;
            404: ShowMessage('Nenhum usuário encontrado');
            else ShowMessage('Erro: ' + E.Message);
          end;
        end;
    end;
  finally
    QueryClauses.Free;
  end;

end;


function TServiceUser.Update(Id: Integer; Name, Password: String): Integer;
var
  IdHTTP: TIdHTTP;
  Response: string;
  JsonObj: TJSONObject;
  LStream: TStringStream;
begin
  Result := 404;
  if Id <= 0 then
    exit;
  JsonObj := TJSONObject.Create;
  try
    JsonObj.AddPair('name', Name);
    JsonObj.AddPair('password', Password);
    try
      IdHTTP := FApi.GetAPI;
      LStream := TStringStream.Create(JsonObj.ToString, TEncoding.UTF8);
      Response := IdHTTP.PUT(Url + '/' + Id.ToString, LStream);

      // if IdHttp.ResponseCode = 201 then
    Result := IdHTTP.ResponseCode;

    except
      on E: EIdHTTPProtocolException do
      begin
        Result := IdHTTP.ResponseCode;
        case IdHTTP.ResponseCode of
          401:
            begin
              ShowMessage('Sessão inspirada. Faça login novamente!');
              ShowMessage('O sistema será encerrado!');
              Application.Terminate;
            end;
        end;
      end;
    end;
  finally
    JsonObj.Free;
    LStream.Free;
  end;

end;


// criar usuário
function TServiceUser.CreateUser(Name, Login, Password: String): Integer;
var
IdHttp: TIdHTTP;
Response: string;
JsonObj: TJSONObject;
LStream: TStringStream;
begin
  Result := 404;
  JsonObj := TJSONObject.Create;
  try
    JsonObj.AddPair('name', Name);
    JsonObj.AddPair('login', Login);
    JsonObj.AddPair('password', Password);
    try
      IdHttp := FApi.GetAPI;
      LStream := TStringStream.Create(JsonObj.ToString, TEncoding.UTF8);
      Response := IdHttp.Post(Url, LStream);

//    if IdHttp.ResponseCode = 201 then
      Result := IdHttp.ResponseCode;


    except on E: EIdHTTPProtocolException do
        begin
          Result:= IdHttp.ResponseCode;
          case IdHttp.ResponseCode of
            401:
              begin
                ShowMessage('Sessão inspirada. Faça login novamente!');
                ShowMessage('O sistema será encerrado!');
                Application.Terminate;
              end;
          end;
        end;
    end;
  finally
    JsonObj.Free;
    LStream.Free;
  end;

end;

end.

