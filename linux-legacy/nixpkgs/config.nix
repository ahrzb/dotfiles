{
  allowUnfree = true;

  permittedInsecurePackages = [ "mupdf-1.17.0" ];

  packageOverrides = pkgs: {
    kenlm = pkgs.callPackage ./modules/kenlm.nix { };

    python38 = pkgs.python38.override {
      packageOverrides = python-self: python-super: {
        PyHTML = python-self.buildPythonPackage rec {
          pname = "PyHTML";
          version = "1.3.1";

          src = python-self.fetchPypi {
            inherit pname version;
            sha256 = "16dl2ymvzj905nj4bs4ilsjp7faldvdsaw61fy5zyplpasy1lkrp";
          };

          doCheck = false;
          buildInputs = [ python-self.six ];
        };
      };
    };
  };
}
