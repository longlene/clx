# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/go-http-utils/cookie"

DESCRIPTION="Advanced cookie library for Go, support signed cookies"
HOMEPAGE="https://github.com/go-http-utils/cookie"
SRC_URI="https://github.com/go-http-utils/cookie/archive/v1.1.0.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
