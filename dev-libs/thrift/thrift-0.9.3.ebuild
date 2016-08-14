# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_DEPEND="python? *"
SUPPORT_PYTHON_ABIS="1"
JAVA_ANT_REWRITE_CLASSPATH="1"

inherit distutils eutils java-pkg-2 java-pkg-opt-2 java-ant-2 perl-module

DESCRIPTION="A cross-language serialization and RPC framework"
HOMEPAGE="http://thrift.apache.org/"
SRC_URI="mirror://apache/${PN}/${PV}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cxx doc erlang java mono perl php python ruby +libevent source test vim-syntax"

RESTRICT_PYTHON_ABIS="3.*"

EANT_BUILD_TARGET="dist"
EANT_DOC_TARGET="javadoc"
EANT_GENTOO_CLASSPATH="slf4j-api,commons-lang-2.1"

JAVA_COMMON_DEPS="dev-java/commons-lang:2.1 
	dev-java/slf4j-api:0
	test? ( dev-java/junit )"

COMMON_DEPS="sys-devel/bison
	cxx? ( dev-libs/boost )
	libevent? ( dev-libs/libevent )
	mono? ( dev-lang/mono )
	php? ( dev-lang/php )
	ruby? ( dev-lang/ruby )
	erlang? ( dev-lang/erlang )"

DEPEND="${COMMON_DEPS}
	java?
	(
		>=virtual/jdk-1.5
		${JAVA_COMMON_DEPS}
	)"
RDEPEND="${COMMON_DEPS}
	java?
	(
		>=virtual/jre-1.5
		${JAVA_COMMON_DEPS}
	)
	perl?
	(
		dev-perl/Bit-Vector
		dev-perl/Class-Accessor
	)"

# Tests fail at the moment, needs investigation
RESTRICT="test"

src_configure() {
	if use java; then
		java-ant-2_src_configure
	fi

	chmod a+x ${WORKDIR}/${P}/configure
	econf   $(use_with cxx boost) \
			$(use_with libevent libevent) \
			$(use_with erlang erlang) \
			$(use_with mono csharp) \
			$(use_with php php_extension) \
			$(use_with ruby ruby) \
			--with-zlib \
			--with-gnu-ld \
			--without-python \
			--without-perl \
			--without-java || die #Will use java eclasses for this

	if use perl; then
		cd ${S}/lib/perl || die
		perl-module_src_configure
		cd ${S} || die
	fi
}

src_compile() {
	emake DESTDIR="${D}"

	if use python; then
		cd ${S}/lib/py || die
		distutils_src_compile
	fi

	if use perl; then
		cd ${S}/lib/perl || die
		perl-module_src_compile
	fi

	if use java; then
		cd "${S}"/lib/java || die
		ANT_OPTS="-Dnoivy="
			java-pkg-2_src_compile
	fi
}

src_install() {
	emake DESTDIR="${D}" install || die

	if use python; then
		cd ${S}/lib/py || die
		distutils_src_install
		newdoc ${S}/lib/py/README README.python
	fi

	if use perl; then
		cd ${S}/lib/perl || die
		perl-module_src_install
		newdoc ${S}/lib/perl/README README.perl
	fi

	if use java; then
		cd ${S}/lib/java/build || die
		java-pkg_dojar lib${P}.jar
		use doc && java-pkg_dojavadoc javadoc
		use source && java-pkg_dosrc org
		newdoc ${S}/lib/java/README README.java
	fi

	if use vim-syntax; then
		insinto /usr/share/vim/vimfiles/syntax
		doins ${S}/contrib/thrift.vim
	fi

	cd ${S}
	dodoc README CHANGES LICENSE NOTICE DISCLAIMER CONTRIBUTORS NEWS
}

src_test() {
	emake check || die
	if use java; then
		cd ${S}/lib/java || die
		java-pkg-2_src_test
	fi
}

pkg_postinst() {
	if use python; then
		cd ${S}/lib/py || die
		distutils_pkg_postinst
	fi

	if use perl; then
		cd ${S}/lib/perl || die
		perl-module_pkg_postinst
	fi
}
