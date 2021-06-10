# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2ceb212f9893dc51aacf4e94e5e8652e4908499c"

DESCRIPTION="QR Code encoding using Common Lisp"
HOMEPAGE="https://github.com/mare5x/LispQR"
SRC_URI="https://github.com/mare5x/LispQR/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/zpng
"
BDEPEND=""
