# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7cec5780f94ad61623b7f0a13cfbf3aa4dcd3b1b"

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
	dev-lisp/ironclad
	dev-lisp/multilang-documentation
	dev-lisp/pzmq
	dev-lisp/puri
	dev-lisp/static-vectors
	dev-lisp/trivial-do
	dev-lisp/trivial-garbage
	dev-lisp/trivial-gray-streams
	dev-lisp/trivial-mimes
	dev-lisp/trivial-features
	dev-lisp/shasht
	dev-python/jupyter
"
BDEPEND=""
