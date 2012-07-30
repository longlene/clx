# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Library for building efficient parsers, written in C"
HOMEPAGE="http://www.netsurf-browser.org/projects/libparserutils/"
SRC_URI="http://www.netsurf-browser.org/projects/releases/${P}-src.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86"
IUSE="doc iconv tests debug"

DEPEND="doc? ( app-doc/doxygen )
	iconv? ( virtual/libiconv )
	tests? ( dev-lang/perl dev-util/pkgconfig dev-util/lcov )"

RDEPEND="${DEPEND}"

src_compile() {
			if use iconv; then
				echo "CFLAGS += -DWITH_ICONV_FILTER" > build/Makefile.config.override
			fi

			if use debug; then
				emake BUILD=debug || die "failed to make static libs for debugging"
				emake BUILD=debug COMPONENT_TYPE=lib-shared || die "failed to make shared libs for debugging"
			else
				emake || die "failed to make static libs"
				emake COMPONENT_TYPE=lib-shared || die "failed to make shared libs"
			fi
			
			if use tests; then
				make test || die "failed to make tests"
				make coverage || die "failed to generate coverage data"
			fi
			
			if use doc; then
				make docs || die "failed to make docs"
			fi
}

src_install() {
			emake DESTDIR="${D}" install PREFIX=/usr || die "install failed"		
			emake COMPONENT_TYPE=lib-shared DESTDIR="${D}" install PREFIX=/usr || die "install failed"
			
			if use doc; then
				dohtml -r build/docs/html/*
			fi

			if use tests; then
				dodir /usr/share/${PF}/tests
				dodir /usr/share/${PF}/tests/coverage
				dodir /usr/share/${PF}/tests/data
				dodir /usr/share/${PF}/tests/src
				rm build-*-static/test*.d
				rm build-*-static/test*.gcda
				rm build-*-static/test*.gcno
				rm build-*-static/test*.o
				rm -r build-*-static/coverage/var
				exeinto /usr/share/${PF}/tests
				insinto /usr/share/${PF}/tests/data
				doexe build-*-static/test*
				doexe build/testtools/*
				doins -r test/data/*
				insinto /usr/share/${PF}/tests/coverage
				doins -r build-*-static/coverage/*
				insinto /usr/share/${PF}/tests/src
				doins -r test/*
			fi

			if use debug; then
				elog "                                                                                 "
				elog "                                                                                 "
				elog "       ******************************************************************        "
				elog "       *                                                                *        "
				elog "       *  For useful backtraces, set FEATURES=\"nostrip\" and re-emerge   *      "
				elog "       *  libparserutils with the debug USE flag set. If you also       *        "
				elog "       *  want source code line numbers in your backtraces, add         *        "
				elog "       *  -ggdb to your CFLAGS                                          *        "
				elog "       *                                                                *        "
				elog "       ******************************************************************        "
				elog "                                                                                 "
				elog "                                                                                 "
			fi
}
