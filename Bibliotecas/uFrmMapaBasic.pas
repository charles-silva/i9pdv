unit uFrmMapaBasic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UWebGMapsCommon, UWebGMaps, UWebGMapsMarkers, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, UWebGMapsGeocoding;

type
  TFrmMapaBasic = class(TForm)
    WebGMaps1: TWebGMaps;
    adCliente: TFDQuery;
    WebGMapsGeocoding1: TWebGMapsGeocoding;
    procedure FormShow(Sender: TObject);
  private
    function AddMarker(Acl_codigo: integer; ALatitude, ALongitude: Double; ATitle: String; AIconColor: TMarkerIconColor): TMarker;
    function AddMarkerAddress(Acl_codigo: integer; Address: string; AIconColor: TMarkerIconColor; var AGeoResult: TGeoCodingResult): TMarker;
    {Private declarations}
  public
    goCliente: integer;
  end;

var
  FrmMapaBasic: TFrmMapaBasic;

implementation

uses uFrmDModule, uGlobalLibWiBi;
{$R *.dfm}

function TFrmMapaBasic.AddMarkerAddress(Acl_codigo: integer; Address: string; AIconColor: TMarkerIconColor; var AGeoResult: TGeoCodingResult): TMarker;
var
  m: TMarker;
begin
  WebGMapsGeocoding1.Address := Address;
  AGeoResult := WebGMapsGeocoding1.LaunchGeocoding;
  if AGeoResult = erOk then
  begin
    WebGMaps1.MapOptions.DefaultLatitude := WebGMapsGeocoding1.ResultLatitude;
    WebGMaps1.MapOptions.DefaultLongitude := WebGMapsGeocoding1.ResultLongitude;
    WebGMaps1.Launch;
    m := WebGMaps1.Markers.Add(WebGMapsGeocoding1.ResultLatitude, WebGMapsGeocoding1.ResultLongitude, Address);
    m.Data := IntToStr(Acl_codigo);
    // m.Cluster := Cluster;
    // m.Text := IntToStr(Ord(AIconColor));
    // m.IconWidth := 24;
    // m.IconHeight := 40;
    m.IconColor := AIconColor;
    // m.Tag := AIconColor;
    // m.Icon := GetIcon(AIconColor);
    m.DisplayName := m.Icon;
    m.Flat := true;
    Result := m;
  end
  else
    Result := nil;
end;

function TFrmMapaBasic.AddMarker(Acl_codigo: integer; ALatitude, ALongitude: Double; ATitle: String; AIconColor: TMarkerIconColor): TMarker;
var
  m: TMarker;
begin
  WebGMaps1.MapOptions.DefaultLatitude := ALatitude;
  WebGMaps1.MapOptions.DefaultLongitude := ALongitude;
  WebGMaps1.Launch;

  m := WebGMaps1.Markers.Add(ALatitude, ALongitude, ATitle);
  m.Data := IntToStr(Acl_codigo);
  // m.Cluster := Cluster;
  // m.Text := IntToStr(Ord(AIconColor));
  // m.IconWidth := 24;
  // m.IconHeight := 40;
  m.IconColor := AIconColor;
  // m.Tag := AIconColor;
  // m.Icon := GetIcon(AIconColor);
  m.DisplayName := m.Icon;
  m.Flat := true;
  Result := m;
end;

procedure TFrmMapaBasic.FormShow(Sender: TObject);
var
  loLatitude, loLongitude: Double;
  loEndereco: String;
  loMarker: TMarker;
  loGeoResult: TGeoCodingResult;
begin
  // loLatitude := StrToFloatDef(uGlobalLibWiBi.ConvertPontoPVirg(FrmDModule.cdsEmpresa.FieldByName('em_latitude').AsString), 0);
  // loLongitude := StrToFloatDef(uGlobalLibWiBi.ConvertPontoPVirg(FrmDModule.cdsEmpresa.FieldByName('em_longitude').AsString), 0);

  WebGMapsGeocoding1.PrivateKey := cAPIKey;

  WebGMaps1.MapOptions.ZoomMap := 15;
  WebGMaps1.APIKey := cAPIKey;

  adCliente.ParamByName('cl_codigo').AsInteger := goCliente;
  adCliente.Active := true;
  loLatitude := StrToFloatDef(uGlobalLibWiBi.ConvertPontoPVirg(adCliente.FieldByName('ed_latitude').AsString), 0);
  loLongitude := StrToFloatDef(uGlobalLibWiBi.ConvertPontoPVirg(adCliente.FieldByName('ed_longitude').AsString), 0);
  loEndereco := adCliente.FieldByName('_endereco_completo_map').AsString;
  if (loLatitude <> 0) and (loLongitude <> 0) then
    loMarker := AddMarker(goCliente, loLatitude, loLongitude, loEndereco, icDefault)
  else
    loMarker := AddMarkerAddress(goCliente, loEndereco, icDefault, loGeoResult);
  if WebGMaps1.Markers.Count > 0 then
  begin
    WebGMaps1.StartMarkerBounceAnimation(loMarker.ID);
    WebGMaps1.MapPanTo(WebGMaps1.Markers[0].Latitude, WebGMaps1.Markers[0].Longitude);
    WebGMaps1.MapZoomTo(WebGMaps1.Markers.Bounds);
  end;

end;

end.
