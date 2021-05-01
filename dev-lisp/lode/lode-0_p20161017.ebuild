# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8d8b5d5ab8eb572371cafcd8ba68bb9deba86023"

DESCRIPTION="Lispy bindings to the ODE physics library"
HOMEPAGE="https://github.com/cbaggers/lode"
SRC_URI="https://github.com/cbaggers/lode/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/raw-bindings-ode
	dev-lisp/cffi
	dev-lisp/uiop
	dev-lisp/structy-defclass
	dev-lisp/rtg-math
	dev-lisp/fn
	dev-games/ode
"
