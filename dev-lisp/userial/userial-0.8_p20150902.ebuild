# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1b4df83841b50b3dc9b96a69b8e649d6e3b9b39c"

DESCRIPTION="Library for binary serialization/unserialization"
HOMEPAGE="http://nklein.com/software/unet/userial/"
SRC_URI="https://github.com/nklein/userial/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/ieee-floats
	dev-lisp/trivial-utf8
	dev-lisp/contextl
	dev-lisp/nst
"
