# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a336366539cd63e0af29332523d69736bb0e9c27"

DESCRIPTION="A Lisp in Wonderland (aka. ALIW) is a wiki software written in Common Lisp"
HOMEPAGE="https://github.com/vy/aliw"
SRC_URI="https://github.com/vy/aliw/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-difflib
	dev-lisp/cl-fad
	dev-lisp/cl-ppcre
	dev-lisp/cl-who
	dev-lisp/flexi-streams
	dev-lisp/md5
	dev-lisp/meta-sexp
	dev-lisp/montezuma
"
BDEPEND=""
