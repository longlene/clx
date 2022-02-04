# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="Common Lisp bindings to OpenAL Soft"
HOMEPAGE="https://github.com/borodust/aw-openal"
SRC_URI="https://github.com/borodust/aw-openal/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/trivial-features
	dev-lisp/claw
	dev-lisp/claw-utils
	dev-lisp/alexandria
	media-libs/openal
"
BDEPEND=""
