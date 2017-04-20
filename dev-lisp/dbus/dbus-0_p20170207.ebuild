# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="35a635c030dae4fe527897246244a32dc85144ba"

DESCRIPTION="A D-BUS client library for Common Lisp"
HOMEPAGE="https://github.com/death/dbus"
SRC_URI="https://github.com/death/dbus/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/babel
	dev-lisp/cl-xmlspam
	dev-lisp/flexi-streams
	dev-lisp/iolib
	dev-lisp/ironclad
	dev-lisp/split-sequence
"

