# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c625f3fdbcada7263311b4adebadc16a3adc7bf2"

DESCRIPTION="Lispy bindings over the Newton Dynamics physics library"
HOMEPAGE="https://github.com/cbaggers/issac"
SRC_URI="https://github.com/cbaggers/issac/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/raw-bindings-newton
	dev-lisp/cffi
	dev-lisp/uiop
	dev-lisp/structy-defclass
	dev-lisp/rtg-math
	dev-lisp/fn
	dev-games/newton
"
