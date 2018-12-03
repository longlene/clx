# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils bash-completion-r1 toolchain-funcs

URI_FILENAME="picoLisp"
URI_DOMAIN="http://software-lab.de/"
URI_PREFIX="${URI_DOMAIN}${URI_FILENAME}"
URI_SUFFIX=".tgz"

if [[ ${PV} != 9999 ]] ; then
	SRC_URI="${URI_PREFIX}-${PV}${URI_SUFFIX}"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="A fast and lightweight Lisp interpreter"
HOMEPAGE="http://picolisp.com/"

LICENSE="MIT"
SLOT="0"
IUSE="bash-completion doc examples src"

QA_PREBUILT="*"

S="${WORKDIR}/picoLisp"

livefetch() {
	FILENAME="${1##*/}"
	einfo "Fetching ${FILENAME}"
	wget "${1}" || die
	tar xf "${FILENAME}" || die
}

pre_src_unpack() {
	[[ ${PV} == 9999 ]] && livefetch "${URI_PREFIX}${URI_SUFFIX}"
	use amd64           && livefetch "${URI_DOMAIN}x86-64.linux${URI_SUFFIX}"
}

src_prepare() {
	find . -type f -executable -exec sed -i "s#!bin/picolisp lib.l#!/usr/bin/picolisp /usr/lib/picolisp/lib.l#" {} \;
	sed -i "s# test -x /usr/bin/picolisp# false#" src64/mkAsm || die
	eapply_user
}

src_compile() {
	if use amd64; then
		cd src64 || die
		mv ../../src64/*.s . || die
		einfo "Phase 1: building ${PN} with prebuild *.s files"
		emake CC="$(tc-getCC)" AS="$(tc-getAS)"
		einfo 'Phase 2: building ${PN} using ${PN}'
		emake clean
		emake CC="$(tc-getCC)" AS="$(tc-getAS)"
	else
		cd src || die
		emake CC="$(tc-getCC)" AS="$(tc-getAS)"
	fi
}

src_install() {
	DLIB=/usr/$(get_libdir)/${PN}

	#FIXME add vimsyntax support
	rm -rf lib/vim

	for FILE in picolisp pil; do
		dobin "bin/${FILE}"
		rm "bin/${FILE}" || die
	done
	exeinto $DLIB/bin
	doexe bin/*

	insinto $DLIB
	use bash-completion && newbashcomp lib/bash_completion "${PN}"
	rm -rf lib/bash_completion lib/el
	doins -r *.l *.css lib loc
	if use amd64 && use src; then
		DSRC=${DLIB}/src64
		insinto $DSRC
		doins -r src64/*.l src64/lib
		insinto $DSRC/arch
		doins -r src64/arch/x86-64.l
		insinto $DSRC/sys
		doins -r src64/sys/x86-64.linux.*
	fi
	doman man/*/*
	DSHARE=/usr/share/${PN}
	insinto $DSHARE
	doins -r img
	dosym $DSHARE/img $DLIB/img
	dodoc CHANGES CREDITS INSTALL README
	if use doc; then
		DDOC=/usr/share/doc/${PF}
		insinto $DDOC
		doins doc/quine doc/travel doc/vim-tsm
		dodoc -r doc/*
		insinto $DDOC/html
		doins doc/family.l doc/shape.l doc/fun.l doc/hello.l
		if use amd64; then
			doins doc/family64.tgz
			insinto $DDOC
			doins -r doc64
		else
			doins doc/family.tgz
			insinto $DDOC
			doins doc/structures
		fi
		dosym $DDOC/html $DLIB/doc
	fi
	if use examples; then
		insinto $DSHARE
		doins -r app games misc opt
		exeinto $DSHARE/misc
		doexe misc/bigtest misc/calc misc/chat misc/mailing
		exeinto $DSHARE/games
		doexe games/xchess
	fi
}
