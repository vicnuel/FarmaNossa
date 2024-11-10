unit Service.Local;

interface

uses Vcl.Forms, Util.ApiAccess, System.SysUtils, System.Classes,
  System.JSON, FarmaNossa.Global.DataApi, IdHTTP, Vcl.Dialogs;

type
  TServiceLocal = Class
    FApi: TApiHelper;
    Url: String;
  public
    constructor Create;
    destructor Destroy; override;
    function GetLocal(Id: Integer): TJSONObject;
    function GetLocais(Desc: string = ''; Id: Integer = 0; Status: string = '')
      : TJSONArray;
    function CreateLocal(Desc: string; Status: Boolean): Integer;
    function UpdateLocal(Id: Integer; Desc: string; Status: Boolean): Integer;
    function DeleteLocal(Id: Integer): Boolean;
  End;

const
  _URL_API_USER = '/local';

implementation

constructor TServiceLocal.Create;
begin
  FApi := TApiHelper.Create;
  Url := GetApiUrl() + _URL_API_USER
end;

destructor TServiceLocal.Destroy;
begin
  FApi.Free;
  inherited;
end;

function TServiceLocal.GetLocal(Id: Integer): TJSONObject;
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
              ShowMessage('Nenhum Local encontrado');
        else
          ShowMessage('Erro ao buscar Local: ' + E.Message);
        end;
      end;
    end;

end;

function TServiceLocal.GetLocais(Desc: string = ''; Id: Integer = 0; Status: string = ''): TJSONArray;
var
  IdHTTP: TIdHTTP;
  Response: string;
  JsonValue: TJSONValue;
  queryParams: string;
  QueryClauses: TStringList;
  // JsonArray: TJSONArray;
begin
  Result := Nil;
  QueryClauses := TStringList.Create;
  queryParams := '';
  try
    if Desc <> '' then
      QueryClauses.Add('description=' + Desc);

    if Id > 0 then
      QueryClauses.Add('id=' + Id.ToString);

    if Status <> '' then
      QueryClauses.Add('status=' + Status);

    if QueryClauses.Count > 0 then
      queryParams := '?' + String.Join('&', QueryClauses.ToStringArray);

    try
      IdHTTP := FApi.GetAPI;
      Response := IdHTTP.Get(Url + queryParams);
      JsonValue := TJSONObject.ParseJSONValue(Response);
      if Assigned(JsonValue) and (JsonValue is TJSONArray) then
      begin
        Result := JsonValue as TJSONArray;
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
            ShowMessage('Nenhum Local encontrado');
        else
          ShowMessage('Erro: ' + E.Message);
        end;
      end;
    end;
  finally
    QueryClauses.Free;
  end;

end;

function TServiceLocal.UpdateLocal(Id: Integer; Desc: string; Status: Boolean): Integer;
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
    JsonObj.AddPair('description', Desc);
    JsonObj.AddPair('status', TJSONBool.Create(Status));
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

// criar produto
function TServiceLocal.CreateLocal(Desc: string; Status: Boolean): Integer;
var
  IdHTTP: TIdHTTP;
  Response: string;
  JsonObj: TJSONObject;
  LStream: TStringStream;
begin
  Result := 404;
  JsonObj := TJSONObject.Create;
  try
    JsonObj.AddPair('description', Desc);
    JsonObj.AddPair('status', TJSONBool.Create(Status));
    try
      IdHTTP := FApi.GetAPI;
      LStream := TStringStream.Create(JsonObj.ToString, TEncoding.UTF8);
      Response := IdHTTP.Post(Url, LStream);

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

function TServiceLocal.DeleteLocal(Id: Integer): Boolean;
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

      Result := IdHTTP.ResponseCode = 202;
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
              ShowMessage('Local não deletado');
            406:
              ShowMessage('Não é possivel deletar local com movimentação');
        else
          ShowMessage('Erro ao deletar local: ' + E.Message);
        end;
      end;
    end;

end;

end.
