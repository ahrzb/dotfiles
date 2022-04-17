{ stdenv, fetchFromGitHub, cmake, boost, ... }:

stdenv.mkDerivation {
  name = "kenlm-20201107";
  src = fetchFromGitHub {
    owner = "kpu";
    repo = "kenlm";
    rev = "4a277534fd33da323205e6ec256e8fd0ff6ee6fa";
    sha256 = "0f8ars6612p3nv86wygwac6mx6bw8z5xgpf5sznl0fydq18i6gq6";
  };
  nativeBuildInputs = [ cmake boost ];
}
