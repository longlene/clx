# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b83f38142add9a7ea1ccf9b2fa1eccd32e8a7dd3"

DESCRIPTION="RailsOnLisp asset pipeline"
HOMEPAGE="https://github.com/RailsOnLisp/rol-assets"
SRC_URI="https://github.com/RailsOnLisp/rol-assets/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cfg
	dev-lisp/cl-base64
	dev-lisp/cl-debug
	dev-lisp/cl-fad
	dev-lisp/cl-uglify-js
	dev-lisp/closer-mop
	dev-lisp/cl-json
	dev-lisp/exec-js
	dev-lisp/external-program
	dev-lisp/ironclad
	dev-lisp/re
	dev-lisp/rol-files
	dev-lisp/rol-uri
	dev-lisp/cl-str
"
BDEPEND=""
