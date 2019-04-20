# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f98045377cde26fc45e1946a6439f0769b850b83"

DESCRIPTION="RailsOnLisp URI utilities"
HOMEPAGE="https://github.com/RailsOnLisp/rol-uri"
SRC_URI="https://github.com/RailsOnLisp/rol-uri/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/babel
	dev-lisp/cl-unicode
	dev-lisp/cl-str
"
BDEPEND=""
