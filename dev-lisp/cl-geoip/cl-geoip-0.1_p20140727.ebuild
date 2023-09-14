# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b209db264ede6f4a87c2cc422aa79b1135eebe83"

DESCRIPTION="Basic Common Lisp support for MaxMind's binary IP geolocation databases"
HOMEPAGE="https://github.com/subtlepath/cl-geoip"
SRC_URI="https://github.com/subtlepath/cl-geoip/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-go/bordeaux-threads
	dev-go/osicat
	dev-go/alexandria
	dev-go/babel
	dev-go/iterate
	dev-go/cl-ppcre
"
