object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'Dot-Matrix-Editor'
  ClientHeight = 541
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 281
    Height = 541
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitHeight = 562
    inline frMatrix: TfrMatrix
      Left = 0
      Top = 0
      Width = 281
      Height = 217
      Align = alTop
      Color = clGray
      ParentBackground = False
      ParentColor = False
      TabOrder = 0
      ExplicitWidth = 784
      ExplicitHeight = 217
    end
    inline frMatrixList: TfrMatrixList
      Left = 0
      Top = 221
      Width = 281
      Height = 320
      Align = alClient
      TabOrder = 1
      ExplicitLeft = -394
      ExplicitTop = 63
      inherited ListBox: TListBox
        Width = 281
        Height = 279
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 587
        ExplicitHeight = 499
      end
      inherited Panel1: TPanel
        Width = 281
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 281
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 217
      Width = 281
      Height = 4
      Align = alTop
      BevelOuter = bvNone
      Color = clBlack
      ParentBackground = False
      TabOrder = 2
    end
  end
  inline frSourceCode: TfrSourceCode
    Left = 281
    Top = 0
    Width = 503
    Height = 541
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 212
    ExplicitTop = -12
    inherited SynEdit: TSynEdit
      Width = 503
      Height = 541
      ExplicitLeft = 0
      ExplicitWidth = 572
      ExplicitHeight = 553
    end
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Text File(s)|*.txt|All File(s)|*.*'
    Left = 700
    Top = 24
  end
  object MainMenu: TMainMenu
    AutoHotkeys = maManual
    Left = 572
    Top = 24
    object File1: TMenuItem
      Caption = 'File'
      object miOpen: TMenuItem
        Caption = 'Open'
        ShortCut = 16463
        OnClick = miOpenClick
      end
      object miSave: TMenuItem
        Caption = 'Save'
        ShortCut = 16467
        OnClick = miSaveClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object miExit: TMenuItem
        Caption = 'Exit'
        OnClick = miExitClick
      end
    end
  end
  object OpenDialog: TOpenDialog
    Filter = 'Text File(s)|*.txt|All File(s)|*.*'
    Options = [ofHideReadOnly, ofNoChangeDir, ofEnableSizing]
    Left = 636
    Top = 24
  end
end
