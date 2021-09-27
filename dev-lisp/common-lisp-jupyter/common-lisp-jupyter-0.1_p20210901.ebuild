# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c5531f60da0ec288a187a55ba699e38548233819"

DESCRIPTION="A Common Lisp kernel for Jupyter"
HOMEPAGE="https://github.com/yitzchak/common-lisp-jupyter/"
SRC_URI="https://github.com/yitzchak/common-lisp-jupyter/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/babel
	dev-lisp/bordeaux-threads
	dev-lisp/cl-base64
	dev-lisp/cl-indentify
	dev-lisp/closer-mop
	dev-lisp/dissect
	dev-lisp/eclector
	dev-lisp/multilang-documentation
	dev-lisp/pzmq
	dev-lisp/puri
	dev-lisp/static-vectors
	dev-lisp/trivial-do
	dev-lisp/trivial-garbage
	dev-lisp/trivial-gray-streams
	dev-lisp/trivial-mimes
	dev-lisp/shasht
	dev-python/jupyter
"
BDEPEND=""
