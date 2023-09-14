# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="098e0dd615118dc030a8220ce7d4fd4970457c52"

DESCRIPTION="Common Lisp wrapper for libinput"
HOMEPAGE="https://github.com/malcolmstill/cl-libinput"
SRC_URI="https://github.com/malcolmstill/cl-libinput/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-libs/libinput
	dev-lisp/osicat
"
