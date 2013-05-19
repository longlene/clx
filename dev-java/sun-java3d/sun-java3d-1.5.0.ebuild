# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# cvs -d :pserver:alistair64@cvs.dev.java.net:/cvs login
# cvs -d :pserver:alistair64@cvs.dev.java.net:/cvs export -r rel-1_5_0-fcs vecmath
# tar -czf vecmath-1.5.0.tar.gz vecmath/
# cvs -d :pserver:alistair64@cvs.dev.java.net:/cvs export -r rel-1_5_0-fcs vecmath-test
# tar -czf vecmath-test-1.5.0.tar.gz vecmath-test/
# cvs -d :pserver:alistair64@cvs.dev.java.net:/cvs export -r rel-1_5_0-fcs j3d-core
# tar -czf j3d-core-1.5.0.tar.gz j3d-core
# cvs -d :pserver:alistair64@cvs.dev.java.net:/cvs export -r rel-1_5_0-fcs j3d-core-utils
# tar -czf j3d-core-utils-1.5.0.tar.gz j3d-core-utils
# cvs -d :pserver:alistair64@cvs.dev.java.net:/cvs export -r rel-1_5_0-fcs j3d-examples
# tar -czf j3d-examples-1.5.0.tar.gz j3d-examples

JAVA_PKG_IUSE="doc source test examples debug"

inherit eutils java-pkg-2 java-ant-2

DESCRIPTION="Sun J3D: The Java 3D API Core"
HOMEPAGE="https://java3d.dev.java.net/"
#SRC_URI="http://download.java.net/media/java3d/builds/stable/j3d-core-${PV}.tar.gz http://download.java.net/media/java3d/builds/stable/j3d-core-utils-${PV}.tar.gz http://download.java.net/media/java3d/builds/stable/j3d-examples-${PV}.tar.gz http://download.java.net/media/java3d/builds/stable/vecmath-${PV}.tar.gz http://download.java.net/media/java3d/builds/stable/vecmath-test-${PV}.tar.gz"


SRC_URI="j3d-core-${PV}.tar.gz j3d-core-utils-${PV}.tar.gz vecmath-${PV}.tar.gz
         test? ( vecmath-test-${PV}.tar.gz )
         examples? ( j3d-examples-${PV}.tar.gz )"
KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="|| ( sun-jrl sun-jdl )"
IUSE=""
DEPEND=">=virtual/jdk-1.5
	dev-java/ant-tasks
        dev-java/ant-core
	test? ( dev-java/junit )"
RDEPEND=">=virtual/jre-1.5"

MY_J3D_CORE="${WORKDIR}/j3d-core"
MY_J3D_CORE_UTILS="${WORKDIR}/j3d-core-utils"
MY_J3D_EXAMPLES="${WORKDIR}/j3d-examples"
MY_VECMATH="${WORKDIR}/vecmath"
MY_VECMATH_TEST="${WORKDIR}/vecmath-test"

EANT_DOC_TARGET="docs"
EANT_BUILD_TARGET="jar"
JAVA_PKG_STRICT=true

src_unpack() {
        unpack ${A}
        cd "${WORKDIR}"
	ln -s "j3d-core" "sun-java3d-${PV}"
	use test && java-ant_rewrite-classpath "${MY_VECMATH_TEST}/build.xml"
}

src_compile() {
	local antflags="jar"
	use doc && antflags="${antflags} docs"
	cd "${MY_VECMATH}"
        eant ${antflags} || die "failed to compile"
	cd "${MY_J3D_CORE}"
        eant ${antflags} || die "failed to compile"
	if use examples; then
	 	cd "${MY_J3D_EXAMPLES}"
        	eant jar || die "failed to compile"
	fi
}

src_test() {
	cd "${MY_VECMATH_TEST}"
	eant 	-Dgentoo.classpath="$(java-pkg_getjar --build-only junit \
		junit.jar):${MY_VECMATH}/build/opt/lib/ext/vecmath.jar" test
}

src_install() {
	if use debug; then
		cd "${MY_VECMATH}/build/debug/lib/ext/"
	else
		cd "${MY_VECMATH}/build/opt/lib/ext/"
	fi
	java-pkg_dojar vecmath.jar
        if use debug; then
                cd "${MY_J3D_CORE}/build/default/debug/"
        else
		cd "${MY_J3D_CORE}/build/default/opt/"
        fi
        java-pkg_dojar lib/ext/*.jar
	java-pkg_doso  native/*.so
	use examples && java-pkg_dojar "${MY_J3D_EXAMPLES}/dist/j3d-examples.jar"

	if use source; then
	        java-pkg_dosrc "${MY_VECMATH}/src/*" "${MY_J3D_CORE}/src/*" "${MY_J3D_CORE_UTILS}/src/*"
		use examples && java-pkg_dosrc "${MY_J3D_EXAMPLES}/src/*"
	fi 
	
        if use doc; then
		java-pkg_dojavadoc "${MY_VECMATH}/build/javadocs/"
		java-pkg_dojavadoc "${MY_J3D_CORE}/build/linux-i586/javadocs/"
                java-pkg_dohtml -r *.html
        fi
}
