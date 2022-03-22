{ lib
, aiohttp
, buildPythonPackage
, fetchFromGitHub
, pythonOlder
}:

buildPythonPackage rec {
  pname = "pyskyqhub";
  version = "0.1.6";
  format = "setuptools";

  disabled = pythonOlder "3.8";

  src = fetchFromGitHub {
    owner = "RogerSelwyn";
    repo = "skyq_hub";
    rev = version;
    sha256 = "sha256-Qc7mb51KKGLNWjeiJKAsFO/RNLefv0sRHWwXodMBi/k=";
  };

  propagatedBuildInputs = [
    aiohttp
  ];

  # Tests require phyiscal hardware
  doCheck = false;

  pythonImportsCheck = [
    "pyskyqhub"
  ];

  meta = with lib; {
    description = "Python module for accessing SkyQ Hub";
    homepage = "https://github.com/RogerSelwyn/skyq_hub";
    license = licenses.asl20;
    maintainers = with maintainers; [ fab ];
  };
}
