# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c92d849b435f2344edb321d5f0456eb62d74e04a"

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
	dev-lisp/cl-containers
	dev-lisp/closer-mop
	dev-lisp/ironclad
	dev-lisp/iterate
	dev-lisp/jsown
	dev-lisp/pzmq
	dev-lisp/trivial-gray-streams
	dev-lisp/trivial-mimes
	dev-lisp/uuid
	dev-python/jupyter
"
BDEPEND=""
