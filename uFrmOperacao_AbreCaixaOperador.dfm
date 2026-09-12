object FrmOperacao_AbreCaixaOperador: TFrmOperacao_AbreCaixaOperador
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Sa'#237'da do Operador'
  ClientHeight = 391
  ClientWidth = 472
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    472
    391)
  PixelsPerInch = 96
  TextHeight = 13
  object Shape27: TShape
    Left = 0
    Top = 24
    Width = 472
    Height = 367
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Brush.Style = bsClear
    Pen.Color = 11383299
    OnMouseDown = Shape27MouseDown
    ExplicitTop = 25
    ExplicitHeight = 404
  end
  object Label1: TLabel
    Left = 12
    Top = 32
    Width = 68
    Height = 16
    Caption = 'Operador'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Shape16: TShape
    Left = 0
    Top = 0
    Width = 472
    Height = 24
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Brush.Color = 5986569
    OnMouseDown = Shape16MouseDown
    ExplicitLeft = -5
    ExplicitWidth = 450
  end
  object Label38: TLabel
    Left = 255
    Top = 2
    Width = 204
    Height = 19
    Caption = 'Abertura do caixa'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Lucida Console'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = []
  end
  object Label2: TLabel
    Left = 12
    Top = 83
    Width = 55
    Height = 16
    BiDiMode = bdLeftToRight
    Caption = 'Valores'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object lblMsgRapida: TLabel
    Left = 12
    Top = 368
    Width = 316
    Height = 16
    Anchors = [akLeft, akBottom]
    Caption = 'Pressione [F2] para confirmar abertura do caixa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    StyleElements = []
  end
  object edOperador: TcxCurrencyEdit
    Left = 12
    Top = 49
    EditValue = 0.000000000000000000
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Properties.AssignedValues.DisplayFormat = True
    Properties.DecimalPlaces = 0
    Style.Color = clWhite
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -17
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.LookAndFeel.SkinName = 'Blue'
    Style.TextColor = clBlack
    Style.IsFontAssigned = True
    StyleDisabled.BorderColor = clBtnShadow
    StyleDisabled.Color = clWhite
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleDisabled.TextColor = clBlack
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 0
    OnExit = edOperadorExit
    Width = 97
  end
  object edNomeOperador: TcxTextEdit
    Left = 115
    Top = 49
    TabStop = False
    ParentFont = False
    Properties.ReadOnly = True
    Style.Color = clWhite
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -17
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.LookAndFeel.SkinName = 'Blue'
    Style.TextColor = clBlack
    Style.IsFontAssigned = True
    StyleDisabled.BorderColor = clBtnShadow
    StyleDisabled.Color = clWhite
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleDisabled.TextColor = clBlack
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 1
    Width = 344
  end
  object cxGrid1: TcxGrid
    Left = 12
    Top = 102
    Width = 447
    Height = 259
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Wibi_Blue'
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = doValores
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = cxGrid1DBTableView1fp_codigo
        end
        item
          Format = 'R$ ,0.00;-R$ ,0.00'
          Kind = skSum
          FieldName = 'pcxov_valor'
          Column = cxGrid1DBTableView1pcxov_valor
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.ColumnHeaderHints = False
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object cxGrid1DBTableView1fp_codigo: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'fp_codigo'
        Options.Editing = False
        Options.Focusing = False
        Width = 50
      end
      object cxGrid1DBTableView1fp_descricao: TcxGridDBColumn
        Caption = 'Forma de Pagamento'
        DataBinding.FieldName = 'fp_descricao'
        Options.Editing = False
        Options.Focusing = False
        Width = 278
      end
      object cxGrid1DBTableView1pcxov_valor: TcxGridDBColumn
        Caption = 'Valor'
        DataBinding.FieldName = 'pcxov_valor'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.EditFormat = 'R$ ,0.00;-R$ ,0.00'
        Properties.Nullable = False
        HeaderAlignmentHorz = taRightJustify
        Width = 105
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object WiEventsForm1: TWiEventsForm
    IDControl = edOperador
    OnKeyDownEscape = WiEventsForm1KeyDownEscape
    SkipGridOnEnter = True
    Left = 364
    Top = 32
  end
  object dsValores: TWiFDQuery
    BeforePost = dsValoresBeforePost
    AfterPost = dsValoresAfterPost
    Connection = FrmPDV_DModule.ADConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    SQL.Strings = (
      'SELECT  a.fp_codigo ,'
      '        a.fp_descricao ,'
      '        isnull(b.pcxov_valor,0.00) as pcxov_valor ,'
      '        pcxo.us_codigo ,'
      '        c.us_apelido ,'
      '        c.us_senha,'
      
        '        pcxo.pterm_id,pcxo.pcxo_id,b.pcxov_id,pcxov_abertura,pcx' +
        'ov_encerramento'
      'FROM    dbo.t_formaspag a'
      
        '        LEFT JOIN pdv.tb_caixa_operador pcxo ON pcxo.pcxo_id = :' +
        'pcxo_id'
      
        '        LEFT JOIN pdv.tb_caixa_operador_valores b ON a.fp_codigo' +
        ' = b.fp_codigo AND'
      
        '                                                   pcxo .pterm_i' +
        'd = :pterm_id and  b.pcxo_id = :pcxo_id and pcxov_abertura=1'
      '        LEFT JOIN t_users c ON c.us_codigo = pcxo.us_codigo'
      'WHERE   a.fp_pdv = 1')
    CustomDelete = False
    ProcedureName = 'pdv.sp_tb_caixa_operador_valores'
    TableNameDelete = 'pdv.tb_caixa_operador_valores'
    KeyFieldRefresh = 'pcxov_id'
    KeyFieldDelete = 'pcxov_id'
    ShowMsgBeforeDelete = False
    ReadOnly = False
    Left = 292
    Top = 96
    ParamData = <
      item
        Name = 'PCXO_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end
      item
        Name = 'PTERM_ID'
        ParamType = ptInput
      end>
  end
  object doValores: TDataSource
    DataSet = dsValores
    Left = 388
    Top = 96
  end
end
