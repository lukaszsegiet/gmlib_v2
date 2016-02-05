{
  @abstract(@code(google.maps.Map) class from Google Maps API.)
  @author(Xavier Martinez (cadetill) <cadetill@gmail.com>)
  @created(Septembre 30, 2015)
  @lastmod(October 1, 2015)

  The GMMapVCL contains the implementation of TGMMap class that encapsulate the @code(google.maps.Map) class from Google Maps API and other related classes.
}
unit GMMap.VCL;

{$I ..\..\gmlib.inc}

interface

uses
  {$IFDEF DELPHIXE2}
  Vcl.Graphics, System.Classes, SHDocVw, Vcl.ExtCtrls,
  {$ELSE}
  Graphics, Classes, SHDocVw, ExtCtrls,
  {$ENDIF}

  GMMap, GMClasses;

type
  { -------------------------------------------------------------------------- }
  // @include(..\..\docs\GMMap.VCL.TGMMapTypeStyler.txt)
  TGMMapTypeStyler = class(TGMCustomMapTypeStyler)
  private
    FColor: TColor;
    FHue: TColor;
    procedure SetColor(const Value: TColor);
    procedure SetHue(const Value: TColor);
  protected
    // @include(..\..\docs\GMMap.VCL.TGMMapTypeStyler.PropToString.txt)
    function PropToString: string; override;
  published
    // @include(..\..\docs\GMMap.VCL.TGMMapTypeStyler.Color.txt)
    property Color: TColor read FColor write SetColor default clBlack;
    // @include(..\..\docs\GMMap.VCL.TGMMapTypeStyler.Hue.txt)
    property Hue: TColor read FHue write SetHue default clBlack;
    // @include(..\..\docs\GMMap.VCL.TGMMapTypeStyler.Gamma.txt)
    property Gamma;
    // @include(..\..\docs\GMMap.VCL.TGMMapTypeStyler.InvertLightness.txt)
    property InvertLightness;
    // @include(..\..\docs\GMMap.VCL.TGMMapTypeStyler.Lightness.txt)
    property Lightness;
    // @include(..\..\docs\GMMap.VCL.TGMMapTypeStyler.Saturation.txt)
    property Saturation;
    // @include(..\..\docs\GMMap.VCL.TGMMapTypeStyler.Visibility.txt)
    property Visibility;
    // @include(..\..\docs\GMMap.VCL.TGMMapTypeStyler.Weight.txt)
    property Weight;
  end;

  { -------------------------------------------------------------------------- }
  // @include(..\..\docs\GMMap.VCL.TGMMapTypeStylers.txt)
  TGMMapTypeStylers = class(TGMInterfacedCollection)
  private
    function GetItems(I: Integer): TGMMapTypeStyler;
    procedure SetItems(I: Integer; const Value: TGMMapTypeStyler);
  public
    // @include(..\..\docs\GMMap.VCL.TGMMapTypeStylers.Add.txt)
    function Add: TGMMapTypeStyler;
    // @include(..\..\docs\GMMap.VCL.TGMMapTypeStylers.Insert.txt)
    function Insert(Index: Integer): TGMMapTypeStyler;

    // @include(..\..\docs\GMMap.VCL.TGMMapTypeStylers.Items.txt)
    property Items[I: Integer]: TGMMapTypeStyler read GetItems write SetItems; default;
  end;

  { -------------------------------------------------------------------------- }
  // @include(..\..\docs\GMMap.VCL.TGMMapTypeStyle.txt)
  TGMMapTypeStyle = class(TGMCustomMapTypeStyle)
  private
    FStylers: TGMMapTypeStylers;
  public
    // @include(..\..\docs\GMMap.VCL.TGMMapTypeStyle.Create.txt)
    constructor Create(Collection: TCollection); override;
    // @include(..\..\docs\GMMap.VCL.TGMMapTypeStyle.Destroy.txt)
    destructor Destroy; override;
  published
    // @include(..\..\docs\GMMap.VCL.TGMMapTypeStyle.ElementType.txt)
    property ElementType;
    // @include(..\..\docs\GMMap.VCL.TGMMapTypeStyle.FeatureType.txt)
    property FeatureType;
    // @include(..\..\docs\GMMap.VCL.TGMMapTypeStyle.Stylers.txt)
    property Stylers: TGMMapTypeStylers read FStylers write FStylers;
  end;

  { -------------------------------------------------------------------------- }
  // @include(..\..\docs\GMMap.VCL.TGMMapTypeStyles.txt)
  TGMMapTypeStyles = class(TGMInterfacedCollection)
  private
    function GetItems(I: Integer): TGMMapTypeStyle;
    procedure SetItems(I: Integer; const Value: TGMMapTypeStyle);
  public
    // @include(..\..\docs\GMMap.VCL.TGMMapTypeStyles.Add.txt)
    function Add: TGMMapTypeStyle;
    // @include(..\..\docs\GMMap.VCL.TGMMapTypeStyles.Insert.txt)
    function Insert(Index: Integer): TGMMapTypeStyle;

    // @include(..\..\docs\GMMap.VCL.TGMMapTypeStyles.Items.txt)
    property Items[I: Integer]: TGMMapTypeStyle read GetItems write SetItems; default;
  end;

  { -------------------------------------------------------------------------- }
  // @include(..\..\docs\GMMap.VCL.TGMMapOptions.txt)
  TGMMapOptions = class(TGMCustomMapOptions)
  private
    FBackgroundColor: TColor;
    FStyles: TGMMapTypeStyles;
    procedure SetBackgroundColor(const Value: TColor);
    function GetCountStyles: Integer;
  public
    // @include(..\..\docs\GMMap.VCL.TGMMapOptions.Create.txt)
    constructor Create(AOwner: TPersistent); override;
    // @include(..\..\docs\GMMap.VCL.TGMMapOptions.Destroy.txt)
    destructor Destroy; override;

    // @include(..\..\docs\GMMap.VCL.TGMMapOptions.CountStyles.txt)
    property CountStyles: Integer read GetCountStyles;
  published
    // @include(..\..\docs\GMMap.VCL.TGMMapOptions.BackgroundColor.txt)
    property BackgroundColor: TColor read FBackgroundColor write SetBackgroundColor default clBlack;

    // @include(..\..\docs\GMMap.VCL.TGMMapOptions.Center.txt)
    property Center;
    // @include(..\..\docs\GMMap.VCL.TGMMapOptions.DisableDefaultUI.txt)
    property DisableDefaultUI;
    // @include(..\..\docs\GMMap.VCL.TGMMapOptions.DisableDoubleClickZoom.txt)
    property DisableDoubleClickZoom;
    // @include(..\..\docs\GMMap.VCL.TGMMapOptions.Draggable.txt)
    property Draggable;
    // @include(..\..\docs\GMMap.VCL.TGMMapOptions.DraggableCursor.txt)
    property DraggableCursor;
    // @include(..\..\docs\GMMap.VCL.TGMMapOptions.DraggingCursor.txt)
    property DraggingCursor;
    // @include(..\..\docs\GMMap.VCL.TGMMapOptions.Heading.txt)
    property Heading;
    // @include(..\..\docs\GMMap.VCL.TGMMapOptions.KeyboardShortcuts.txt)
    property KeyboardShortcuts;
    // @include(..\..\docs\GMMap.VCL.TGMMapOptions.MapMaker.txt)
    property MapMaker;
    // @include(..\..\docs\GMMap.VCL.TGMMapOptions.MapTypeControl.txt)
    property MapTypeControl;
    // @include(..\..\docs\GMMap.VCL.TGMMapOptions.MapTypeControlOptions.txt)
    property MapTypeControlOptions;
    // @include(..\..\docs\GMMap.VCL.TGMMapOptions.MapTypeId.txt)
    property MapTypeId;
    // @include(..\..\docs\GMMap.VCL.TGMMapOptions.MaxZoom.txt)
    property MaxZoom;
    // @include(..\..\docs\GMMap.VCL.TGMMapOptions.MinZoom.txt)
    property MinZoom;
    // @include(..\..\docs\GMMap.VCL.TGMMapOptions.NoClear.txt)
    property NoClear;
    // @include(..\..\docs\GMMap.VCL.TGMMapOptions.OverviewMapControl.txt)
    property OverviewMapControl;
    // @include(..\..\docs\GMMap.VCL.TGMMapOptions.OverviewMapControlOptions.txt)
    property OverviewMapControlOptions;
    // @include(..\..\docs\GMMap.VCL.TGMMapOptions.PanControl.txt)
    property PanControl;
    // @include(..\..\docs\GMMap.VCL.TGMMapOptions.PanControlOptions.txt)
    property PanControlOptions;
    // @include(..\..\docs\GMMap.VCL.TGMMapOptions.RotateControl.txt)
    property RotateControl;
    // @include(..\..\docs\GMMap.VCL.TGMMapOptions.RotateControlOptions.txt)
    property RotateControlOptions;
    // @include(..\..\docs\GMMap.VCL.TGMMapOptions.ScaleControl.txt)
    property ScaleControl;
    // @include(..\..\docs\GMMap.VCL.TGMMapOptions.ScaleControlOptions.txt)
    property ScaleControlOptions;
    // @include(..\..\docs\GMMap.VCL.TGMMapOptions.Scrollwheel.txt)
    property Scrollwheel;
    // @include(..\..\docs\GMMap.VCL.TGMMapOptions.StreetView.txt)
    property StreetView;
    // @include(..\..\docs\GMMap.VCL.TGMMapOptions.StreetViewControl.txt)
    property StreetViewControl;
    // @include(..\..\docs\GMMap.VCL.TGMMapOptions.StreetViewControlOptions.txt)
    property StreetViewControlOptions;
    // @include(..\..\docs\GMMap.VCL.TGMMapOptions.Styles.txt)
    property Styles: TGMMapTypeStyles read FStyles write FStyles;
    // @include(..\..\docs\GMMap.VCL.TGMMapOptions.Tilt.txt)
    property Tilt;
    // @include(..\..\docs\GMMap.VCL.TGMMapOptions.Zoom.txt)
    property Zoom;
    // @include(..\..\docs\GMMap.VCL.TGMMapOptions.ZoomControl.txt)
    property ZoomControl;
    // @include(..\..\docs\GMMap.VCL.TGMMapOptions.ZoomControlOptions.txt)
    property ZoomControlOptions;
  end;

  { -------------------------------------------------------------------------- }
  // @include(..\..\docs\GMMap.VCL.TGMMap.txt)
  TGMMap = class(TGMCustomGMMap)
  private
    FMapOptions: TGMMapOptions;
    FTimer: TTimer;    // TTimer for map events control

    function GetWebBrowser: TWebBrowser;
    procedure SetWebBrowser(const Value: TWebBrowser); (*1 *)
  protected
    // @include(..\..\docs\GMMap.VCL.TGMMap.SetIntervalTimer.txt)
    procedure SetIntervalTimer(Interval: Integer); override;
    // @include(..\..\docs\GMMap.VCL.TGMMap.LoadMap.txt)
    procedure LoadMap; override; (*1 *)
    // @include(..\..\docs\GMMap.VCL.TGMMap.LoadHTMLCodeAndWait.txt)
    procedure LoadHTMLCodeAndWait;
  public
    // @include(..\..\docs\GMMap.VCL.TGMMap.Create.txt)
    constructor Create(AOwner: TComponent); override;
    // @include(..\..\docs\GMMap.VCL.TGMMap.Destroy.txt)
    destructor Destroy; override;

    // @include(..\..\docs\GMMap.VCL.TGMMap.GetAPIUrl.txt)
    function GetAPIUrl: string; override;
  published
    // @include(..\..\docs\GMMap.VCL.TGMMap.MapOptions.txt)
    property MapOptions: TGMMapOptions read FMapOptions write FMapOptions;
    // @include(..\..\docs\GMMap.VCL.TGMMap.Active.txt)
    property Active;
    // @include(..\..\docs\GMMap.VCL.TGMMap.GoogleAPIVer.txt)
    property GoogleAPIVer;
    // @include(..\..\docs\GMMap.VCL.TGMMap.Language.txt)
    property Language;
    // @include(..\..\docs\GMMap.VCL.TGMMap.AboutGMLib.txt)
    property AboutGMLib;
    // @include(..\..\docs\GMMap.VCL.TGMMap.APIUrl.txt)
    property APIUrl;
    // @include(..\..\docs\GMMap.VCL.TGMMap.GoogleAPIKey.txt)
    property GoogleAPIKey;
    // @include(..\..\docs\GMMap.VCL.TGMMap.IntervalEvents.txt)
    property IntervalEvents;
    // @include(..\..\docs\GMMap.VCL.TGMMap.WebBrowser.txt)
    property WebBrowser: TWebBrowser read GetWebBrowser write SetWebBrowser;
  end;

