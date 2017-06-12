# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="90c8ad42d2a31567bf0f3fd67792c2373557260b"

DESCRIPTION="cl-taobao is a Common Lisp SDK of [Taobao Open API]"
HOMEPAGE="https://github.com/muyinliu/cl-taobao"
SRC_URI="https://github.com/muyinliu/cl-taobao/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/drakma
	dev-lisp/jsown
	dev-lisp/cl-ppcre
	dev-lisp/babel
	dev-lisp/ironclad
"
