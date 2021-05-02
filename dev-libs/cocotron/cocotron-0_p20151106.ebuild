# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit mercurial multilib

EGIT_COMMIT="9cda7d719428a8ff940b134e391e511104ee0b5d"

DESCRIPTION="The Cocotron is a cross-platform implementation of Objective-C API's similar to Foundation and AppKit"
HOMEPAGE="http://www.cocotron.org/"
SRC_URI="https://github.com/cjwl/cocotron/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	gnustep-base/libobjc2
	dev-libs/blocksruntime
	sys-devel/clang
"

ENVD="${T}"/51cocotron

src_prepare() {
	eapply_user
	#sed -i 's/libobjc\.a/libobjc\.so/' makefiles/Foundation/Makefile
	sed -i 's:local\/::' makefiles/Makefiles/Makefile.common
}


src_compile() {
	emake -C makefiles PROJECTS=Foundation
}

src_install() {
	local dest=/usr/include
	dodir ${dest}/CFNetwork
	insinto ${dest}/CFNetwork
	doins CFNetwork/CF*.h

	dodir ${dest}/Foundation
	insinto ${dest}/Foundation
	doins Foundation/Foundation*.h
	doins Foundation/NS*.h
	doins Foundation/NS*/NS*.h
	doins Foundation/xml/NS*.h

	dodir ${dest}/CoreFoundation
	insinto ${dest}/CoreFoundation
	doins CoreFoundation/CF*.h
	doins CoreFoundation/CoreFoundation.h

	dodir ${dest}/CoreServices
	insinto ${dest}/CoreServices
	doins CoreServices/CoreServices.h

	#dolib.so makefiles/Foundation/build/Foundation.framework/Versions/A/libFoundation.so

	local dest2=/usr/$(get_libdir)/cocotron
	dodir ${dest2}
	insinto ${dest2}
	cd makefiles && doins -r Foundation/build/Foundation.framework
	fperms a+rx ${dest2}/Foundation.framework/Versions/A/libFoundation.so
	dosym ${dest2}/Foundation.framework/Versions/A/libFoundation.so /usr/$(get_libdir)/libFoundation.so

	#dodir ${dest}
	#dosym ${dest2}/Foundation/include/CFNetwork ${dest}/CFNetwork
	#dosym ${dest2}/Foundation/include/CoreFoundation ${dest}/CoreFoundation
	#dosym ${dest2}/Foundation/include/CoreServices ${dest}/CoreServices
	#dosym ${dest2}/Foundation/include/Foundation ${dest}/Foundation

	echo "LD_LIBRARY_PATH=/usr/lib/cocotron/Foundation.framework/Versions/Current" > "${ENVD}"
	doenvd "${ENVD}"
}
