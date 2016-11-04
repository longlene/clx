# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Lispy bindings to the ODE physics library"
HOMEPAGE="https://github.com/cbaggers/lode"
SRC_URI=""

EGIT_REPO_URI="https://github.com/cbaggers/lode.git"

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
