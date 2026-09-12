object FrmPDV_ImportaComanda: TFrmPDV_ImportaComanda
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 129
  ClientWidth = 229
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 13
  object Shape27: TShape
    Left = 0
    Top = 24
    Width = 229
    Height = 105
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Brush.Style = bsClear
    Pen.Color = 11383299
    ExplicitLeft = -5
    ExplicitTop = 23
    ExplicitWidth = 647
    ExplicitHeight = 279
  end
  object Shape16: TShape
    Left = 0
    Top = 0
    Width = 229
    Height = 24
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Brush.Color = 5986569
    ExplicitLeft = 13
    ExplicitWidth = 443
  end
  object Label38: TLabel
    Left = 137
    Top = 2
    Width = 84
    Height = 19
    Caption = 'Comanda'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Lucida Console'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = []
  end
  object lblUser: TLabel
    Left = 12
    Top = 38
    Width = 116
    Height = 16
    Caption = 'N'#186' Ficha / Mesa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edFichaMesa: TcxCurrencyEdit
    Left = 12
    Top = 55
    EditValue = 0.000000000000000000
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Properties.AssignedValues.DisplayFormat = True
    Properties.DecimalPlaces = 0
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -17
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.LookAndFeel.SkinName = 'Blue'
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 0
    Width = 116
  end
  object Memo1: TMemo
    Left = 236
    Top = 144
    Width = 65
    Height = 57
    Lines.Strings = (
      'EXEC pdv.proc_add_item_nf @max = 0, -- int'
      '    @pnf_id = @pnf_id_in, -- int'
      '    @pr_codigo = @pr_codigo_in, -- int'
      '    @un_sigla = @un_sigla_in, -- varchar(3)'
      '    @pnfi_qtd = @pnfi_qtd_in, -- numeric'
      '    @pnfi_valor_unit = @pnfi_valor_unit_in, -- numeric'
      '    @pnfi_desconto = @pnfi_desconto_in, -- numeric'
      '    @nop_id = 1, -- int'
      '  @pnfi_id_comanda = @pnfi_id_comanda_in')
    TabOrder = 1
    Visible = False
    WordWrap = False
  end
  object WiEventsForm1: TWiEventsForm
    IDControl = edFichaMesa
    OnKeyDownEscape = WiEventsForm1KeyDownEscape
    Left = 340
    Top = 24
  end
  object FDSysPDV: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=masterkey'
      'Database=C:\Syspdv\syspdv_srv.fdb'
      'Server=192.168.0.200'
      'Protocol=TCPIP'
      'DriverID=FB')
    ResourceOptions.AssignedValues = [rvCmdExecMode]
    ResourceOptions.CmdExecMode = amNonBlocking
    LoginPrompt = False
    Left = 28
    Top = 96
  end
  object FDScript1: TFDScript
    SQLScripts = <
      item
        Name = 'TRANSACAO'
      end>
    Connection = FrmPDV_DModule.ADConnection1
    Params = <>
    Macros = <>
    ResourceOptions.AssignedValues = [rvCmdExecMode]
    ResourceOptions.CmdExecMode = amNonBlocking
    Left = 104
    Top = 72
  end
  object fdComandaItensSource: TFDQuery
    Connection = FDSysPDV
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvCmdExecMode]
    ResourceOptions.CmdExecMode = amNonBlocking
    SQL.Strings = (
      'SELECT  b.CSO_NUMERO,a.PROCOD ,'
      '        a.CSI_QTD_VENDA ,'
      '        a.CSI_PRECO_VENDA'
      
        'FROM    CONSUMO_ITEM a INNER JOIN CONSUMO b ON a.CSO_NUMERO =b.C' +
        'SO_NUMERO'
      'WHERE   b.CSO_STATUS = '#39'A'#39' AND '
      #9'    a.CSI_STATUS = '#39'1'#39' AND  '
      #9#9'cast(b.FICCOD as int)= :FICCOD'
      '')
    Left = 84
    Top = 100
    ParamData = <
      item
        Name = 'FICCOD'
        DataType = ftInteger
        ParamType = ptInput
        Value = '15'
      end>
  end
end
