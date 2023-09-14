# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e2610e96d23b4d2dd5285e66b24e79da3a65c85e"

DESCRIPTION="MessagePack with a byte-at-a-time state-machine for stability and responsiveness without multthreading"
HOMEPAGE="https://github.com/stacksmith/trivial-messagepack"
SRC_URI="https://github.com/stacksmith/trivial-messagepack/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/external-program
"
