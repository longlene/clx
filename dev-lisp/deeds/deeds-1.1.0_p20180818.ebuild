# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="115f734e3e978222425be24362c2b8f04af00ef6"

DESCRIPTION="Deeds is an Extensible Event Delivery System"
HOMEPAGE="https://github.com/Shinmera/deeds"
SRC_URI="https://github.com/Shinmera/deeds/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/closer-mop
	dev-lisp/bordeaux-threads
	dev-lisp/lambda-fiddle
	dev-lisp/form-fiddle
"
