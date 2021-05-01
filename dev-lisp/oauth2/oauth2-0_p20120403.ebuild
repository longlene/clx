# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="85aff15db14a0d041b10955c79ee609f338f106d"

DESCRIPTION="OAuth2 library for Common Lisp"
HOMEPAGE="https://github.com/Neronus/oauth2"
SRC_URI="https://github.com/Neronus/oauth2/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/drakma
	dev-lisp/cl-json
	dev-lisp/alexandria
"
