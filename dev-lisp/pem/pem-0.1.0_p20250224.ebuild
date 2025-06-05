# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="4aaf81964b403aca86be55768eb29a9bf2e3bfc6"

DESCRIPTION="PEM parser"
HOMEPAGE="https://github.com/fukamachi/pem"
SRC_URI="https://github.com/fukamachi/pem/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
	dev-lisp/asn1
	dev-lisp/trivia
	dev-lisp/cl-base64
	dev-lisp/ironclad
"
BDEPEND=""
