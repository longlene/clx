# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

MY_PN="tvm-ffi"
MY_PV="0.1.11"
MY_P="${MY_PN}-${MY_PV}"

DESCRIPTION="torch c dlpack ext"
HOMEPAGE="
	https://github.com/apache/tvm-ffi/
"
SRC_URI="
	https://github.com/apache/tvm-ffi/archive/refs/tags/v${MY_PV}.tar.gz -> ${MY_P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
S="${WORKDIR}"/${MY_P}/addons/torch_c_dlpack_ext
KEYWORDS="~amd64"

DEPEND+="
	sci-ml/tvm-ffi[python,${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}
"
#BDEPEND="
#"
RESTRICT="test"

PATCHES=(
	"${FILESDIR}"/python-fix.patch
)
