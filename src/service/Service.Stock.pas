unit Service.Stock;

interface

uses Vcl.Forms, Util.ApiAccess, System.SysUtils, System.Classes,
  System.JSON, FarmaNossa.Global.DataApi, IdHTTP, Vcl.Dialogs, System.Math;

type
  TServiceStock = Class
    FApi: TApiHelper;
    Url: String;
  public
    constructor Create;
    destructor Destroy; override;
    function GetByProdLocalLot(ProdId: Integer; OutputId: Integer = 0)
      : TJSONArray;
    function GetAll(ProdId: Integer = 0; StatusProd: String = '';
      ProdDesc: String = ''; LocalId: Integer = 0; ZeroStock: String = '';
      GreaterThan: Double = NaN; LessThan: Double = NaN): TJSONArray;
  End;

const
  _URL_API_USER = '/stock';

implementation

constructor TServiceStock.Create;
begin
  FApi := TApiHelper.Create;
  Url := GetApiUrl() + _URL_API_USER
end;

destructor TServiceStock.Destroy;
begin
  FApi.Free;
  inherited;
end;

function TServiceStock.GetAll(ProdId: Integer; StatusProd, ProdDesc: String;
  LocalId: Integer; ZeroStock: String; GreaterThan, LessThan: Double)
  : TJSONArray;
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
    if ProdDesc <> '' then
      QueryClauses.Add('description=' + ProdDesc);

    if ProdId > 0 then
      QueryClauses.Add('product=' + ProdId.ToString);

    if StatusProd <> '' then
      QueryClauses.Add('status=' + StatusProd);

    if LocalId > 0 then
      QueryClauses.Add('local=' + LocalId.ToString);

    if ZeroStock <> '' then
      QueryClauses.Add('zerostock=' + ZeroStock);

    if not IsNan(GreaterThan) then
      QueryClauses.Add('greaterthan=' + GreaterThan.ToString);

    if not IsNan(LessThan) then
      QueryClauses.Add('lessthan=' + LessThan.ToString);

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
            begin

            end
        else
          ShowMessage('Erro ao buscar Estoque: ' + E.Message);
        end;
      end;
    end;
  finally
    QueryClauses.Free;
  end;

end;

function TServiceStock.GetByProdLocalLot(ProdId: Integer; OutputId: Integer = 0)
  : TJSONArray;
var
  IdHTTP: TIdHTTP;
  Response: string;
  JsonValue: TJSONValue;
  Query: String;
  // JsonArray: TJSONArray;
begin
  Result := Nil;

  Query := '';
  if OutputId > 0 then
    Query := '?output=' + OutputId.ToString;
  try
    IdHTTP := FApi.GetAPI;
    Response := IdHTTP.Get(Url + '/product/' + ProdId.ToString + Query);
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
          begin

          end
      else
        ShowMessage('Erro ao buscar Estoque: ' + E.Message);
      end;
    end;
  end;

end;

end.
