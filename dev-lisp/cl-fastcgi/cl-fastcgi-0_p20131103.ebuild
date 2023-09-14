# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="412133564baa0856f8c636611f0f5c045b55ba5a"

DESCRIPTION="FastCGI wrapper for Common Lisp"
HOMEPAGE="https://github.com/KDr2/cl-fastcgi"
SRC_URI="https://github.com/KDr2/cl-fastcgi/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/usocket
	dev-lisp/cffi
"
