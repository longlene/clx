# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2 vcs-snapshot versionator

EGIT_COMMIT="1d52e6ec9f2f6d1fa5b5b36ba2a8053cccc71846"

DESCRIPTION="ME4SE is an emulation envionement"
HOMEPAGE="http://me4se.org/"
SRC_URI="https://github.com/Icenowy/me4se/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""

COMMON_DEP=""

RDEPEND=">=virtual/jre-1.5
  ${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.5
  app-arch/unzip
  ${COMMON_DEP}"

EANT_BUILD_TARGET="build-jars"
EANT_DOC_TARGET=""

src_install() {
  java-pkg_newjar dist/"$(version_format_string '${PN}-$1.$2.$3').jar" ${PN}.jar
}
