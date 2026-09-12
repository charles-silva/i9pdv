object fimportacao: Tfimportacao
  Left = 0
  Top = 0
  Caption = 'Importa'#231#227'o de Dados'
  ClientHeight = 204
  ClientWidth = 510
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 13
  object cxButton1: TcxButton
    Left = 40
    Top = 24
    Width = 441
    Height = 33
    Caption = 'Atualizacao do Cadastro de Produto do PDV'
    Enabled = False
    TabOrder = 0
    OnClick = cxButton1Click
  end
  object pb: TProgressBar
    Left = 0
    Top = 187
    Width = 510
    Height = 17
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 186
    ExplicitWidth = 506
  end
  object Memo1: TMemo
    Left = 40
    Top = 63
    Width = 185
    Height = 41
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
    Visible = False
  end
  object cxButton2: TcxButton
    Left = 40
    Top = 110
    Width = 441
    Height = 33
    Caption = 'Atualizar Estoque Fiscal no ERP'
    TabOrder = 3
  end
  object ds1: TDataSource
    DataSet = a1
    Left = 304
    Top = 56
  end
  object a1: TADOQuery
    Connection = FrmPDV.ADOConnection1
    Parameters = <>
    Left = 360
    Top = 56
  end
  object ds2: TDataSource
    DataSet = a2
    Left = 416
    Top = 80
  end
  object a2: TADOQuery
    Connection = FrmPDV.ADOConnection1
    Parameters = <>
    Left = 464
    Top = 80
  end
  object FDQuery1: TFDQuery
    Connection = FrmPDV_DModule.ADConnection1
    SQL.Strings = (
      
        'select i.pnfi_id, i.pnf_id,i.pr_codigo,i.pnfi_qtd,c.pnf_numero_f' +
        'iscal from pdv.tb_nota_fiscal_itens i'
      'JOIN  pdv.tb_nota_fiscal c ON c.pnf_id=i.pnf_id '
      
        'where dtcontrole is null AND c.pnf_status IN (4,2) AND i.pnfi_ca' +
        'ncelado=0 and c.pnf_data_autorizacao is not null'
      ''
      ''
      '')
    Left = 24
    Top = 136
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 96
    Top = 136
  end
  object FDQuery2: TFDQuery
    Connection = FrmPDV_DModule.ADConnection1
    SQL.Strings = (
      'select  * from pdv.tb_nota_fiscal_itens  '
      'order by pnf_id desc')
    Left = 176
    Top = 136
  end
  object DataSource2: TDataSource
    DataSet = FDQuery2
    Left = 248
    Top = 136
  end
end
