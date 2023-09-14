# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/dgrijalva/jwt-go"

DESCRIPTION="Golang implementation of JSON Web Tokens (JWT)"
HOMEPAGE="https://github.com/dgrijalva/jwt-go"
SRC_URI="https://github.com/dgrijalva/jwt-go/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
