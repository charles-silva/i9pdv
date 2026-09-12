object FrmMapaBasic: TFrmMapaBasic
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Mapa'
  ClientHeight = 464
  ClientWidth = 777
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object WebGMaps1: TWebGMaps
    Left = 0
    Top = 0
    Width = 777
    Height = 464
    Align = alClient
    Clusters = <>
    Markers = <>
    Polylines = <>
    Polygons = <>
    Directions = <>
    MapOptions.DefaultLatitude = 48.859040000000000000
    MapOptions.DefaultLongitude = 2.294297000000000000
    StreetViewOptions.DefaultLatitude = 48.859040000000000000
    StreetViewOptions.DefaultLongitude = 2.294297000000000000
    MapPersist.Location = mplInifile
    MapPersist.Key = 'WebGMaps'
    MapPersist.Section = 'MapBounds'
    TabOrder = 0
    Version = '2.6.1.0'
    ExplicitLeft = 168
    ExplicitTop = 104
    ExplicitWidth = 400
    ExplicitHeight = 250
  end
  object adCliente: TFDQuery
    Connection = FrmDModule.ADConnection1
    SQL.Strings = (
      
        'SELECT _endereco_completo_map,ed_longitude,ed_latitude FROM dbo.' +
        'v_rpt_clientes where cl_codigo = :cl_codigo')
    Left = 376
    Top = 221
    ParamData = <
      item
        Name = 'CL_CODIGO'
        ParamType = ptInput
      end>
  end
  object WebGMapsGeocoding1: TWebGMapsGeocoding
    Version = '1.0.1.0'
    Left = 452
    Top = 252
  end
end
