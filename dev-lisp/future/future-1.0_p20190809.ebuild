# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="665a3bcdefabc824d56bd4613bc34f5e78cd1cf1"

DESCRIPTION="Futures and Promises for SBCL"
HOMEPAGE="https://github.com/massung/future"
SRC_URI="https://github.com/massung/future/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
