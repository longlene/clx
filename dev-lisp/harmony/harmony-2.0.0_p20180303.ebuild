# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="cc3b26573f0b05cc8259f2500e7469c010fe3f1f"

DESCRIPTION="A Common Lisp sound system"
HOMEPAGE="https://shirakumo.github.io/harmony"
SRC_URI="https://github.com/Shirakumo/harmony/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-mixed
	dev-lisp/flow
	dev-lisp/bordeaux-threads
"
