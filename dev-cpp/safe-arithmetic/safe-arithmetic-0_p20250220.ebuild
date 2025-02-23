# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="02ce2193a6a4543c445a8d8947385a7c8bb2c4c0"

DESCRIPTION="A general purpose C++20 library for writing safe and bug-free code"
HOMEPAGE="https://github.com/intel/safe-arithmetic"
SRC_URI="https://github.com/intel/safe-arithmetic/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSL-1.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/boost
"
BDEPEND=""

src_install() {
	doheader -r include/safe{,.hpp}
	einstalldocs
}
