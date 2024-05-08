unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Unit2;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Memo1: TMemo;
    ToggleBox1: TToggleBox;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure ToggleBox1Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

procedure Delay(dt: DWORD);
var
  tc : DWORD;
begin
  tc := GetTickCount;
  while (GetTickCount < tc + dt) and (not Application.Terminated) do
    Application.ProcessMessages;
end;

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin

  //button toggle
  if togglebox1.Caption='One Line Mode On' then
  begin
   memo1.Lines[0]:=memo1.Lines[0]+button1.Caption
  end;
  //button toggle

 if (memo1.Lines[0]='0') or (memo1.Lines[0]='') then
  begin
  memo1.clear;
  end;

  if memo1.Lines[1]='' then
  memo1.Lines[0]:=memo1.Lines[0]+button1.Caption
 else
 memo1.lines[2]:=memo1.Lines[2]+button1.Caption;
end;

procedure TForm1.Button18Click(Sender: TObject);
begin
  {
 if (memo1.Lines[0]='0') or (memo1.Lines[0]='') then
  begin
  memo1.clear;
  end;
  }

  if memo1.Lines[1]='' then
  memo1.Lines[0]:=memo1.Lines[0]+button18.Caption
 else
 memo1.lines[2]:=memo1.Lines[2]+button18.Caption;
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
 memo1.Clear;
  memo1.Lines[0]:='0';
end;

procedure TForm1.Button11Click(Sender: TObject);
var
  ch:string;
begin
  if memo1.Lines[2] <> '' then
  begin
  ch:=memo1.lines[2];
  delete(ch,length(ch),1);
  memo1.lines[2]:=ch;
  end
  else if memo1.Lines[1] <> '' then
  begin
  ch:=memo1.lines[1];
  delete(ch,length(ch),1);
  memo1.lines[1]:=ch;
  end
  else
  // memo1.Lines[0] <> '' then
  begin
  ch:=memo1.lines[0];
  delete(ch,length(ch),1);
  memo1.lines[0]:=ch;
  end ;

end;

procedure TForm1.Button12Click(Sender: TObject);
begin
 if memo1.Lines[0] <> '' then
  memo1.Lines[1]:=button12.Caption;
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
 if memo1.Lines[0] <> '' then
  memo1.Lines[1]:=button13.Caption;
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
 if memo1.Lines[0] <> '' then
  memo1.Lines[1]:=button14.Caption;
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
 if memo1.Lines[0] <> '' then
  memo1.Lines[1]:=button15.Caption;
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
 if memo1.Lines[0] <> '' then
  memo1.Lines[1]:=button16.Caption;
end;

procedure TForm1.Button17Click(Sender: TObject);
var
  ch,x:string;
  f:text;
