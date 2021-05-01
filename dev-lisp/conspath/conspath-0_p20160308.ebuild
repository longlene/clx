# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d182d9b5acf1d6ab1ef7d49e264cd32a208b3cd4"

DESCRIPTION="Regex/XPath like matching for Common Lisp lists"
HOMEPAGE="https://github.com/rpav/conspath"
SRC_URI="https://github.com/rpav/conspath/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/checkl
"
