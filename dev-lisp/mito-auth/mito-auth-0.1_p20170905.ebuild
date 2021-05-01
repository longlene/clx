# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1105f1cd3314f71677b969b7d553bcb8e3adc1e5"

DESCRIPTION="User authorization for Mito classes"
HOMEPAGE="https://github.com/fukamachi/mito-auth"
SRC_URI="https://github.com/fukamachi/mito-auth/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/mito
	dev-lisp/ironclad
	dev-lisp/babel
"
