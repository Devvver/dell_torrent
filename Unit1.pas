unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,IniFiles;

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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
Button3.Caption:='СТОП' ;
rek:= timer1.Interval/1000;
label1.Caption:=FloatToStr(rek) +' секунд' ;
 end
 Else
 begin
 timer1.Enabled:=false;
 Button3.Caption:='СТАРТ'
 end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
Param3,Param4:string;
Inifile:TIniFile;
begin
Inifile:=TIniFile.Create(GetCurrentDir + '\Options.ini');
Param3:=Edit1.Text;
Param4:=Edit2.Text;
try
 Inifile.Writestring('Param','Timer',param4);
 Inifile.Writestring('Param','Papka',param3);

finally
Inifile.Destroy;
end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
IniFile: TIniFile;
  Param1,Param2:string;
begin
timer1.Enabled:=false;
IniFile := TIniFile.Create(GetCurrentDir + '\Options.ini');
try
Param1:=IniFile.ReadString('Param','Timer','3600');
Param2:=IniFile.readstring('Param','Papka','C:\temp\');
   Edit1.Text:=Param2;
    Edit2.Text:=Param1;
finally
IniFile.Destroy;
end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var wnd: hwnd;
    buff: array [0..127] of char;
    i: integer ;
    temp :string;
sr: TSearchRec;
Path: string;
have:boolean;
begin
 ListBox1.Clear;
 have:=false;
wnd := GetWindow(handle, gw_hwndfirst);
while wnd <> 0 do
begin // Не показываем:
if (wnd <> Application.Handle) // Собственное окно
and IsWindowVisible(wnd) // Невидимые окна
and (GetWindow(wnd, gw_owner) = 0) // Дочерние окна
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
 have:=true;
ListBox2.Items.Add('qBittorrent запущен, поэтому ничего не делаю.');
 end ;
 end;

   if have=false then

 begin
  Path :=Edit1.Text+'\' ;
// затем искать вложенные папки по этому пути:
if FindFirst(Path + '*.torrent', faAnyFile, sr) = 0 then
  begin
    repeat

        listbox2.Items.add(sr.Name);
 Deletefile(Path+sr.Name);
  listbox2.Items.add( 'файл удален '+sr.Name);
    until FindNext(sr) <> 0;
  end;
FindClose(sr);

end;



end;

end.
