# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/ochinchina/supervisord"

DESCRIPTION="a go-lang supervisor implementation"
HOMEPAGE="https://github.com/ochinchina/supervisord"
SRC_URI="https://github.com/ochinchina/supervisord/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-go/gorilla-rpc
	dev-go/go-flags
	dev-go/go-ini
	dev-go/gorilla-xmlrpc
	dev-go/go-daemon
	dev-go/logrus
"
RDEPEND="${DEPEND}"
