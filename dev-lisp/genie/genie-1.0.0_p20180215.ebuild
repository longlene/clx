# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8389ba077b0f7658207d94a28f363e61fee38ad7"

DESCRIPTION="A simple wrapper to generate portably seedable pseudo-random numbers"
HOMEPAGE="https://github.com/mfiano/genie"
SRC_URI="https://github.com/mfiano/genie/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-variates
	dev-lisp/simple-logger
"
