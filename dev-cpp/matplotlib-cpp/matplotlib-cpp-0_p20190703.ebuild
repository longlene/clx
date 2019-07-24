# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="5dd719498b7c22c2c1f1aef839436bc5e6a8dfa4"

DESCRIPTION="Extremely simple yet powerful header-only C++ plotting library built on the popular matplotlib"
HOMEPAGE="https://github.com/lava/matplotlib-cpp"
SRC_URI="https://github.com/lava/matplotlib-cpp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/matplotlib
"
BDEPEND=""
