unit UnitVille;

interface

uses UnitRecord, UnitAffichage, Math;

function nourritureParTour(v: Ville): integer; // renvoie le nombre de nourriture produite par tour
function nourriturePourCroissance(v: Ville): integer; // renvoie la nourriture requise pour que la population augmente
function tourPourCroissance(v: Ville): integer; // renvoie le nombre de tour requis pour que la population augmente
function travailParTour(v: Ville): integer; // renvoie le travail par tour
function travailRequis(v: Ville): integer; // renvoie le travail requis pour construire le batiment en cours
function nomBatiment(code: integer): string; // d'apres un nombre renvoie le nom du batiment correspondant
function nbBatiment(v: Ville): integer; // donne le nombre de batiment
function sommeBatiment(v: Ville): integer; // donne la somme des niveau des batiments

implementation

function nbBatiment(v: Ville): integer;
var
  nb: integer; // entier comptant le nombre de ville
begin
  nb := 0;
  if v.ferme > 0 then
    nb := nb + 1;
  if v.mine > 0 then
    nb := nb + 1;
  if v.carriere > 0 then
    nb := nb + 1;
  if v.caserne > 0 then
    nb := nb + 1;

  result := nb;
end;

function sommeBatiment(v: Ville): integer;
begin
  result := v.ferme +v.mine +v.carriere +v.caserne;
end;

function travailRequis(v: Ville): integer;
begin
  case v.construction of
    1:
      result := (v.ferme + 1) * 10;
    2:
      result := (v.mine + 1) * 15;
    3:
      result := (v.carriere + 1) * 20;
    4:
      result := (v.caserne + 1) * 25;
  end;
end;

function nourritureParTour(v: Ville): integer;
var
  nourriture: integer; // entier comptant la production de nourriture par tour
begin
  nourriture := 0;
  nourriture := nourriture + v.ferme * 2;
  nourriture := nourriture - v.population + 2;

  result := nourriture;
end;

function travailParTour(v: Ville): integer;
var
  travail: integer; // entier comptant le travail effectué par tour
begin
  travail := v.population;
  travail := travail + v.mine * 2;
  travail := travail + v.carriere * 3;
  result := travail;
end;

function nourriturePourCroissance(v: Ville): integer;
begin
  result := v.population * 10 + 10;
end;

function tourPourCroissance(v: Ville): integer;
begin
  if nourritureParTour(v) <= 0 then
  begin
    result := -1;
  end
  else
  begin
    result := ceil((nourriturePourCroissance(v) - v.nourriture) / nourritureParTour(v));
  end;
end;

function nomBatiment(code: integer): string;
begin
  result := '';

  if code = 1 then
    result := 'Ferme';
  if code = 2 then
    result := 'Mine';
  if code = 3 then
    result := 'Carriere';
  if code = 4 then
    result := 'Caserne';
end;

function codeBatiment(nom: string): integer;
begin
  result := 0;

  if nom = 'Ferme' then
    result := 1;
  if nom = 'Mine' then
    result := 2;
  if nom = 'Carriere' then
    result := 3;
  if nom = 'Caserne' then
    result := 4;
end;

end.
