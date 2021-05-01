# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b5d563b0ed57e0f1d3be912e16ed0742e41f3020"

DESCRIPTION="A Common Lisp library for generation of UUIDs as described by RFC 4122."
HOMEPAGE="http://www.dardoria.net/software/uuid.html"
SRC_URI="https://github.com/dardoria/${PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

RDEPEND="
	dev-lisp/ironclad
	dev-lisp/trivial-utf8"

