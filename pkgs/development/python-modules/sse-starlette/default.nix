{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pytest-asyncio,
  anyio,
  starlette,
  httpx,
  setuptools,
  setuptools-scm,
  pytestCheckHook,
}:
buildPythonPackage rec {
  pname = "sse-starlette";
  version = "1.6.1";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "sysid";
    repo = "sse-starlette";
    rev = "v${version}";
    sha256 = "sha256-b96J+P0X/4oxEZf6X58lUhExF2DapDn1EdxXIUbqrhs=";
  };

  nativeBuildInputs = [setuptools setuptools-scm starlette];

  nativeCheckInputs = [httpx starlette anyio pytest-asyncio pytestCheckHook];

  pytestFlagsArray = [
    "--fixtures tests/conftest.py"
  ];

  # asgi_lifespan is missing
  doCheck = false;

  pythonImportsCheck = ["sse_starlette"];

  meta = with lib; {
    description = "SSE Support for Starlette";
    homepage = "https://github.com/sysid/sse-starlette";
    license = licenses.bsd3;
    maintainers = with maintainers; [emattiza];
  };
}
