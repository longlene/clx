# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9e43f423025ce930c9e506f3aafcc4ce2b475021"

DESCRIPTION="XDG desktop file parsing for Common Lisp"
HOMEPAGE="https://github.com/eadmund/cl-xdg"
SRC_URI="https://github.com/eadmund/cl-xdg/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/uiop
	dev-lisp/split-sequence
	dev-lisp/parse-number
	dev-lisp/flexi-streams
	dev-lisp/cl-sxml
	dev-lisp/cl-xmlspam
	dev-lisp/fiveam
"
