# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="283cc9c902fd80924352419b2445eb00247d9fc4"

DESCRIPTION="A collection of Common Lisp utilities to ratify, validate and parse inputs"
HOMEPAGE="https://github.com/Shinmera/ratify"
SRC_URI="https://github.com/Shinmera/ratify/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
	dev-lisp/local-time
	dev-lisp/parse-float
"
