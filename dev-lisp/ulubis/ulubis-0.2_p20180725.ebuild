# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="89caab4152a4a1ebdc2390ff00fe8af462906503"

DESCRIPTION="A Wayland compositor written in Common Lisp"
HOMEPAGE="https://github.com/malcolmstill/ulubis"
SRC_URI="https://github.com/malcolmstill/ulubis/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/osicat
	dev-lisp/slime
	dev-lisp/cepl
	dev-lisp/rtg-math
	dev-lisp/easing
	dev-lisp/cl-xkb
	dev-lisp/cl-wayland
	dev-lisp/trivial-dump-core
	dev-lisp/trivial-backtrace
	dev-lisp/cl-cairo2
	dev-lisp/uiop
	dev-lisp/zpng
"
