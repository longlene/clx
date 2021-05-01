# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0561c97dfca2f5854fcc66558a567a9875ddcb8f"

DESCRIPTION="Readline-style line-editor for Common Lisp"
HOMEPAGE="https://github.com/nikodemus/linedit"
SRC_URI="https://github.com/nikodemus/linedit/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/terminfo
	dev-lisp/osicat
	dev-lisp/alexandria
"
