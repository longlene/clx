# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="55c29b133d314ec36d995fd09e7a26070540c540"

DESCRIPTION="Common Lisp bindings for ODE"
HOMEPAGE="https://github.com/orthecreedence/cl-ode"
SRC_URI="https://github.com/orthecreedence/cl-ode/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-games/ode
"
