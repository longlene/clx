# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="00d51955c2098e4b8b1d95b9b32b685d7242dc63"

DESCRIPTION="Yet another routes handling utility on top of Hunchentoot"
HOMEPAGE="https://github.com/mmontone/easy-routes"
SRC_URI="https://github.com/mmontone/easy-routes/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/hunchentoot
	dev-lisp/cl-routes
"
