object frSourceCode: TfrSourceCode
  Left = 0
  Top = 0
  Width = 572
  Height = 553
  TabOrder = 0
  object SynEdit: TSynEdit
    Left = 0
    Top = 0
    Width = 572
    Height = 553
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    TabOrder = 0
    Gutter.Font.Charset = ANSI_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -13
    Gutter.Font.Name = 'Consolas'
    Gutter.Font.Style = []
    Gutter.RightOffset = 10
    Gutter.ShowLineNumbers = True
    Gutter.Gradient = True
    Highlighter = SynJScriptSyn
    ImeName = 'Microsoft IME 2010'
    Lines.Strings = (
      '')
    ReadOnly = True
    FontSmoothing = fsmNone
    RemovedKeystrokes = <
      item
        Command = ecCut
        ShortCut = 8238
      end
      item
        Command = ecPaste
        ShortCut = 8237
      end
      item
        Command = ecDeleteChar
        ShortCut = 46
      end
      item
        Command = ecContextHelp
        ShortCut = 112
      end
      item
        Command = ecPaste
        ShortCut = 16470
      end
      item
        Command = ecCut
        ShortCut = 16472
      end
      item
        Command = ecBlockIndent
        ShortCut = 24649
      end
      item
        Command = ecBlockUnindent
        ShortCut = 24661
      end
      item
        Command = ecLineBreak
        ShortCut = 16461
      end
      item
        Command = ecInsertLine
        ShortCut = 16462
      end
      item
        Command = ecDeleteWord
        ShortCut = 16468
      end>
    AddedKeystrokes = <
      item
        Command = ecPaste
        ShortCut = 8238
      end
      item
        Command = ecDeleteChar
        ShortCut = 8237
      end
      item
        Command = ecCut
        ShortCut = 46
      end
      item
        Command = ecContextHelp
        ShortCut = 16496
      end
      item
        Command = ecBlockIndent
        ShortCut = 16470
      end
      item
        Command = ecLineBreak
        ShortCut = 16472
      end
      item
        Command = ecInsertLine
        ShortCut = 24649
      end
      item
        Command = ecDeleteWord
        ShortCut = 24661
      end
      item
        Command = ecBlockUnindent
        ShortCut = 16461
      end
      item
        Command = ecPaste
        ShortCut = 16462
      end
      item
        Command = ecCut
        ShortCut = 16468
      end>
  end
  object moSrc: TMemo
    Left = 72
    Top = 164
    Width = 457
    Height = 245
    Lines.Strings = (
      '#include <MAX7219.h>'
      ''
      'MAX7219 max7219(2, 3, 4);'
      ''
      '@Matrix-String'
      'void setup() {'
      '  max7219.begin();'
      '}'
      ''
      'void loop() {'
      '  @Loop}'
      '')
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 1
    Visible = False
  end
  object SynJScriptSyn: TSynJScriptSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    CommentAttri.Foreground = clGreen
    KeyAttri.Foreground = clBlue
    StringAttri.Foreground = clMaroon
    Left = 68
    Top = 24
  end
end
