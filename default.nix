self: super: rec {
  pythonPackages = super.pythonPackages //
  {
    inherit buildnotify;
  };

  buildnotify = super.pythonPackages.buildPythonPackage rec {
    name = "buildnotify-${version}";
    version = "1.0.4";
    src = super.pkgs.fetchurl {
      url = "https://files.pythonhosted.org/packages/76/55/d0e1a56c106ec3fed0be5d14cf9f19b55aa452ba09aacc921300f3610ea9/BuildNotify-1.0.4.tar.gz";
      sha256 = "0642471d3b10fe51cd154f0982c32d1a4ee8c3c477497ef42a87332bf41c7173";
    };

    # No tests included
    doCheck = false;

    propagatedBuildInputs = with self.pythonPackages; [ pyqt5 ];

    meta = {
      homepage = https://pypi.org/project/BuildNotify/;
      description = "ruise Control build monitor for Windows/Linux/Mac";
      license = super.licenses.gpl3;
      maintainers = [ ];
    };
  }; # buildnotify

}

