# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PV="${PV/_/}"
MY_P="PDFlib-Lite-${MY_PV}"

DESCRIPTION="PDF manipulation library"
HOMEPAGE="https://www.pdflib.com"
SRC_URI="http://ponce.cc/slackware/sources/repo/${MY_P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${MY_P}
