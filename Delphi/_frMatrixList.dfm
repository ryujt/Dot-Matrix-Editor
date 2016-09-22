object frMatrixList: TfrMatrixList
  Left = 0
  Top = 0
  Width = 587
  Height = 499
  TabOrder = 0
  object ListBox: TListBox
    Left = 0
    Top = 41
    Width = 587
    Height = 458
    Align = alClient
    DragMode = dmAutomatic
    ItemHeight = 13
    Items.Strings = (
      '0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00')
    TabOrder = 0
    OnClick = ListBoxClick
    OnDragDrop = ListBoxDragDrop
    OnDragOver = ListBoxDragOver
    OnMouseDown = ListBoxMouseDown
    ExplicitLeft = 232
    ExplicitTop = 200
    ExplicitWidth = 121
    ExplicitHeight = 97
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 587
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 200
    ExplicitTop = 228
    ExplicitWidth = 185
    object btAdd: TSpeedButton
      Left = 12
      Top = 9
      Width = 23
      Height = 22
      Caption = '+'
      OnClick = btAddClick
    end
    object btDelete: TSpeedButton
      Left = 36
      Top = 9
      Width = 23
      Height = 22
      Caption = '-'
      OnClick = btDeleteClick
    end
    object btClear: TSpeedButton
      Left = 84
      Top = 9
      Width = 49
      Height = 22
      Caption = 'Clear'
      OnClick = btClearClick
    end
  end
end
