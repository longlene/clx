# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e158f52d5ceef9dd770a076c35a5e2fc353ab4e0"

DESCRIPTION="A simple custom alphabet session-token generator built on top of the ISAAC CSPRNG"
HOMEPAGE="https://github.com/Inaimathi/session-token"
SRC_URI="https://github.com/Inaimathi/session-token/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-isaac
"
