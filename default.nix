self: super: rec {

  # python3 overlay with missing packages

  python3Packages = super.python3Packages //
  {
    inherit buildnotify;
    inherit mendeleev;
  };

  buildnotify = super.python3Packages.buildPythonPackage rec {
    name = "buildnotify-${version}";
    version = "1.0.4";
    src = super.pkgs.fetchurl {
      url = "https://files.pythonhosted.org/packages/76/55/d0e1a56c106ec3fed0be5d14cf9f19b55aa452ba09aacc921300f3610ea9/BuildNotify-1.0.4.tar.gz";
      sha256 = "0642471d3b10fe51cd154f0982c32d1a4ee8c3c477497ef42a87332bf41c7173";
    };

    # No tests included
    doCheck = false;

    propagatedBuildInputs = with self.python3Packages; [ pyqt5 pytz keyring dateutil ];

    meta = {
      homepage = https://pypi.org/project/BuildNotify/;
      description = "ruise Control build monitor for Windows/Linux/Mac";
      license = with super.stdenv.lib.licenses; [ gpl3 ];
      maintainers = [ ];
    };
  }; # buildnotify

  mendeleev = super.python3Packages.buildPythonPackage rec {
    name = "mendeleev-${version}";
    version = "0.5.1";
    src = super.pkgs.fetchurl {
      url = "https://github.com/lmmentel/mendeleev/archive/master.zip";
      sha256 = "0n04rvpahpnm77kxcpfbdhfq45bm8958mbgdsa71ij5s5ks3kmn9";
    };

    # No tests included
    doCheck = false;

    propagatedBuildInputs = with self.python3Packages; [ sqlalchemy pyfiglet pandas colorama ];

    meta = {
      homepage = https://pypi.org/project/mendeleev/;
      description = "";
      license = with super.stdenv.lib.licenses; [ mit ];
      maintainers = [ ];
    };
  }; # mendeleev

}

