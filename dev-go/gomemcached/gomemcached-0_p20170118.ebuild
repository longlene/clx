# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/couchbase/gomemcached"
EGIT_COMMIT="4a25d2f4e1dea9ea7dd76dfd943407abf9b07d29"

DESCRIPTION="A memcached binary protocol toolkit for go"
HOMEPAGE="https://github.com/couchbase/gomemcached"
SRC_URI="https://github.com/couchbase/gomemcached/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
