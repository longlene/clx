# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5cfa6f077f653a632f01a4afeafb19a1e7ab1007"

DESCRIPTION="An experimental chat written in Common Lisp"
HOMEPAGE="https://github.com/ryukinix/lisp-chat"
SRC_URI="https://github.com/ryukinix/lisp-chat/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/usocket
"