implementation

uses
  {$IFDEF DELPHIXE2}
  System.SysUtils,
  {$ELSE}
  SysUtils,
  {$ENDIF}

  GMClasses.VCL;

{ TGMMapOptions }

constructor TGMMapOptions.Create(AOwner: TPersistent);
begin
  inherited;

  FBackgroundColor := clBlack;
  FStyles := TGMMapTypeStyles.Create(Self, TGMMapTypeStyle);
end;

destructor TGMMapOptions.Destroy;
begin
  if Assigned(FStyles) then FreeAndNil(FStyles);

  inherited;
end;

function TGMMapOptions.GetCountStyles: Integer;
begin
  Result := FStyles.Count;
end;

procedure TGMMapOptions.SetBackgroundColor(const Value: TColor);
begin
  if FBackgroundColor = Value then Exit;

  FBackgroundColor := Value;
  ControlChanges;
end;

{ TGMMapTypeStyler }

function TGMMapTypeStyler.PropToString: string;
const
  Str = '%s,%s';
begin
  Result := inherited PropToString;
  if Result <> '' then Result := Result + ',';
  Result := Result +
            Format(Str, [QuotedStr(TGMTransformVCL.TColorToStr(FColor)),
                         QuotedStr(TGMTransformVCL.TColorToStr(FHue))
                         ]);
