# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0e883490f81edf2a1be4e5b101d1caec78d7853b"

DESCRIPTION="A portable type inference library for Common Lisp"
HOMEPAGE="https://github.com/marcoheisig/Typo/"
SRC_URI="https://github.com/marcoheisig/Typo/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/closer-mop
	dev-lisp/introspect-environment
	dev-lisp/trivia
	dev-lisp/trivial-arguments
	dev-lisp/trivial-garbage
"
BDEPEND=""
