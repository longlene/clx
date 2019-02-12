# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1af6ffba08411dcc6855a693009f26b9c6d6e71e"

DESCRIPTION="Jumptables Common Lisp library"
HOMEPAGE="https://github.com/Hexstream/trivial-jumptables"
SRC_URI="https://github.com/Hexstream/trivial-jumptables/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
