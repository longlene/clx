# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="841316ffe06743d4c14b4ed70819bdb39158df6a"

DESCRIPTION="WCL Common Lisp"
HOMEPAGE="https://github.com/wadehennessey/wcl"
SRC_URI="https://github.com/wadehennessey/wcl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	app-shells/tcsh
"
RDEPEND="${DEPEND}"
BDEPEND=""
