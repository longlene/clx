# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="51cb3281834ec2c432ee881fe63638c5250fcdac"

DESCRIPTION="ImageNet dataset parsing and loading in Common Lisp"
HOMEPAGE="https://github.com/varjagg/cl-imagenet"
SRC_URI="https://github.com/varjagg/cl-imagenet/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-jpeg
	dev-lisp/cxml
	dev-lisp/opticl
	dev-lisp/bordeaux-threads
	dev-lisp/cl-fad
	dev-lisp/trivial-channels
	dev-lisp/clx
"
