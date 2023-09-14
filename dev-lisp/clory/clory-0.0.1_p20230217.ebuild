# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="48f9e06753d50c9b8e93c2bdabc2d2d2cae9110c"

DESCRIPTION="Common Lisp Ory Wrapper"
HOMEPAGE="https://github.com/K1D77A/clory"
SRC_URI="https://github.com/K1D77A/clory/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/dexador
	dev-lisp/hu_dwim_defclass-star
	dev-lisp/closer-mop
	dev-lisp/shasht
	dev-lisp/str
"
BDEPEND=""
