# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e9c7229e9cb438079d4bcd1737e5cc7ef0ae9d5e"

DESCRIPTION="Base functionality for Tecgraf libraries"
HOMEPAGE="https://github.com/lispnik/tecgraf-base"
SRC_URI="https://github.com/lispnik/tecgraf-base/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/pffft
"
BDEPEND=""
