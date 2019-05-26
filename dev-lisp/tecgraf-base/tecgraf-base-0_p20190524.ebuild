# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="39bb781d816ad62f32bca738ba505a9ad729f614"

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
