# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="356e9e5b1c15093ae97dcf4d49ce85fffbe8018a"

DESCRIPTION="Common lisp reddit api wrapper"
HOMEPAGE="https://github.com/jperson/cl-reddit"
SRC_URI="https://github.com/jperson/cl-reddit/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/drakma
	dev-lisp/yason
"

