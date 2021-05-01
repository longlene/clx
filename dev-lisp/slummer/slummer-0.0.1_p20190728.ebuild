# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8a6b677764bab503e1f8056bf77d5ee41c398540"

DESCRIPTION="A Sordid Tale In Which Lisp Visits The Browser"
HOMEPAGE="https://github.com/thegoofist/slummer"
SRC_URI="https://github.com/thegoofist/slummer/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/parenscript
	dev-lisp/lass
	dev-lisp/spinneret
	dev-lisp/cl-strings
	dev-lisp/md5
	dev-lisp/alexandria
	dev-lisp/cl-fad
	dev-lisp/hunchentoot
"
BDEPEND=""
