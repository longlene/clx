# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="TurboPython: compiles typed Python to C++ and native binaries"
HOMEPAGE="
	https://tpy-lang.org
	https://github.com/trozen/tpy-lang
"
SRC_URI="https://github.com/trozen/tpy-lang/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0-with-LLVM-exceptions"
SLOT="0"
KEYWORDS="~amd64"
# test suite compiles and runs thousands of generated C++ programs
RESTRICT="test"

# generated code needs C++23 + GNU statement expressions: g++ 13+ or clang++ 19+
RDEPEND="
	|| (
		>=sys-devel/gcc-13:*
		>=llvm-core/clang-19:*
	)
"
