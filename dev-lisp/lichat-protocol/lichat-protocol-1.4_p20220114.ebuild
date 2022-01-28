# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="dddc0859c48461948bcf5f9738a81109c2de2f05"

DESCRIPTION="Protocol definition and specification for the Lichat chat system"
HOMEPAGE="https://github.com/Shirakumo/lichat-protocol"
SRC_URI="https://github.com/Shirakumo/lichat-protocol/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
	dev-lisp/closer-mop
	dev-lisp/cl-unicode
"
BDEPEND=""
