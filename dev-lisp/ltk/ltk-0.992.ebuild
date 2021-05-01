# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="LTK is a Common Lisp binding for the Tk graphics toolkit"
HOMEPAGE="http://www.peter-herth.de/ltk/"
SRC_URI="https://github.com/herth/ltk/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="
	dev-lang/tk
"

S="${WORKDIR}/${PN}"

CLSYSTEMS="ltk ltk-mw ltk-remote"

src_install() {
	common-lisp-install-sources -t all *.lisp remote*.tcl
	common-lisp-install-asdf
}
