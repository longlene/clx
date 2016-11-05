# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="cl-dbus aims to be a complete implementation of the DBUS protocol used in popular desktop environments"
HOMEPAGE="https://github.com/blitz/cl-dbus"
SRC_URI=""

EGIT_REPO_URI="https://github.com/blitz/cl-dbus.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/iterate
	dev-lisp/flexi-streams
	dev-lisp/defclass-star
	dev-lisp/iolib
	dev-lisp/babel
	dev-lisp/cl-ppcre
	dev-lisp/ironclad
	dev-lisp/osicat
"
