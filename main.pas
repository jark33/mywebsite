unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, Menus,
  process, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    Panel1: TPanel;
    PopupMenu1: TPopupMenu;
    Process1: TProcess;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { private declarations }
    min : integer;
    hour: integer;
  public
    { public declarations }
  end; 

var
  Form1: TForm1; 

implementation

{ TForm1 }

procedure TForm1.MenuItem1Click(Sender: TObject);
begin
     Process1 := TProcess.Create(nil);

   // Tell the new AProcess what the command to execute is.
   // Let's use the FreePascal compiler
   Process1.CommandLine := '/usr/bin/mplayer alarmclock.wav';

   // We will define an option for when the program
   // is run. This option will make sure that our program
   // does not continue until the program we will launch
   // has stopped running.                vvvvvvvvvvvvvv
 //  Process1.Options := AProcess.Options + [poWaitOnExit];

   // Now that AProcess knows what the commandline is
   // we will run it.
   Process1.Execute;

   // This is not reached until ppc386 stops running.
   Process1.Free;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  timer1.Enabled:= false;
  panel1.Caption:= '2:31';
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  min := 23;
  hour := 2;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
       inc(min);
       panel1.Caption:= inttostr(hour) + ':' + inttostr(min);

       if min > 60 then
         begin
           min := 0;
           inc(hour);
         end;
end;

initialization
  {$I main.lrs}

end.

