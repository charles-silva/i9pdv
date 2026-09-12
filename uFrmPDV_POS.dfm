object FrmPDV_POS: TFrmPDV_POS
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FrmPDV_POS'
  ClientHeight = 442
  ClientWidth = 593
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
  DesignSize = (
    593
    442)
  TextHeight = 13
  object Shape27: TShape
    Left = 0
    Top = 32
    Width = 593
    Height = 410
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Brush.Style = bsClear
    Pen.Color = clSilver
    ExplicitTop = 264
    ExplicitHeight = 178
  end
  object Shape16: TShape
    Left = 0
    Top = 0
    Width = 593
    Height = 32
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Brush.Color = 5986569
    ExplicitWidth = 699
  end
  object lblTitle: TLabel
    Left = 12
    Top = 7
    Width = 372
    Height = 19
    Caption = 'Selecione um POS para pagamento'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Lucida Console'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = []
  end
  object lblMsgRapida: TLabel
    Left = 18
    Top = 416
    Width = 217
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Pressione [Enter] para confirmar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = []
  end
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 32
    Width = 593
    Height = 369
    TabOrder = 0
    Properties.ActivePage = cxtabshitPOS
    Properties.AllowTabDragDrop = True
    Properties.CustomButtons.Buttons = <>
    Properties.Style = 11
    ClientRectBottom = 369
    ClientRectRight = 593
    ClientRectTop = 20
    object cxtabshitPOS: TcxTabSheet
      Caption = 'Selecione um POS'
      ImageIndex = 0
      DesignSize = (
        593
        349)
      object lstListPOS: TcxListView
        Left = 2
        Top = 7
        Width = 591
        Height = 383
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Columns = <
          item
            Caption = 'C'#243'digo'
            Width = 60
          end
          item
            Caption = 'Descri'#231#227'o'
            Width = 220
          end
          item
            Caption = 'Serial POS'
            Width = 160
          end>
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        RowSelect = True
        ShowColumnHeaders = False
        ShowHint = True
        Style.BorderStyle = cbsNone
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -20
        Style.Font.Name = 'Courier New'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.NativeStyle = True
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.BorderStyle = cbsNone
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.BorderStyle = cbsNone
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object cxTabSheet3: TcxTabSheet
      Caption = 'Operadores'
      ImageIndex = 2
      object cxListOperadoras: TcxListView
        Left = 0
        Top = 0
        Width = 593
        Height = 349
        Align = alClient
        Columns = <
          item
            Caption = 'C'#243'digo'
            Width = 70
          end
          item
            Caption = 'Descri'#231#227'o'
            Width = 320
          end>
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        RowSelect = True
        ShowColumnHeaders = False
        ShowHint = True
        Style.BorderStyle = cbsNone
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -20
        Style.Font.Name = 'Courier New'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        StyleFocused.BorderStyle = cbsNone
        StyleHot.BorderStyle = cbsNone
        TabOrder = 0
        ViewStyle = vsReport
        ExplicitLeft = 8
        ExplicitTop = 13
        ExplicitWidth = 403
        ExplicitHeight = 336
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Prazo para pagamento'
      ImageIndex = 1
      DesignSize = (
        593
        349)
      object cxListView1: TcxListView
        Left = 2
        Top = 7
        Width = 591
        Height = 383
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Columns = <
          item
            Caption = 'C'#243'digo'
            Width = 60
          end
          item
            Caption = 'Descri'#231#227'o'
            Width = 220
          end
          item
            Caption = 'Serial POS'
            Width = 160
          end>
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        RowSelect = True
        ShowColumnHeaders = False
        ShowHint = True
        Style.BorderStyle = cbsNone
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -21
        Style.Font.Name = 'Courier New'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        StyleFocused.BorderStyle = cbsNone
        StyleHot.BorderStyle = cbsNone
        TabOrder = 0
        ViewStyle = vsReport
      end
      object cxListPrazo: TcxListView
        Left = 0
        Top = 0
        Width = 593
        Height = 349
        Align = alClient
        Columns = <
          item
            AutoSize = True
            Caption = 'Descri'#231#227'o'
          end>
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        RowSelect = True
        ShowColumnHeaders = False
        ShowHint = True
        Style.BorderStyle = cbsNone
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -20
        Style.Font.Name = 'Courier New'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        StyleFocused.BorderStyle = cbsNone
        StyleHot.BorderStyle = cbsNone
        TabOrder = 1
        ViewStyle = vsReport
        ExplicitLeft = 8
        ExplicitTop = 13
        ExplicitWidth = 403
        ExplicitHeight = 336
      end
    end
    object cxTabSheet4: TcxTabSheet
      Caption = 'C'#243'digo de autoriza'#231#227'o'
      ImageIndex = 3
      object Shape10: TShape
        Left = 12
        Top = 25
        Width = 565
        Height = 96
        Brush.Color = 8404992
        Pen.Color = 10725123
        Shape = stRoundRect
      end
      object Label5: TLabel
        Left = 25
        Top = 37
        Width = 212
        Height = 20
        Caption = 'C'#243'digo de autoriza'#231#227'o'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -17
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        StyleElements = []
      end
      object edtAutorizacao: TcxTextEdit
        Left = 25
        Top = 71
        ParentFont = False
        ParentShowHint = False
        Properties.Alignment.Horz = taLeftJustify
        ShowHint = False
        Style.BorderColor = clHighlightText
        Style.BorderStyle = ebsThick
        Style.Color = 8404992
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWhite
        Style.Font.Height = -24
        Style.Font.Name = 'Verdana'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = ''
        Style.Shadow = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = ''
        StyleFocused.BorderColor = 8404992
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = ''
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = ''
        TabOrder = 0
        Width = 528
      end
    end
  end
  object fdPOS: TWiFDQuery
    Active = True
    Connection = FrmPDV_DModule.ADConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    SQL.Strings = (
      'SELECT  a.pos_id ,'
      '        a.pos_descricao ,'
      '        a.pos_serial ,'
      '        b.adq_merchant_id,'
      'b.adq_chave_requisicao,'
      'b.adq_id'
      'FROM    pdv.tb_pos a'
      '        INNER JOIN pdv.tb_adquirentes b ON b.adq_id = a.adq_id'
      'WHERE   a.pos_ativo = 1;')
    CustomDelete = False
    ShowMsgBeforeDelete = False
    ReadOnly = False
    Left = 122
    Top = 280
  end
  object doPOS: TDataSource
    AutoEdit = False
    DataSet = fdPOS
    Left = 70
    Top = 279
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 72
    Top = 364
  end
  object wiQryOperadoras: TWiFDQuery
    Connection = FrmPDV_DModule.ADConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    SQL.Strings = (
      'select * from pdv.tb_operadoras ')
    CustomDelete = False
    ShowMsgBeforeDelete = False
    ReadOnly = False
    Left = 434
    Top = 248
  end
  object dsOperadoras: TDataSource
    AutoEdit = False
    DataSet = wiQryOperadoras
    Left = 438
    Top = 191
  end
  object dsPrazos: TDataSource
    AutoEdit = False
    DataSet = wiQryPrazos
    Left = 334
    Top = 191
  end
  object wiQryPrazos: TWiFDQuery
    Connection = FrmPDV_DModule.ADConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    SQL.Strings = (
      'select * from  pdv.tb_credito_parcelado')
    CustomDelete = False
    ShowMsgBeforeDelete = False
    ReadOnly = False
    Left = 330
    Top = 248
  end
end
