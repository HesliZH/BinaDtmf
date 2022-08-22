object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'FormMain'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object LblInfoGrava: TLabel
    Left = 504
    Top = 8
    Width = 88
    Height = 15
    Caption = 'Grava'#231#227'o parada'
  end
  object BtGerarWave: TButton
    Left = 200
    Top = 32
    Width = 197
    Height = 25
    Caption = 'Gerar arquivo Wave Debug'
    TabOrder = 0
    OnClick = BtGerarWaveClick
  end
  object BtIniciarGravacao: TButton
    Left = 200
    Top = 63
    Width = 197
    Height = 25
    Caption = 'Iniciar Grava'#231#227'o braba'
    TabOrder = 1
    OnClick = BtIniciarGravacaoClick
  end
  object BtStopGravacao: TButton
    Left = 200
    Top = 94
    Width = 197
    Height = 25
    Caption = 'Parar grava'#231#227'o braba'
    TabOrder = 2
    OnClick = BtStopGravacaoClick
  end
  object BtDeletaPorra: TButton
    Left = 200
    Top = 125
    Width = 197
    Height = 39
    Caption = 'DELETA ESSA DESGRACA'
    TabOrder = 3
    OnClick = BtDeletaPorraClick
  end
  object BtFMXMedia: TButton
    Left = 200
    Top = 170
    Width = 197
    Height = 25
    Caption = 'FMX Media caramba'
    TabOrder = 4
    OnClick = BtFMXMediaClick
  end
  object EdTelefone: TEdit
    Left = 160
    Top = 203
    Width = 289
    Height = 23
    TabOrder = 5
    Text = 'Vai aparecer o n'#250'mero do telefone aqui'
  end
  object BtAnalisarBinaCaseira: TButton
    Left = 200
    Top = 240
    Width = 197
    Height = 25
    Caption = 'Analisar bina caseira'
    TabOrder = 6
    OnClick = BtAnalisarBinaCaseiraClick
  end
  object BtNossoArquivo: TButton
    Left = 200
    Top = 271
    Width = 197
    Height = 25
    Caption = 'Analisar Audio Gravado'
    TabOrder = 7
    OnClick = BtNossoArquivoClick
  end
  object ArquivoWav: TFileOpenDialog
    FavoriteLinks = <>
    FileName = 'C:\Projetos\ProgramaTesteGravacao'
    FileTypes = <>
    Options = []
    Left = 32
    Top = 16
  end
end
