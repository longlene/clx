# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5e9673572c24d1e0c2556c519c74b7d60083139f"

DESCRIPTION="XHTML generation macros"
HOMEPAGE="https://github.com/hanshuebner/xhtmlgen"
SRC_URI="https://github.com/hanshuebner/xhtmlgen/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cxml
	dev-lisp/rt
"
