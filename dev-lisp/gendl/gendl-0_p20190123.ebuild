# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b18d6181a0c3587335664c76203290076cfc9975"

DESCRIPTION="Generative Programming and KBE system embedded in Common Lisp"
HOMEPAGE="http://gendl.com/"
SRC_URI="https://github.com/lisp-mirror/gendl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/gwl-graphics
	dev-lisp/tasty
	dev-lisp/robot
	dev-lisp/yadd
"

