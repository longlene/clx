# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit toolchain-funcs

DESCRIPTION="Unicorn CPU emulator framework"
HOMEPAGE="http://www.unicorn-engine.org"
SRC_URI="https://github.com/unicorn-engine/unicorn/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="dev-lang/python:2.7"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i '/configure/{s#$# --python=/usr/bin/python2#}' Makefile || die
}

src_install() {
	LIBDIRARCH="$(get_libdir)" DESTDIR="${D}" emake install
	dodoc README.md
}
