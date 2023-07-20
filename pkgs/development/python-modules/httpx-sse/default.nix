{
  lib,
  buildPythonPackage,
  fetchPypi,
  nix-update-script,
  httpx,
  pytest,
  pytest-cov,
  pytest-asyncio,
  starlette,
  setuptools,
  setuptools-scm,
  pytestCheckHook,
  pythonOlder,
}:
buildPythonPackage rec {
  pname = "httpx-sse";
  version = "0.3.1";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    pname = "httpx-sse";
    inherit version;
    hash = "sha256-O7Momyhn9Qy9sv7j7u7+yx6GZTEi4WT6rAAj8f/Iiuo=";
  };

  propagatedBuildInputs = [
    httpx
  ];

  nativeBuildInputs = [
    setuptools
    setuptools-scm
  ];

  doCheck = false;
  # nativeCheckInputs = [
  #   pytest
  #   pytest-cov
  #   pytest-asyncio
  #   starlette
  #   pytestCheckHook
  # ];

  # pytestFlagsArray = [
  #   "tests/"
  # ];

  pythonImportsCheck = [
    "httpx_sse"
  ];

  passthru.updateScript = nix-update-script {};

  meta = with lib; {
    description = "SSE Support for httpx";
    homepage = "https://github.com/florimondmanca/httpx-sse";
    license = licenses.mit;
    maintainers = with maintainers; [emattiza];
  };
}
