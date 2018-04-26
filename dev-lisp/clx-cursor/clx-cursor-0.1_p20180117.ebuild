# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="47064051e79784c5399ab82b07f5fa293abbd52d"

DESCRIPTION="Pure Common Lisp library for antialiased cursor rendering"
HOMEPAGE="https://github.com/filonenko-mikhail/clx-cursor"
SRC_URI="https://github.com/filonenko-mikhail/clx-cursor/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/clx
	dev-lisp/cl-fad
"