end;

procedure TGMMapTypeStyler.SetColor(const Value: TColor);
begin
  if FColor = Value then Exit;

  FColor := Value;
  ControlChanges;
end;

procedure TGMMapTypeStyler.SetHue(const Value: TColor);
begin
  if FHue = Value then Exit;

  FHue := Value;
  ControlChanges;
end;

{ TGMMap }

constructor TGMMap.Create(AOwner: TComponent);
begin
  inherited;

  FMapOptions := TGMMapOptions.Create(Self);

  FTimer := TTimer.Create(Self);
  FTimer.Enabled := False;
  FTimer.Interval := 200;
  FTimer.OnTimer := OnTimer;
end;

destructor TGMMap.Destroy;
begin
  if Assigned(FMapOptions) then FreeAndNil(FMapOptions);
  if Assigned(FTimer) then FreeAndNil(FTimer);

  inherited;
end;

function TGMMap.GetAPIUrl: string;
begin
  Result := 'https://developers.google.com/maps/documentation/javascript/reference#Map';
end;

function TGMMap.GetWebBrowser: TWebBrowser;
begin
  Result := nil;
  if FWebBrowser is TWebBrowser then
    Result := TWebBrowser(FWebBrowser);
end;

procedure TGMMap.LoadHTMLCodeAndWait;
var
  StringStream: TStringStream;
  PersistStreamInit: IPersistStreamInit;
  StreamAdapter: IStream;
