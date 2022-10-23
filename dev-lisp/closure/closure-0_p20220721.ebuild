# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a6a24009b9af935ec2c0121959b3976830b4f9b3"

DESCRIPTION="Closure web engine"
HOMEPAGE="http://common-lisp.net/project/closure"
SRC_URI="https://github.com/atlas-engineer/closure/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE=""

RDEPEND="
	dev-lisp/cxml
	dev-lisp/closure-html
	dev-lisp/mcclim
	dev-lisp/bordeaux-threads
	dev-lisp/drakma
	dev-lisp/zip
	dev-lisp/flexi-streams
	dev-lisp/skippy
	media-libs/jpeg
"

