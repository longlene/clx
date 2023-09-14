# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c401827446944fc1436e4f7d73b0b4b5c7253a8e"

DESCRIPTION="A lock-free, concurrent, key/value index supporting both fast transient and efficient memory-mapped persistent storage models"
HOMEPAGE="https://github.com/danlentz/cl-ctrie"
SRC_URI="https://github.com/danlentz/cl-ctrie/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/closer-mop
	dev-lisp/contextl
	dev-lisp/alexandria
	dev-lisp/printv
	dev-lisp/cldoc
	dev-lisp/unicly
	dev-lisp/uuid
	dev-lisp/com_informatimago_common-lisp_heap
	dev-lisp/cl-ppcre
	dev-lisp/osicat
	dev-lisp/iterate
	dev-lisp/cl-irregsexp
	dev-lisp/hu_dwim_stefil
	dev-lisp/hu_dwim_serializer
	dev-lisp/cl-store
"
BDEPEND=""
