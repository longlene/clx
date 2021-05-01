# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="86c92fd97d16080fe13e9ba6fc75bdf2743cd517"

DESCRIPTION="cl-paypal is a paypal express checkout Library in Common Lisp"
HOMEPAGE="https://github.com/skypher/cl-paypal"
SRC_URI="https://github.com/skypher/cl-paypal/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/hunchentoot
	dev-lisp/drakma
	dev-lisp/cl-ppcre
"
