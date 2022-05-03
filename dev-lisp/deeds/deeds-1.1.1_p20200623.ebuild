# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f5df54eac79b58a34030e0eb8acf3952c788410d"

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
