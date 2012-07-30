# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_P="${P/cobra/Cobra}"

DESCRIPTION="Cobra is a general purpose programming language."
HOMEPAGE="http://cobra-language.com/"
SRC_URI="http://cobra-language.com/downloads/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc"

DEPEND=">=dev-lang/mono-2.0.1-r1"
RDEPEND="${DEPEND}"

S="${MY_P}"

src_install(){
	cd "${S}"

	insinto "/opt/${P}/bin"
	doins bin/*
	fperms a+x "/opt/${P}/bin/cobra" "/opt/${P}/bin/cobra.exe" "/opt/${P}/bin/Cobra.Lang.dll"

	exeinto /usr/bin
	dosym "/opt/${P}/bin/cobra" /usr/bin/cobra

	if use doc; then
		dodoc ReadMe.text

		docinto HowTo
		dodoc HowTo/*

		docinto Reusables
		dodoc Reusables/*

		docinto Samples  
		dodoc Samples/*

		docinto Supplements
		dodoc Supplements/*
	fi
}

pkg_postinst(){
	/usr/bin/cobra "/opt/${P}/bin/hello.cobra"
}
