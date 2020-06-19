# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f4d1a99cfb38ded33f4fb58bb5522815f530b3c3"

DESCRIPTION="A D-BUS client library for Common Lisp"
HOMEPAGE="https://github.com/death/dbus"
SRC_URI="https://github.com/death/dbus/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
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
	dev-lisp/ieee-floats
"
BDEPEND=""
