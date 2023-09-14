# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e42f5035409b4a54433f9e1b5106d7777b1e3d5c"

DESCRIPTION="Scheme-ish syntax and namings for Common Lisp"
HOMEPAGE="https://github.com/chebert/schemeish"
SRC_URI="https://github.com/chebert/schemeish/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-arguments
"
BDEPEND=""
