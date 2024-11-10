unit Service.Output;

interface

uses Vcl.Forms, Util.ApiAccess, System.SysUtils, System.Classes,
  System.JSON, FarmaNossa.Global.DataApi, IdHTTP, Vcl.Dialogs;

type
  TServiceOutput = Class
    FApi: TApiHelper;
    Url: String;
  public
    constructor Create;
    destructor Destroy; override;
    function GetOutput(Id: Integer): TJSONObject;

    function GetOutputs(Id: Integer = 0; ProdId: Integer = 0;
      LocalId: Integer = 0; Lot: String = ''; FromDate: String = '';
      ToDate: String = ''): TJSONArray;

    function CreateOutput(IdProd, IdLocal: Integer; Lot: String;
  Quantity: Double): Integer;
    function UpdateOutput(Id, IdProd, IdLocal: integer ;
    Lot: String; Quantity: Double): Integer;
    function DeleteOutput(Id: Integer): boolean;
  End;

const
  _URL_API_USER = '/output';

implementation

constructor TServiceOutput.Create;
begin
  FApi := TApiHelper.Create;
  Url := GetApiUrl() + _URL_API_USER
end;

destructor TServiceOutput.Destroy;
begin
  FApi.Free;
  inherited;
end;

function TServiceOutput.GetOutput(Id: Integer): TJSONObject;
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
            ShowMessage('Sess�o inspirada. Fa�a login novamente!');
            ShowMessage('O sistema ser� encerrado!');
            Application.Terminate;
          end;
        404:
          ShowMessage('Nenhuma Saida encontrado');
      else
        ShowMessage('Erro ao buscar produto: ' + E.Message);
      end;
    end;
  end;

end;

function TServiceOutput.GetOutputs(Id: Integer = 0; ProdId: Integer = 0;
  LocalId: Integer = 0; Lot: String = ''; FromDate: String = '';
  ToDate: String = ''): TJSONArray;
var
  IdHTTP: TIdHTTP;
  Response: string;
  JsonValue: TJSONValue;
  queryParams: string;
  QueryClauses: TStringList;
  JsonArray: TJSONArray;
begin
  Result := Nil;
  QueryClauses := TStringList.Create;
  queryParams := '';
  try
    if Id > 0 then
      QueryClauses.Add('id=' + Id.ToString);

    if ProdId > 0 then
      QueryClauses.Add('prod_id=' + ProdId.ToString);

    if LocalId > 0 then
      QueryClauses.Add('local_id=' + LocalId.ToString);

    if Lot <> '' then
      QueryClauses.Add('lot=' + Lot);

    if FromDate <> '' then
      QueryClauses.Add('from_date=' + FromDate);

    if ToDate <> '' then
      QueryClauses.Add('to_date=' + ToDate);

    if QueryClauses.Count > 0 then
      queryParams := '?' + String.Join('&', QueryClauses.ToStringArray);

    try
      IdHTTP := FApi.GetAPI;
      // ShowMessage(Url + queryParams);
      Response := IdHTTP.Get(Url + queryParams);
      JsonArray := TJSONObject.ParseJSONValue(Response) as TJSONArray;

      if Assigned(JsonArray) then
        Result := JsonArray
    except
      on E: EIdHTTPProtocolException do
      begin
        case IdHTTP.ResponseCode of
          401:
            begin
              ShowMessage('Sess�oo inspirada. Fa�a login novamente!');
              ShowMessage('O sistema ser� encerrado!');
              Application.Terminate;
            end;
          404:
            ShowMessage('Nenhuma Saida encontrado');
        else
          ShowMessage('Erro: ' + E.Message);
        end;
      end;
    end;
  finally
    QueryClauses.Free;
  end;

end;

function TServiceOutput.UpdateOutput(Id, IdProd, IdLocal: integer;
  Lot: String;  Quantity: Double): Integer;
var
  IdHTTP: TIdHTTP;
  Response: string;
  JsonObj: TJSONObject;
  JsonValue: TJSONValue;
  JsonResponse: TJSONObject;
  LStream: TStringStream;
begin
  Result := 404;
  if Id <= 0 then
    exit;
  JsonObj := TJSONObject.Create;
  try
    JsonObj.AddPair('product_id', TJSONNumber.Create(IdProd));
    JsonObj.AddPair('local_id', TJSONNumber.Create(IdLocal));
    JsonObj.AddPair('quantity', TJSONNumber.Create(Quantity));
    JsonObj.AddPair('lot', Lot);
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
              ShowMessage('Sess�oo inspirada. Fa�a login novamente!');
              ShowMessage('O sistema ser� encerrado!');
              Application.Terminate;
            end;
          406:
            begin
              JsonValue := TJSONObject.ParseJSONValue(E.ErrorMessage);
              if Assigned(JsonValue) and (JsonValue is TJSONObject) then
              begin
                JsonResponse := JsonValue as TJSONObject;
                try
                  ShowMessage(JsonResponse.GetValue<string>('message'));
                finally
                  JsonValue.Free;
                end;
              end
              else
              begin
                ShowMessage('Resposta inv�lida do servidor: ' + E.ErrorMessage);
              end;
            end;
        end;
      end;
    end;
  finally
    JsonObj.Free;
    LStream.Free;
  end;

end;

// criar entrada
function TServiceOutput.CreateOutput(IdProd, IdLocal: Integer; Lot: String;
  Quantity: Double): Integer;
var
  IdHTTP: TIdHTTP;
  Response: string;
  JsonObj: TJSONObject;
  JsonValue: TJSONValue;
  JsonResponse: TJSONObject;
  LStream: TStringStream;
begin
  Result := 404;
  JsonObj := TJSONObject.Create;
  try
    JsonObj.AddPair('product_id', TJSONNumber.Create(IdProd));
    JsonObj.AddPair('local_id', TJSONNumber.Create(IdLocal));
    JsonObj.AddPair('quantity', TJSONNumber.Create(Quantity));
    JsonObj.AddPair('lot', Lot);
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
              ShowMessage('Sess�oo inspirada. Fa�a login novamente!');
              ShowMessage('O sistema ser� encerrado!');
              Application.Terminate;
            end;
          406:
            begin
              JsonValue := TJSONObject.ParseJSONValue(E.ErrorMessage);
              if Assigned(JsonValue) and (JsonValue is TJSONObject) then
              begin
                JsonResponse := JsonValue as TJSONObject;
                try
                  ShowMessage(JsonResponse.GetValue<string>('message'));
                finally
                  JsonValue.Free;
                end;
              end
              else
              begin
                ShowMessage('Resposta inv�lida do servidor: ' + E.ErrorMessage);
              end;
            end;
        end;
      end;
    end;
  finally
    JsonObj.Free;
    LStream.Free;
  end;

end;

function TServiceOutput.DeleteOutput(Id: Integer): boolean;
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
            ShowMessage('Sess�oo inspirada. Fa�a login novamente!');
            ShowMessage('O sistema ser� encerrado!');
            Application.Terminate;
          end;
        404:
          ShowMessage('entrada n�o deletada');
        406:
          ShowMessage('N�o � possivel deletar entrada');
      else
        ShowMessage('Erro ao deletar entrada: ' + E.Message);
      end;
    end;
  end;

end;

end.
