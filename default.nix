self: super:

let
  build = self.python3Packages.buildPythonPackage;
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
    propagatedBuildInputs = with ps; [ pyqt5 pytz keyring dateutil ];
    meta = {
      homepage = https://pypi.org/project/BuildNotify/;
      description = "ruise Control build monitor for Windows/Linux/Mac";
      license = with super.stdenv.lib.licenses; [ gpl3 ];
      maintainers = [ ];
    };
  }; # buildnotify

  mendeleev = build rec {
    pname = "mendeleev";
    version = "0.5.1";
    src = ps.fetchPypi {
      inherit pname version;
      sha256 = "0ij2g4pp3r84n6j379h7105zg33zdwh6j5an7g0slzip5nkd45w8";
    };
    # No tests included
    doCheck = false;
    propagatedBuildInputs = with ps; [ sqlalchemy pyfiglet pandas colorama ];
    meta = {
      homepage = https://pypi.org/project/mendeleev/;
      description = "";
      license = with super.stdenv.lib.licenses; [ mit ];
      maintainers = [ ];
    };
  }; # mendeleev

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

  requests-html = build rec {
    pname="requests-html";
    version="0.10.0";
    src = ps.fetchPypi {
      inherit pname version;
      sha256="0irr03k1f2vx7p1h1fgw0dmx1i6pssaq4dmvjh4ivywmxp7rx4ky";
    };
    propagatedBuildInputs=with ps; [ fake-useragent w3lib requests pyppeteer beautifulsoup4 bs4 parse pyquery ];
  }; # requests-html

  fake-useragent = build rec {
    pname="fake-useragent";
    version="0.1.11";
    src = ps.fetchPypi {
      inherit pname version;
      sha256="0dfz3bpmjmaxlhda6hfgsac7afb65pljibi8zkp9gc0ffn5rj161";
    };
  }; # fake useragent

  w3lib = build rec {
    pname="w3lib";
    version="1.22.0";
    src = ps.fetchPypi {
      inherit pname version;
      sha256="1pv02lvvmgz2qb61vz1jkjc04fgm4hpfvaj5zm4i3mjp64hd1mha";
    };
    propagatedBuildInputs=with ps; [ six ];
  }; # w3lib

  pyppeteer = build rec {
    pname="pyppeteer";
    version="0.2.2";
    src = ps.fetchPypi {
      inherit pname version;
      sha256="1s92izan7s3iffc85wpwi1qv9brcq0rlfqyi84wmpmg1dxk64g0m";
    };
    propagatedBuildInputs=with ps; [ websockets pyee urllib3 tqdm appdirs self.chromium ];
    doCheck=false;
  }; # pyppeteer

  pyee = build rec {
    pname="pyee";
    version="7.0.2";
    src = ps.fetchPypi {
      inherit pname version;
      sha256="1n5kmqbmjk5xk1yhdz04izns231v2n9s15dqvgvvn619ngnd2269";
    };
    propagatedBuildInputs=with ps; [ pytest vcversioner pytest-asyncio pytest-runner ];
    doCheck=false;
  }; # pyee

  pytest-runner = build rec {
    pname="pytest-runner";
    version="5.2";
    src = ps.fetchPypi {
      inherit pname version;
      sha256="0awll1bva5zy8cspsxcpv7pjcrdf5c6pf56nqn4f74vvmlzfgiwn";
    };
    propagatedBuildInputs=with ps; [ setuptools_scm ];
    doCheck=false;
  }; # pytest-runner

  bs4 = build rec {
    pname="bs4";
    version="0.0.1";
    src = ps.fetchPypi {
      inherit pname version;
      sha256="0fnxhql23ql6q5n64xjknx3sc3fm4vgpbw0z99p0qp6cswgymv1n";
    };
    propagatedBuildInputs=with ps; [ beautifulsoup4 ];
  }; # bs4

in {

  python3 = super.python3.override {
    packageOverrides = pself: psuper: {
      inherit buildnotify;
      inherit mendeleev;
      inherit py2neo;
      inherit pygments231;
      inherit neotime;
      inherit neobolt;
      inherit requests-html;
      inherit fake-useragent;
      inherit w3lib;
      inherit pyppeteer;
      inherit pyee;
      inherit pytest-runner;
      inherit bs4;
    };
  };

}

