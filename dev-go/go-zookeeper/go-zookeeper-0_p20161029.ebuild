# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/samuel/go-zookeeper/..."
EGIT_COMMIT="1d7be4effb13d2d908342d349d71a284a7542693"

DESCRIPTION="Native ZooKeeper client for Go"
HOMEPAGE="https://github.com/samuel/go-zookeeper"
SRC_URI="https://github.com/samuel/go-zookeeper/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
