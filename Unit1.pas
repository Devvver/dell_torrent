unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    ListBox1: TListBox;
    Timer1: TTimer;
    ListBox2: TListBox;
    Edit2: TEdit;
    Button3: TButton;
    Label1: TLabel;
    procedure Button3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}






procedure TForm1.Button3Click(Sender: TObject);
var
ii:integer;
rek:real ;
begin
if timer1.Enabled=false then
 begin
timer1.Interval:= strtoint(edit2.Text)*1000;
timer1.Enabled:=true ;
Button3.Caption:='����' ;
rek:= timer1.Interval/1000;
label1.Caption:=FloatToStr(rek) +' ������' ;
 end
 Else
 begin
 timer1.Enabled:=false;
 Button3.Caption:='�����'
 end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var wnd: hwnd;
    buff: array [0..127] of char;
    i: integer ;
    temp :string;
sr: TSearchRec;
Path: string;
begin
ListBox1.clear;
wnd := GetWindow(handle, gw_hwndfirst);
while wnd <> 0 do
begin // �� ����������:
if (wnd <> Application.Handle) // ����������� ����
and IsWindowVisible(wnd) // ��������� ����
and (GetWindow(wnd, gw_owner) = 0) // �������� ����
and (GetWindowText(wnd, buff, SizeOf(buff)) <> 0) then
begin
GetWindowText(wnd, buff, SizeOf(buff));
ListBox1.Items.Add(StrPas(buff));
end;
wnd := GetWindow(wnd, gw_hwndnext);
end;
//ListBox1.ItemIndex := 0;

for i := 0 to ListBox1.Count-1 do
begin
If pos('qBittorrent',ListBox1.Items[i])=1
 then begin

ListBox2.Items.Add('qBittorrent �������, ������� ������ �� �����.');
  break
 end
 else
 begin
  Path :=Edit1.Text+'\' ;
// ����� ������ ��������� ����� �� ����� ����:
if FindFirst(Path + '*.torrent', faAnyFile, sr) = 0 then
  begin
    repeat

        listbox2.Items.add(sr.Name);
 Deletefile(Path+sr.Name);
  listbox2.Items.add( '���� ������ '+sr.Name);
    until FindNext(sr) <> 0;
  end;
FindClose(sr);


 end;


end;
end;

end.
