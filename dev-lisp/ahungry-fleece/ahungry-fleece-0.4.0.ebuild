# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3

DESCRIPTION="Common Lisp minimalist utility library"
HOMEPAGE="https://github.com/ahungry/ahungry-fleece/"
SRC_URI="https://github.com/ahungry/ahungry-fleece/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-json
	dev-lisp/cl-yaml
	dev-lisp/md5
	dev-lisp/split-sequence
"