begin
  if not Assigned(FWebBrowser) then Exit;
  if not (FWebBrowser is TWebBrowser) then Exit;

  // creaci�n del TStringStream con el string que contiene la p�gina web
  StringStream := TStringStream.Create(GetBaseHTMLCode);
  try
    // nos aseguramos de tener alg�n contenido en Document
    if not Assigned(TWebBrowser(FWebBrowser).Document) then LoadBlankPage;

    // acceder a la interfaz IPersistStreamInit de Document
    if TWebBrowser(FWebBrowser).Document.QueryInterface(IPersistStreamInit, PersistStreamInit) = S_OK then
    begin
      // borrar datos actuales
      if PersistStreamInit.InitNew = S_OK then
      begin
        // creaci�n y inicializaci�n del IStream
        StreamAdapter:= TStreamAdapter.Create(StringStream);
        // carga de la p�gina web mediante IPersistStreamInit
        PersistStreamInit.Load(StreamAdapter);
      end;
    end;
  finally
    StringStream.Free;
  end;
end;

procedure TGMMap.LoadMap;
begin
  inherited;

  LoadHTMLCodeAndWait;
end;

procedure TGMMap.SetIntervalTimer(Interval: Integer);
begin
  inherited;

  if Assigned(FTimer) then FTimer.Interval := Interval;
