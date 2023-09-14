# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2

DESCRIPTION="The Java gRPC implementation"
HOMEPAGE="https://github.com/grpc/grpc-java"
SRC_URI="https://github.com/grpc/grpc-java/archive/v${PV}.tar.gz -> ${P}.tar.gz"

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

src_prepare() {
	eapply_user
	sed -e '/-Wl,-Bstatic/{s#"-lprotoc", "-lprotobuf", ##}' \
		-e '/-Wl,-Bdynamic/{s#",#", "-lprotoc", "-lprotobuf",#}' \
		-e 's#, "-s"##' \
		-i compiler/build.gradle
}

src_compile() {
	#./gradlew build || die "compile failed"
	#./gradlew java_pluginExecutable grpc-protobuf:jar grpc-netty:jar grpc-stub:jar || die "compile failed"
	local mytask="java_pluginExecutable grpc-core:jar grpc-protobuf:jar grpc-netty:jar grpc-stub:jar"
	#use doc && mytask+=" grpc-protobuf:javadoc grpc-netty:javadoc grpc-stub:javadoc "
	./gradlew ${mytask} || die "compile failed"
}

src_install() {
	dobin compiler/build/exe/java_plugin/protoc-gen-grpc-java
	#java-pkg_newjar "${PN}.jar"
	java-pkg_newjar core/build/libs/grpc-core-${PV}.jar grpc-core.jar
	java-pkg_newjar stub/build/libs/grpc-stub-${PV}.jar grpc-stub.jar
	java-pkg_newjar protobuf/build/libs/grpc-protobuf-${PV}.jar grpc-protobuf.jar
	java-pkg_newjar netty/build/libs/grpc-netty-${PV}.jar grpc-netty.jar

	#if use doc ; then
	#	java-pkg_dojavadoc protobuf/build/docs/javadoc
	#	java-pkg_dojavadoc netty/build/docs/javadoc
	#	java-pkg_dojavadoc stub/build/docs/javadoc
	#fi
	#use source && java-pkg_dosrc protobuf/src netty/src stub/src
	dodoc README.md
}

