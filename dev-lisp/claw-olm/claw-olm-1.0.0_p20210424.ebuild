# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0adcbc0f5f8e51d5bb94d7e5827b63129f536a38"

DESCRIPTION="Thin wrapper over Matrix OLM"
HOMEPAGE="https://github.com/borodust/claw-olm"
SRC_URI="https://github.com/borodust/claw-olm/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cffi
	dev-lisp/claw
	dev-lisp/claw-utils
	dev-libs/olm
"
BDEPEND=""
