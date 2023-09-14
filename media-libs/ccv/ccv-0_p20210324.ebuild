# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="ea423d0110e3849bc0e2ff0589ac1e563489a50f"

DESCRIPTION="C-based/Cached/Core Computer Vision Library"
HOMEPAGE="https://libccv.org"
SRC_URI="https://github.com/liuliu/ccv/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="
	sys-devel/clang
"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${P}/lib

