unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls, TeEngine, Series, TeeProcs, Chart;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Chart1: TChart;
    Series1: TLineSeries;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
function PRIMO(N:integer):boolean;
var
  c : integer;
  P : boolean;
begin
  c := 1;
  P := true;
  if N <= 1 then
    P := false
  else
    if N = 2 then
      P := true
    else
      repeat
        c := c + 1;
        if N mod c = 0 then
          P := false;
      until (P=false)or(c>=trunc(sqrt(N)));
  result := P;
end;

procedure ESPIRAL_SACKS(N:integer;var Chart:TChart);
var
  i : integer;
  r,ang,x,y : real;
begin
  Chart.SeriesList[0].Clear;
  for i :=  1 to N do
    if PRIMO(i) then begin
      r := sqrt(i);
      ang := 2*pi*frac(sqrt(i));
      x := r * cos(ang);
      y := r * sin(ang);
      Chart.SeriesList[0].AddXY(x,y);
    end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  N:integer;
begin
  N := 100000;
  ESPIRAL_SACKS(N,Chart1);
end;

end.
