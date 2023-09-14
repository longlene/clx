# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 vcs-snapshot

DESCRIPTION="Java Abstracted Foreign Function Layer"
HOMEPAGE="https://github.com/jnr/jnr-ffi"
SRC_URI="https://github.com/jnr/jnr-ffi/archive/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""

COMMON_DEP=""

RDEPEND=">=virtual/jre-1.5
  ${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.5
  dev-java/maven-bin
  ${COMMON_DEP}"

EANT_BUILD_TARGET=""
EANT_DOC_TARGET=""

src_compile() {
	mvn package || die "compile"
}

src_install() {
  java-pkg_newjar target/"${P}.jar" "${PN}".jar
  use doc && java-pkg_dojavadoc target/apidocs
  use source && java-pkg_dosrc src
}
