# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="gopkg.in/redis.v5"

DESCRIPTION="Type-safe Redis client for Golang"
HOMEPAGE="http://godoc.org/gopkg.in/redis.v5"
SRC_URI="https://github.com/go-redis/redis/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
