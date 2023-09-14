# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools vcs-snapshot

DESCRIPTION="pLisp is an integrated development environment for Lisp"
HOMEPAGE="https://github.com/shikantaza/pLisp"
SRC_URI="https://github.com/shikantaza/pLisp/archive/v0.1.7.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-lang/tcc
	dev-libs/boehm-gc
	virtual/libffi
	x11-libs/gtksourceview
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	eautoreconf
}
