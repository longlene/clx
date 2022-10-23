# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="64d145a53478a8a0604d2ba38d0c3f2e0a818a6a"

DESCRIPTION="A Common Lisp Kerberos v5 implementation"
HOMEPAGE="https://github.com/fjames86/cerberus"
SRC_URI="https://github.com/fjames86/cerberus/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/nibbles
	dev-lisp/flexi-streams
	dev-lisp/babel
	dev-lisp/ironclad
	dev-lisp/usocket
	dev-lisp/glass
	dev-lisp/pounds
	dev-lisp/frpc
"
