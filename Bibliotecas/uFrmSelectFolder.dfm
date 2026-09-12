object FrmSelectFolder: TFrmSelectFolder
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Seleciona Pasta'
  ClientHeight = 396
  ClientWidth = 379
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DirectoryListBox1: TDirectoryListBox
    Left = 0
    Top = 19
    Width = 379
    Height = 336
    Align = alClient
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 355
    Width = 379
    Height = 41
    Align = alBottom
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 5
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 86
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object DriveComboBox1: TDriveComboBox
    Left = 0
    Top = 0
    Width = 379
    Height = 19
    Align = alTop
    DirList = DirectoryListBox1
    TabOrder = 2
    TextCase = tcUpperCase
  end
end
