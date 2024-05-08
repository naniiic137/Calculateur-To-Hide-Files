unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls,
  EditBtn, ExtCtrls, ShellCtrls,dos,crt;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    FileNameEdit1: TFileNameEdit;
    Label1: TLabel;
    ListBox1: TListBox;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FileNameEdit1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDropFiles(Sender: TObject; const FileNames: array of string);
    procedure ListBox1Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure Memo1DragDrop(Sender, Source: TObject; X, Y: Integer);
  private

  public

  end;

var
  Form2: TForm2;

implementation


{$R *.lfm}

{ TForm2 }

procedure TForm2.FormActivate(Sender: TObject);
begin
  memo1.Clear;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin

end;

procedure TForm2.FormDropFiles(Sender: TObject; const FileNames: array of string);
var
  i:integer;
begin
  for i:=low(filenames) to high(filenames) do
  begin
  memo1.Append(fileNames[i]);
  end;
end;

procedure TForm2.ListBox1Click(Sender: TObject);
begin

end;

procedure TForm2.Memo1Change(Sender: TObject);
begin

end;

procedure TForm2.Memo1DragDrop(Sender, Source: TObject; X, Y: Integer);
begin

end;

procedure TForm2.Button1Click(Sender: TObject);

begin

  RenameFile('C:\Users\Naniii\Desktop\english project\testetste.txt','C:\Users\Naniii\Desktop\english project\NewDir\testetste.txt');

  {
  if DirectoryExists('NewDir') then
     begin
       for i:=0 to memo1.Lines.Count do
       begin
       RenameFile(memo1.lines[i],'C:\Users\Naniii\Desktop\english project\NewDir\'+ExtractFileName(memo1.Lines[i]));
       showmessage('done1');
        //listbox1.items.add(memo1.lines[i]);
       end;
     end
  else
  begin
  CreateDir ('NewDir');
   for i:=0 to memo1.Lines.Count do
       begin
   RenameFile(memo1.lines[i],'C:\Users\Naniii\Desktop\english project\NewDir\'+ExtractFileName(memo1.Lines[i]));
   showmessage('done2');
   end;
   //listbox1.items.add(memo1.lines[i]);
  end;
    }

  {
  //assignfile(f,'load_file.dat');
  if not(FileExists('testetste.txt')) then
    begin
  assignfile(f,'testetste.txt');
  rewrite(f);

   for i :=0 to memo1.lines.count do
  begin
    for j in memo1.Lines[i]do
    begin
    writeln(f,j);
    end;
  end;
end
  else

  begin
  assignfile(f,'testetste.txt');
  append(f);

      for i :=0 to memo1.lines.count do
  begin
    for j in memo1.Lines[i]do
    begin
    write(f,j);
    end;
  end;

  end;

  closefile(f);
  }

end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  {
   if listbox1.Count>0 then
     begin
     RenameFile('C:\Users\Naniii\Desktop\english project\NewDir\'+ExtractFileName(listbox1.GetSelectedText),listbox1.GetSelectedText);
  //showmessage(listbox1.GetSelectedText);
     end;
     }

  {
  s:='';
  assignfile(f,'testetste.txt');
  reset(f);
  for i :=1 to filesize(f) do
begin
read(f,c);
s:=s+c;
//writeln(c);
end;
  showmessage(s);

  closefile(f);

 //showmessage(Paramstr(0));
 }
end;

procedure TForm2.FileNameEdit1Change(Sender: TObject);
begin
  memo1.Append(filenameedit1.Text);
end;

end.

