# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="eac2487336dcc8260e8263253c91b264a584b1b8"

DESCRIPTION="C++ bindings over libffi"
HOMEPAGE="https://github.com/eliaskosunen/libcppffi"
SRC_URI="https://github.com/eliaskosunen/libcppffi/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	virtual/libffi
"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins -r include/cppffi
	dodoc README.md
}
