unit Util.ApiAccess;

interface
uses REST.Types, System.NetEncoding, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdCoder,
  IdCoder3to4, IdCoderMIME, FarmaNossa.Global.Auth, System.JSON,
  System.SysUtils, System.Classes;

type
  TApiHelper = class
  FIdHttp: TIdHTTP;
  FIdSSLIOHandler: TIdSSLIOHandlerSocketOpenSSL;
  public
    constructor Create;
    destructor Destroy; override;
    function GetAPI(): TIdHTTP;
  private
end;

implementation

constructor TApiHelper.Create;
begin
  inherited Create;
  try
    FIdHttp := TIdHTTP.Create(nil);
    FIdSSLIOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
    FIdHTTP.IOHandler := FIdSSLIOHandler;
    FIdHTTP.Request.ContentType := 'application/json';
    FIdHTTP.Request.CustomHeaders.Values['Authorization'] := 'Bearer ' + AuthToken;
  except
    on E: Exception do
    begin
      FreeAndNil(FIdHttp);
      FreeAndNil(FIdSSLIOHandler);
      raise;
    end;
  end;
end;

function TApihelper.GetAPI(): TIdHTTP;
begin
  Result := FIdHttp;
end;

destructor TApiHelper.Destroy;
begin
  FIdHttp.Free;
  FIdSSLIOHandler.Free;
  inherited;
end;

end.
