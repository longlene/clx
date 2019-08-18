# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="A macro that allows visual grouping of variables in calls to mapping operators"
HOMEPAGE="https://github.com/Hexstream/map-bind"
SRC_URI="https://github.com/Hexstream/map-bind/archive/v1.0.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
test? ( dev-lisp/parachute )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r tests
}
