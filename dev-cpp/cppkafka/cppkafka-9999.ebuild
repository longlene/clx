# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils git-r3

DESCRIPTION="C++11 wrapper for rdkafka"
HOMEPAGE="https://github.com/mfontanini/cppkafka"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mfontanini/cppkafka.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=">=dev-libs/librdkafka-0.9.1"
RDEPEND="${DEPEND}"
