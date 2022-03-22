{
  description = ''terminal tables'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-terminaltables-master.flake = false;
  inputs.src-terminaltables-master.owner = "xmonader";
  inputs.src-terminaltables-master.ref   = "master";
  inputs.src-terminaltables-master.repo  = "nim-terminaltables";
  inputs.src-terminaltables-master.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-terminaltables-master"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-terminaltables-master";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}