begin
  assignfile(f,'default.txt');
 reset(f);
 read(f,x);
 closefile(f);

 if (memo1.lines[0]=x)and(memo1.lines[1]='')and(memo1.lines[2]='') then
 begin
 form2.ShowModal;
 end;


 if memo1.Lines[0]='00000' then
 begin
 memo1.Clear;
 memo1.Lines.add('0');
 assignfile(f,'default.txt');
 rewrite(f);
 delay(5000);
 write(f,memo1.Lines[0]);
 closefile(f);
 end;



 if memo1.lines[1]='+' then
 begin
 str(strtoint(memo1.lines[0])+strtoint(memo1.lines[2]),ch);

  //memo1.font.color:=clscrollbar;
  memo1.lines[3]:=ch+'                                                             ';
 end;

  if memo1.lines[1]='-' then
 begin
 str(strtoint(memo1.lines[0])-strtoint(memo1.lines[2]),ch);
  memo1.lines[3]:=ch+'                                                             ';
 end;

  if memo1.lines[1]='x' then
 begin
 str(strtoint(memo1.lines[0])*strtoint(memo1.lines[2]),ch);
  memo1.lines[3]:=ch+'                                                             ';
 end;

  // div 0 null
  if (memo1.lines[1]='/')then
 begin
 str(strtoint(memo1.lines[0]) / strtoint(memo1.lines[2]),ch);
  memo1.lines[3]:=ch+'                                                             ';
 end;

  if memo1.lines[1]='%' then
 begin
 str(strtoint(memo1.lines[0]) mod strtoint(memo1.lines[2]),ch);
  memo1.lines[3]:=ch+'                                                             ';
 end;

 memo1.ScrollBy(1,2);
 {
 case memo1.lines[1] of
  '+':memo1.lines[3]:=strtoint(memo1.lines[0])+strtoint(memo1.lines[2]);
  '-':memo1.lines[3]:=strtoint(memo1.lines[0])+strtoint(memo1.lines[2]);
  'x':memo1.lines[3]:=strtoint(memo1.lines[0])+strtoint(memo1.lines[2]);
  '/':memo1.lines[3]:=strtoint(memo1.lines[0])+strtoint(memo1.lines[2]);
  '%':memo1.lines[3]:=strtoint(memo1.lines[0])+strtoint(memo1.lines[2]);
 end;
 }

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 if (memo1.Lines[0]='0') or (memo1.Lines[0]='') then
  begin
  memo1.clear;
  end;

  if memo1.Lines[1]='' then
  memo1.Lines[0]:=memo1.Lines[0]+button2.Caption
 else
 memo1.lines[2]:=memo1.Lines[2]+button2.Caption;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 if (memo1.Lines[0]='0') or (memo1.Lines[0]='') then
  begin
  memo1.clear;
  end;

  if memo1.Lines[1]='' then
  memo1.Lines[0]:=memo1.Lines[0]+button3.Caption
 else
 memo1.lines[2]:=memo1.Lines[2]+button3.Caption;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
 if (memo1.Lines[0]='0') or (memo1.Lines[0]='') then
  begin
  memo1.clear;
  end;

 if memo1.Lines[1]='' then
  memo1.Lines[0]:=memo1.Lines[0]+button4.Caption
 else
 memo1.lines[2]:=memo1.Lines[2]+button4.Caption;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
 if (memo1.Lines[0]='0') or (memo1.Lines[0]='') then
  begin
  memo1.clear;
  end;

  if memo1.Lines[1]='' then
  memo1.Lines[0]:=memo1.Lines[0]+button5.Caption
 else
 memo1.lines[2]:=memo1.Lines[2]+button5.Caption;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
 if (memo1.Lines[0]='0') or (memo1.Lines[0]='') then
   begin
   memo1.clear;
   end;

  if memo1.Lines[1]='' then
  memo1.Lines[0]:=memo1.Lines[0]+button6.Caption
 else
 memo1.lines[2]:=memo1.Lines[2]+button6.Caption;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
 if (memo1.Lines[0]='0') or (memo1.Lines[0]='') then
  begin
  memo1.clear;
  end;

 if memo1.Lines[1]='' then
  memo1.Lines[0]:=memo1.Lines[0]+button7.Caption
 else
 memo1.lines[2]:=memo1.Lines[2]+button7.Caption;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  if (memo1.Lines[0]='0') or (memo1.Lines[0]='') then
  begin
  memo1.clear;
  end;

  if memo1.Lines[1]='' then
  memo1.Lines[0]:=memo1.Lines[0]+button8.Caption
 else
 memo1.lines[2]:=memo1.Lines[2]+button8.Caption;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  if (memo1.Lines[0]='0') or (memo1.Lines[0]='') then
  begin
 memo1.clear;
  end;

  if memo1.Lines[1]='' then
  memo1.Lines[0]:=memo1.Lines[0]+button9.Caption
 else
 memo1.lines[2]:=memo1.Lines[2]+button9.Caption;
end;

procedure TForm1.FormActivate(Sender: TObject);
var
  f:text;
begin
  memo1.Clear;
  memo1.Lines.Add('0');
  if not (fileexists('default.txt')) then
  begin
  assignfile(f,'default.txt');
  rewrite(f);
  write(f,'123');
  closefile(f);

  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Memo1Change(Sender: TObject);
begin

end;

procedure TForm1.ToggleBox1Change(Sender: TObject);
begin
  if togglebox1.caption='One Line Mode Off' then
  togglebox1.Caption:='One Line Mode On'
  else
   togglebox1.Caption:='One Line Mode Off'
end;

end.

