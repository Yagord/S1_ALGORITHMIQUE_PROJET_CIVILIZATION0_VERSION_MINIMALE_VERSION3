unit UnitUpdate;

interface

uses UnitVille, UnitRecord, UnitGestion, UnitMath, GestionEcran;

procedure updateGame(var g: Game); // mise a jour du jeu entre chaque tour

implementation

procedure updateBatiments(var v: Ville); // mise a jour des batiments
begin

  if v.construction <> -1 then
  begin
    v.avancementConstruction := v.avancementConstruction + travailParTour(v);
  end;
  if v.avancementConstruction >= travailRequis(v) then
  begin
    case v.construction of
      1:
        v.ferme := v.ferme + 1;
      2:
        v.mine := v.mine + 1;
      3:
        v.carriere := v.carriere + 1;
      4:
        v.caserne := v.caserne + 1;
    end;
    v.construction := -1;
    v.avancementConstruction := 0;
  end;

end;

procedure updateVille(var v: Ville); // mise a jour de la ville
begin

  updateBatiments(v);

  v.nourriture := v.nourriture + nourritureParTour(v);

  repeat
    if nourriturePourCroissance(v) <= v.nourriture then
    begin
      v.nourriture := v.nourriture - nourriturePourCroissance(v);
      v.population := v.population + 1;
    end;
  until nourriturePourCroissance(v) > v.nourriture;

end;

procedure updateCivilisation(var c: Civilisation);
// mise a jour de la civilisation
begin

  updateVille(c.Ville);
  c.recrutement := c.Ville.caserne * 3;

end;

procedure updateGame(var g: Game);
begin

  updateCivilisation(g.Civilisation);
  effacerEcran;
  g.tour := g.tour + 1;

end;

end.
