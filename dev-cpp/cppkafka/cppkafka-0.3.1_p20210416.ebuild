# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="01bd066d57b1f02b33a8b4a34f52813efc60ada1"

DESCRIPTION="C++11 wrapper for rdkafka"
HOMEPAGE="https://github.com/mfontanini/cppkafka"
SRC_URI="https://github.com/mfontanini/cppkafka/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-libs/boost
	>=dev-libs/librdkafka-0.9.1
"
RDEPEND="${DEPEND}"

