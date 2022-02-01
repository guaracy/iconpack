unit uiconpack;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, SQLite3Conn, SQLDB, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, DBGrids, DBCtrls, ZConnection, ZDataset;

type

  { TForm1 }

  TForm1 = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBImage1: TDBImage;
    Panel1: TPanel;
    imgPanel: TPanel;
    SQLite3Connection1: TSQLite3Connection;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure DBImage1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  SQLite3Connection1.Open;
  SQLQuery1.Open;
end;

procedure TForm1.DBImage1Click(Sender: TObject);
begin
  DBImage1.CopyToClipboard;
  ShowMessage('Copiada para a área de transferência.')
end;

end.

