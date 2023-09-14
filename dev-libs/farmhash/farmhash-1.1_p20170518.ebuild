# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="2bc1fd0d958f6b6b2131ac70484aa81bfaf9b29a"

DESCRIPTION="a family of hash functions"
HOMEPAGE="https://github.com/google/farmhash"
SRC_URI="https://github.com/google/farmhash/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
