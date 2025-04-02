# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

MY_PN="term-validator"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A quick and simple Erlang term validator"
HOMEPAGE="https://github.com/erlangsters/term-validator/"
SRC_URI="https://github.com/erlangsters/term-validator/archive/refs/tags/${PV}.tar.gz -> ${MY_P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${MY_P}

src_prepare() {
	default
}

