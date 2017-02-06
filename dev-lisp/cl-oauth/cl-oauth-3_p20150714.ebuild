# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a7a463c8c2e4726ab0853d5b6623349b6428cb89"

DESCRIPTION="An implementation of the OAuth 1.0a standard in Common Lisp."
HOMEPAGE="http://github.com/skypher/cl-oauth"
SRC_URI="https://github.com/skypher/${PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/ironclad
	dev-lisp/cl-base64
	dev-lisp/babel
	dev-lisp/closer-mop
	dev-lisp/alexandria
	dev-lisp/anaphora
	dev-lisp/f-underscore
	dev-lisp/split-sequence
	dev-lisp/trivial-garbage
	dev-lisp/drakma
	dev-lisp/puri
	dev-lisp/hunchentoot
	dev-lisp/fiveam
"
