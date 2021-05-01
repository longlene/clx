# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9c8d5630af40b3a307d026fd452d451516049db5"

DESCRIPTION="A minimalist Selenium library for Common Lisp"
HOMEPAGE="https://github.com/cmoore/ash"
SRC_URI="https://github.com/cmoore/ash/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/drakma
	dev-lisp/parenscript
	dev-lisp/jsown
	dev-lisp/optima
"
