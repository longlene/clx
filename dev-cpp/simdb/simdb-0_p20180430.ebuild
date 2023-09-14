# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="85f665dee7445e022d34e62a5b40927418c0a97d"

DESCRIPTION="A high performance C++11 key-value store"
HOMEPAGE="https://github.com/LiveAsynchronousVisualizedArchitecture/simdb"
SRC_URI="https://github.com/LiveAsynchronousVisualizedArchitecture/simdb/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins simdb.hpp
	dodoc README.md
}
