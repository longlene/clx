# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2

DESCRIPTION="The missing bridge between Java and native C++"
HOMEPAGE="https://github.com/bytedeco/javacpp"
SRC_URI="http://search.maven.org/remotecontent?filepath=org/bytedeco/javacpp/1.2/${P}-bin.zip"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""

COMMON_DEP=""

RDEPEND=">=virtual/jre-1.5
  ${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.5
  app-arch/unzip
  ${COMMON_DEP}"

EANT_BUILD_TARGET=""
EANT_DOC_TARGET=""

S="${WORKDIR}"/${PN}-bin

src_install() {
	java-pkg_dojar "${PN}.jar"
	dodoc README.md
}
