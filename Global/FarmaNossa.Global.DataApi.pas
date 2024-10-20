unit FarmaNossa.Global.DataApi;

interface

function GetApiUrl(): String;

implementation

function GetApiUrl(): String;
begin
  Result := 'http://localhost:1000';
end;

end.
