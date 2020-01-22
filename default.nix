self: super: rec {

  # python3 overlay with missing packages

  python3Packages = super.python3Packages //
  {
    #inherit buildnotify;
    #inherit mendeleev;
    inherit py2neo;
    inherit pygments231;
    inherit neotime;
    inherit neobolt;
  };

  build = super.python3Packages.buildPythonPackage;
  ps = self.python3Packages;

  buildnotify = build rec {
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
    pname = "mendeleev";
    version = "0.5.1";
    src = ps.fetchPypi {
      inherit pname version;
      sha256 = "0ij2g4pp3r84n6j379h7105zg33zdwh6j5an7g0slzip5nkd45w8";
    };
    #src = super.pkgs.fetchurl {
    #  url = "https://github.com/lmmentel/mendeleev/archive/master.zip";
    #  #sha256 = "0n04rvpahpnm77kxcpfbdhfq45bm8958mbgdsa71ij5s5ks3kmn9";
    #  sha256 = "114hh617v5iis2cp3dvkh13qzvrjnpr229d768rsak473p412af9";
    #};

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

  py2neo = build rec {
    pname = "py2neo";
    version = "4.3.0";
    src = ps.fetchPypi {
      inherit pname version;
      sha256 = "08lj465d68zjbis7z9bjf4hh01phh2nynx3bm87qbqrnnsscq652";
    };
    propagatedBuildInputs = with ps; [ self.neo4j urllib3 pygments231 prompt_toolkit colorama pytz neotime click neobolt ];
    doCheck = false;
    meta = {
      homepage = "https://py2neo.org/v4/";
      description = "Py2neo is a client library and toolkit for working with Neo4j from within Python applications and from the command line";
    };
  }; # py2neo

  pygments231 = build rec {
    pname = "Pygments";
    version = "2.3.1";
    src = ps.fetchPypi {
      inherit pname version;
      sha256 = "0ji87g09jph8jqcvclgb02qvxasdnr9pzvk90rl66d90yqcxmyjz";
    };
    doCheck = false;
    meta = {
      homepage = "";
      description = "";
    };
  }; # pygments 231

  neotime = build rec {
    pname = "neotime";
    version = "1.7.4";
    src = ps.fetchPypi {
      inherit pname version;
      sha256 = "1sv3fdnshlkcjy6xpdg01pr43n9bvqv356m75zg09q141yx7f12f";
    };
    doCheck = false;
    propagatedBuildInputs = with ps; [ six pytz ];
    meta = {
      homepage = "";
      description = "";
    };
  }; # neotime

  neobolt = build rec {
    pname = "neobolt";
    version = "1.7.16";
    src = ps.fetchPypi {
      inherit pname version;
      sha256 = "0p976amhabikdy14x8496ay6pp6v0a76af1nqap3kvg3kxkqfkna";
    };
    doCheck = false;
    propagatedBuildInputs = with ps; [  ];
    meta = {
      homepage = "";
      description = "";
    };
  }; # neotime

}

