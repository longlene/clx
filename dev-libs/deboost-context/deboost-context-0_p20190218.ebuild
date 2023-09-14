# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="325fed7ee8b760e4cb79030a58dab74821fdcba9"

DESCRIPTION="\"Deboostified\" version of boost.context"
HOMEPAGE="https://github.com/septag/deboost.context"
SRC_URI="https://github.com/septag/deboost.context/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
