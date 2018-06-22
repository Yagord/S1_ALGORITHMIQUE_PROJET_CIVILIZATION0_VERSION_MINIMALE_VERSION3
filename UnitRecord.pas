unit UnitRecord;

interface

uses UnitMath;

// La ville qui contient son nom,population,nourriture ainsi que ses données de construction
type
  Ville = record
    nom: string;
    nourriture: Integer;
    population: Integer;
    ferme: Integer;
    mine: Integer;
    carriere: Integer;
    caserne: Integer;
    construction: Integer;
    avancementConstruction: Integer;
  end;

  // La civilisation qui contient son nom, ses données militaires ainsi que sa ville
  Civilisation = record
    nom: string;
    Ville: Ville;
    soldat: Integer;
    canon: Integer;
    recrutement: Integer;
  end;

  // Le jeu qui contient l'ensemble des données
  Game = record
    fini: Boolean;
    tour: Integer;
    Civilisation: Civilisation;
  end;

implementation

end.
