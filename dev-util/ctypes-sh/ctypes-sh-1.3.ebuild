# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

MY_PN=${PN/-/.}

DESCRIPTION="A foreign function interface for bash"
HOMEPAGE="https://github.com/taviso/ctypes.sh"
SRC_URI="https://github.com/taviso/ctypes.sh/archive/refs/tags/v${PV}.tar.gz
	-> ${P}.gh.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"

# MIT for the project code, LGPL-2.1+ for the vendored glibc obstack.
LICENSE="MIT LGPL-2.1+"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=app-shells/bash-5.0[plugins]
	dev-libs/elfutils
	dev-libs/libffi
	virtual/zlib
"
RDEPEND="${DEPEND}"
