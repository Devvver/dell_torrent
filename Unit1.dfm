object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1059#1076#1072#1083#1077#1085#1080#1077' '#1086#1096#1080#1073#1086#1095#1085#1086#1075#1086' '#1090#1086#1088#1088#1077#1085#1090#1072' 0.1 beta'
  ClientHeight = 585
  ClientWidth = 869
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 80
    Top = 296
    Width = 3
    Height = 13
  end
  object Edit1: TEdit
    Left = 64
    Top = 56
    Width = 393
    Height = 21
    Hint = #1055#1091#1090#1100' '#1082' '#1087#1072#1087#1082#1077' '#1089' '#1090#1086#1088#1088#1077#1085#1090#1072#1084#1080'. '#1054#1073#1088#1072#1090#1085#1099#1081' '#1089#1083#1077#1096' '#1085#1077' '#1085#1091#1078#1077#1085'.'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Text = 'D:\load\test'
  end
  object ListBox1: TListBox
    Left = 471
    Top = 56
    Width = 390
    Height = 521
    Hint = #1079#1072#1087#1091#1097#1077#1085#1085#1099#1077' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1103
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object ListBox2: TListBox
    Left = 191
    Top = 95
    Width = 274
    Height = 482
    Hint = #1089#1087#1080#1089#1086#1082' '#1090#1086#1088#1088#1077#1085#1090#1086#1074' '
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object Edit2: TEdit
    Left = 64
    Top = 29
    Width = 121
    Height = 21
    Hint = #1090#1072#1081#1084#1077#1088' '#1074' '#1089#1077#1082#1091#1085#1076#1072#1093
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Text = '3600'
  end
  object Button3: TButton
    Left = 64
    Top = 95
    Width = 121
    Height = 42
    Hint = #1079#1072#1087#1091#1089#1082' '#1088#1072#1073#1086#1090#1099' '#1090#1072#1081#1084#1077#1088#1072
    Caption = #1057#1058#1040#1056#1058
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = Button3Click
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 3600000
    OnTimer = Timer1Timer
    Left = 72
    Top = 408
  end
end
