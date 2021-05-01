# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="A simple interface to the easy to use terminal library BearLibTerminal"
HOMEPAGE="https://gitlab.com/mordocai/cl-bearlibterminal"
SRC_URI="https://gitlab.com/mordocai/cl-bearlibterminal/repository/archive.tar.gz?ref=v${PV} -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-autowrap
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all src/spec
}
