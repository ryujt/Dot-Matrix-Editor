unit _frMatrixList;

interface

uses
  Base,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons;

type
  TfrMatrixList = class(TFrame)
    ListBox: TListBox;
    Panel1: TPanel;
    btAdd: TSpeedButton;
    btDelete: TSpeedButton;
    btClear: TSpeedButton;
    procedure btAddClick(Sender: TObject);
    procedure btDeleteClick(Sender: TObject);
    procedure ListBoxClick(Sender: TObject);
    procedure ListBoxDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ListBoxDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListBoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btClearClick(Sender: TObject);
  private
    FMouseDownPos : TPoint;
  private
    FOnSelected: TStringEvent;
    FOnChanged: TStringEvent;
  public
    constructor Create(AOwner: TComponent); override;

    procedure LoadFromFile(AFilename:string);
    procedure SaveToFile(AFilename:string);

    procedure SetMatrixString(const AText:string);
  published
    property OnChanged : TStringEvent read FOnChanged write FOnChanged;
    property OnSelected : TStringEvent read FOnSelected write FOnSelected;
  end;

implementation

{$R *.dfm}

{ TfrMatrixList }

procedure TfrMatrixList.btAddClick(Sender: TObject);
begin
  ListBox.Items.Add('0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00');
  ListBox.ItemIndex := ListBox.Items.Count-1;

  if Assigned(FOnSelected) then FOnSelected(Self, ListBox.Items[ListBox.ItemIndex]);
  if Assigned(FOnChanged) then FOnChanged(Self, ListBox.Items.Text);
end;

procedure TfrMatrixList.btDeleteClick(Sender: TObject);
begin
  if ListBox.ItemIndex >= 0 then ListBox.Items.Delete(ListBox.ItemIndex);

  if Assigned(FOnChanged) then FOnChanged(Self, ListBox.Items.Text);
end;

constructor TfrMatrixList.Create(AOwner: TComponent);
begin
  inherited;

  ListBox.ItemIndex := 0;
end;

procedure TfrMatrixList.ListBoxClick(Sender: TObject);
begin
  if Assigned(FOnSelected) and (ListBox.ItemIndex >= 0) then FOnSelected(Self, ListBox.Items[ListBox.ItemIndex]);
end;

procedure TfrMatrixList.ListBoxDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  Num1, Num2 : Integer;
  Point1, Point2: TPoint;
begin
  Point1.X := FMouseDownPos.X;
  Point1.Y := FMouseDownPos.Y;
  Point2.X := X;
  Point2.Y := Y;

  with Source as TListBox do begin
    Num2 := ListBox.ItemAtPos(Point1, true);
    Num1 := ListBox.ItemAtPos(Point2, true);
    ListBox.Items.Move(Num2, Num1);
  end;
end;

procedure TfrMatrixList.ListBoxDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  if Source = ListBox then Accept := true;
end;

procedure TfrMatrixList.ListBoxMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FMouseDownPos.X := X;
  FMouseDownPos.Y := Y;
end;

procedure TfrMatrixList.LoadFromFile(AFilename: string);
begin
  ListBox.Items.LoadFromFile(AFilename);

  if Assigned(FOnChanged) then FOnChanged(Self, ListBox.Items.Text);
end;

procedure TfrMatrixList.SaveToFile(AFilename: string);
begin
  ListBox.Items.SaveToFile(AFilename);
end;

procedure TfrMatrixList.SetMatrixString(const AText: string);
begin
  if ListBox.Count = 0 then begin
    ListBox.Items.Add(AText);
    Exit;
  end;

  if ListBox.ItemIndex < 0 then Exit;

  ListBox.Items[ListBox.ItemIndex] := AText;

  if Assigned(FOnChanged) then FOnChanged(Self, ListBox.Items.Text);
end;

procedure TfrMatrixList.btClearClick(Sender: TObject);
begin
  ListBox.Items.Clear;

  if Assigned(FOnChanged) then FOnChanged(Self, ListBox.Items.Text);
end;

end.
