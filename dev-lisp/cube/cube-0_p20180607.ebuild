# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ced16304cdd7c75176c4445303ecb90e6bd3e123"

DESCRIPTION="Common LISP Kubernetes Client"
HOMEPAGE="https://github.com/xh4/cube"
SRC_URI="https://github.com/xh4/cube/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/optima
	dev-lisp/drakma
	dev-lisp/quri
	dev-lisp/ironclad
	dev-lisp/cl-json
	dev-lisp/cl-base64
	dev-lisp/cl-yaclyaml
	dev-lisp/cl-hash-util
	dev-lisp/cl-change-case
"
