# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="Common Lisp FFI bindings to OpenSLP library"
HOMEPAGE="https://github.com/fjames86/cl-slp"
SRC_URI=""

EGIT_REPO_URI="https://github.com/fjames86/cl-slp.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	net-libs/openslp
"
