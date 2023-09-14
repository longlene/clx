# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="80b3d769294fee2f0463c0e4e95b9e17d65c3dc2"

DESCRIPTION="Common Lisp to JavaScript compiler"
HOMEPAGE="https://github.com/cxxxr/valtan"
SRC_URI="https://github.com/cxxxr/valtan/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
