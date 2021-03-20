# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools vcs-snapshot

DESCRIPTION="A Cloud at the lowest level!"
HOMEPAGE="https://cloudi.org/"
SRC_URI="https://github.com/CloudI/CloudI/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="go haskell java javascript ocaml perl php python ruby"

DEPEND="
	dev-lang/erlang
	dev-libs/boost[thread]
	go? ( dev-lang/go )
	haskell? ( dev-lang/ghc )
	java? ( virtual/jdk )
	javascript? ( net-libs/nodejs )
	ocaml? ( dev-lang/ocaml )
	perl? ( dev-lang/perl )
	php? ( dev-lang/php )
	python? ( dev-lang/python )
	ruby? ( dev-lang/ruby )
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${P}/src

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf \
		--enable-go-support=$(usex go) \
		--enable-haskell-support=$(usex haskell) \
		--enable-java-support=$(usex java) \
		--enable-javascript-support=$(usex javascript) \
		--enable-ocaml-support=$(usex ocaml) \
		--enable-perl-support=$(usex perl) \
		--enable-php-support=$(usex php) \
		--enable-python-support=$(usex python) \
		--enable-python-c-support=$(usex python) \
		--enable-ruby-support=$(usex ruby) \
		--with-integration-tests=no
}
