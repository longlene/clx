# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="499a0c4e3abe3defdc9b5af765d77f81426fd914"

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
