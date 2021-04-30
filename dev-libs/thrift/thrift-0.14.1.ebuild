# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit flag-o-matic java-pkg-2 java-ant-2

DESCRIPTION="Data serialization and communication toolwork"
HOMEPAGE="https://thrift.apache.org/about"
SRC_URI="mirror://apache/${PN}/${PV}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+pic +cpp +c_glib csharp d dart java erlang lua nodejs python perl php php_extension ruby haskell go"

RDEPEND=">=dev-libs/boost-1.40.0
	virtual/yacc
	dev-libs/openssl:=
	cpp? (
		>=sys-libs/zlib-1.2.3
		dev-libs/libevent
	)
	csharp? ( >=dev-lang/mono-1.2.4 )
	java? (
		dev-java/ant-ivy:=
		dev-java/commons-lang:=
		dev-java/slf4j-api:=
	)
	erlang? ( >=dev-lang/erlang-12.0.0 )
	nodejs? ( net-libs/nodejs )
	python? (
		dev-lang/python:2.7
		!dev-python/thrift
	)
	perl? (
		dev-lang/perl
		dev-perl/Bit-Vector
		dev-perl/Class-Accessor
	)
	php? ( dev-lang/php:= )
	php_extension? ( dev-lang/php:= )
	ruby? ( virtual/rubygems )
	haskell? ( dev-haskell/haskell-platform )
	go? ( sys-devel/gcc:=[go] )
"

DEPEND="${RDEPEND}
	>=sys-devel/gcc-4.2[cxx]
	c_glib? ( dev-libs/glib )
	sys-devel/flex
"

src_configure() {
	local myconf
	local f
	for f in ${IUSE}; do
		myconf+=" $(use_with ${f/+/})"
	done

	filter-flags -fwhole-program -fwhopr

	PY_PREFIX="${EPREFIX}"/usr \
	JAVA_PREFIX="${EPREFIX}"/usr/lib \
	PHP_PREFIX="${EPREFIX}"/usr/lib \
	PHP_CONFIG_PREFIX="${EPREFIX}"/etc/php.d \
	PERL_PREFIX="${EPREFIX}"/usr/lib \
	econf --prefix="${EPREFIX}"/usr \
		--exec-prefix="${EPREFIX}"/usr \
		--with-qt5=no \
		--with-qt5=no \
		--with-cl=no \
		--enable-tests=no \
		${myconf}
}

src_compile() {
	emake
}
