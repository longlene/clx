# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a191cfb161568a6e2345317b0b444de3a58c2a8e"

DESCRIPTION="Common Lisp library for Amazon Web Services signing version 4"
HOMEPAGE="https://github.com/rotatef/aws-sign4"
SRC_URI="https://github.com/rotatef/aws-sign4/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/local-time
	dev-lisp/cl-ppcre
	dev-lisp/ironclad
	dev-lisp/split-sequence
	dev-lisp/flexi-streams
	dev-lisp/secret-values
"
BDEPEND=""

src_prepare() {
	default
	sed -i '/defsystem #:aws-sign4-example/,$d' ${PN}.asd
}