end;

procedure TGMMap.SetWebBrowser(const Value: TWebBrowser);
begin
  if FWebBrowser = Value then Exit;

{
  if (Value <> FWebBrowser) and Assigned(FWebBrowser) then
  begin
    TWebBrowser(FWebBrowser).OnBeforeNavigate2 := OldBeforeNavigate2;
    TWebBrowser(FWebBrowser).OnDocumentComplete := OldDocumentComplete;
    TWebBrowser(FWebBrowser).OnNavigateComplete2 := OldNavigateComplete2;
  end;
}

  FWebBrowser := Value;
{
  TWebControl(FWC).SetBrowser(TWebBrowser(FWebBrowser));

  if csDesigning in ComponentState then Exit;

  if Assigned(FWebBrowser) then
  begin
    OldBeforeNavigate2 := TWebBrowser(FWebBrowser).OnBeforeNavigate2;
    OldDocumentComplete := TWebBrowser(FWebBrowser).OnDocumentComplete;
    OldNavigateComplete2 := TWebBrowser(FWebBrowser).OnNavigateComplete2;

    TWebBrowser(FWebBrowser).OnBeforeNavigate2 := BeforeNavigate2;
    TWebBrowser(FWebBrowser).OnDocumentComplete := DocumentComplete;
    TWebBrowser(FWebBrowser).OnNavigateComplete2 := NavigateComplete2;

    if Active then LoadBaseWeb;
  end;
}
end;

{ TGMMapTypeStyles }

function TGMMapTypeStyles.Add: TGMMapTypeStyle;
begin
  Result := TGMMapTypeStyle(inherited Add);
end;

function TGMMapTypeStyles.GetItems(I: Integer): TGMMapTypeStyle;
begin
  Result := TGMMapTypeStyle(inherited Items[I]);
end;

function TGMMapTypeStyles.Insert(Index: Integer): TGMMapTypeStyle;
begin
  Result := TGMMapTypeStyle(inherited Insert(Index));
end;

procedure TGMMapTypeStyles.SetItems(I: Integer; const Value: TGMMapTypeStyle);
begin
  inherited SetItem(I, Value);
end;

{ TGMMapTypeStylers }

function TGMMapTypeStylers.Add: TGMMapTypeStyler;
begin
  Result := TGMMapTypeStyler(inherited Add);
end;

function TGMMapTypeStylers.GetItems(I: Integer): TGMMapTypeStyler;
begin
  Result := TGMMapTypeStyler(inherited Items[I]);
end;

function TGMMapTypeStylers.Insert(Index: Integer): TGMMapTypeStyler;
begin
  Result := TGMMapTypeStyler(inherited Insert(Index));
end;

procedure TGMMapTypeStylers.SetItems(I: Integer; const Value: TGMMapTypeStyler);
begin
  inherited SetItem(I, Value);
end;

{ TGMMapTypeStyle }

constructor TGMMapTypeStyle.Create(Collection: TCollection);
begin
  inherited;

  FStylers := TGMMapTypeStylers.Create(Self, TGMMapTypeStyler);
end;

destructor TGMMapTypeStyle.Destroy;
begin
  if Assigned(FStylers) then FreeAndNil(FStylers);

  inherited;
end;

end.
