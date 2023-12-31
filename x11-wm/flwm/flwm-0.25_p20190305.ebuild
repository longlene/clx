# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="f55bf9851cbfeda4643d2b7aa2b5d5496199e079"

DESCRIPTION="The Fast Light Window Manager"
HOMEPAGE="https://github.com/tinycorelinux/flwm"
SRC_URI="https://github.com/tinycorelinux/flwm/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="x11-libs/fltk"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e '/strip/d' \
		-i compileit
}

src_compile() {
	./compileit || die "compile failed"
}

src_install() {
	dobin flwm
	doman flwm.1
	einstalldocs
}
