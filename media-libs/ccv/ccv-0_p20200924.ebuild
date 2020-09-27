# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit vcs-snapshot

EGIT_COMMIT="121980abafe4a843a79b50af4d341865360eca85"

DESCRIPTION="C-based/Cached/Core Computer Vision Library"
HOMEPAGE="https://libccv.org"
SRC_URI="https://github.com/liuliu/ccv/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${P}/lib
