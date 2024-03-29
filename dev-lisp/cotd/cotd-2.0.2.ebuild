# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="A Common Lisp roguelike battle of Angels and Demons in the streets of a Human city"
HOMEPAGE="https://github.com/gwathlobal/CotD"
SRC_URI="https://github.com/gwathlobal/CotD/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/lispbuilder-sdl
	dev-lisp/bordeaux-threads
	dev-lisp/defenum
	dev-lisp/cl-store
	dev-lisp/log4cl
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all src/{data,help}
}
