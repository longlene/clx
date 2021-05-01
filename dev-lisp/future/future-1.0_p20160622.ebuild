# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1d5a962530f044030b3d294d11d755b234edff1e"

DESCRIPTION="Futures and Promises for ClozureCL"
HOMEPAGE="https://github.com/massung/future"
SRC_URI="https://github.com/massung/future/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
