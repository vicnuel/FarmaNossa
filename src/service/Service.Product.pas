unit Service.Product;

interface

uses Vcl.Forms, Util.ApiAccess, System.SysUtils, System.Classes,
  System.JSON, FarmaNossa.Global.DataApi, IdHTTP, Vcl.Dialogs;

type
  TServiceProduct = Class
    FApi: TApiHelper;
    Url: String;
  public
    constructor Create;
    destructor Destroy; override;
    function GetProduct(Id: Integer): TJSONObject;
    function GetProducts(Desc: string = ''; Id: Integer = 0;
      Status: string = ''; N_stock: string = ''; S_input: string = '';
      S_output: string = ''): TJSONArray;
    function CreateProduct(Status, N_stock, S_input, S_output: boolean; Desc: string = ''): Integer;
    function UpdateProduct(Status, N_stock, S_input, S_output: boolean; Id: Integer; Desc: string = ''): Integer;
    function DeleteProduct(Id: Integer): Boolean;
  End;

const
  _URL_API_USER = '/product';

implementation

constructor TServiceProduct.Create;
begin
  FApi := TApiHelper.Create;
  Url := GetApiUrl() + _URL_API_USER
end;

destructor TServiceProduct.Destroy;
begin
  FApi.Free;
  inherited;
end;

function TServiceProduct.GetProduct(Id: Integer): TJSONObject;
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
              ShowMessage('Nenhum Produto encontrado');
        else
          ShowMessage('Erro ao buscar produto: ' + E.Message);
        end;
      end;
    end;

end;

function TServiceProduct.GetProducts(Desc: string = ''; Id: Integer = 0;
  Status: string = ''; N_stock: string = ''; S_input: string = '';
  S_output: string = ''): TJSONArray;
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

    if N_stock <> '' then
      QueryClauses.Add('n_stock=' + N_stock);

    if S_input <> '' then
      QueryClauses.Add('n_input=' + S_input);

    if S_output <> '' then
      QueryClauses.Add('s_output=' + S_output);

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
            ShowMessage('Nenhum Produto encontrado');
        else
          ShowMessage('Erro no login: ' + E.Message);
        end;
      end;
    end;
  finally
    QueryClauses.Free;
  end;

end;

function TServiceProduct.UpdateProduct(Status, N_stock, S_input,
  S_output: boolean; Id: Integer; Desc: string): Integer;
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
    JsonObj.AddPair('n_stock', TJSONBool.Create(N_stock));
    JsonObj.AddPair('s_input', TJSONBool.Create(S_input));
    JsonObj.AddPair('s_output', TJSONBool.Create(S_output));
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
function TServiceProduct.CreateProduct(Status, N_stock, S_input, S_output: Boolean; Desc: string = ''): Integer;
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
    JsonObj.AddPair('n_stock', TJSONBool.Create(N_stock));
    JsonObj.AddPair('s_input', TJSONBool.Create(S_input));
    JsonObj.AddPair('s_output', TJSONBool.Create(S_output));
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

function TServiceProduct.DeleteProduct(Id: Integer): Boolean;
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
              ShowMessage('Produto não deletado');
            406:
              ShowMessage('Não é possivel deletar produto com movimentação');
        else
          ShowMessage('Erro ao deletar produto: ' + E.Message);
        end;
      end;
    end;

end;

end.
