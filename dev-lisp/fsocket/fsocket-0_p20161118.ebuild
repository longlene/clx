# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c134f4a652c5eafd2f909f4607c09d9a073f7fb5"

DESCRIPTION="Yet another socket FFI"
HOMEPAGE="https://github.com/fjames86/fsocket"
SRC_URI="https://github.com/fjames86/fsocket/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
"
