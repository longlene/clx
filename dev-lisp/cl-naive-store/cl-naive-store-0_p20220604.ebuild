# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8a02b8d698468c4f9523d322b1d2c136f7c9fd99"

DESCRIPTION="A naive persisted, in memory, indexed, document store for Common Lisp"
HOMEPAGE="https://gitlab.com/Harag/cl-naive-store"
SRC_URI="https://gitlab.com/Harag/cl-naive-store/-/archive/${EGIT_COMMIT}/cl-naive-store-${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-fad
	dev-lisp/split-sequence
	dev-lisp/uuid
	dev-lisp/local-time
	dev-lisp/cl-getx
	dev-lisp/cl-murmurhash
	dev-lisp/ironclad
	dev-lisp/lparallel
	dev-lisp/cl-cpus
	dev-lisp/bordeaux-threads
"
BDEPEND=""
