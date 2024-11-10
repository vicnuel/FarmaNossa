unit Service.Report;

interface

uses Vcl.Forms, Util.ApiAccess, System.SysUtils, System.Classes,
  System.JSON, FarmaNossa.Global.DataApi, IdHTTP, Vcl.Dialogs, System.Math;

type
  TServiceReport = Class
    FApi: TApiHelper;
    Url: String;
  public
    constructor Create;
    destructor Destroy; override;
    function GetAll(Report: String; ProdId: Integer = 0;
      ProdDesc: String = ''; LocalId: Integer = 0): TJSONArray;
  End;

const
  _URL_API_USER = '/report';

implementation

constructor TServiceReport.Create;
begin
  FApi := TApiHelper.Create;
  Url := GetApiUrl() + _URL_API_USER
end;

destructor TServiceReport.Destroy;
begin
  FApi.Free;
  inherited;
end;

function TServiceReport.GetAll(Report: String; ProdId: Integer = 0;
      ProdDesc: String = ''; LocalId: Integer = 0)
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
      QueryClauses.Add('prod_id=' + ProdId.ToString);

    if LocalId > 0 then
      QueryClauses.Add('local_id=' + LocalId.ToString);

    if QueryClauses.Count > 0 then
      queryParams := '?' + String.Join('&', QueryClauses.ToStringArray);
    try

      IdHTTP := FApi.GetAPI;
      Response := IdHTTP.Get(Url + '/' + Report + queryParams);
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

end.
