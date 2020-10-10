{
  allowUnfree = true;

  packageOverrides = pkgs: {
    python3 = pkgs.python3.override {
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
