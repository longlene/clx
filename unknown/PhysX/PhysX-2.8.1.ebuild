# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="NVIDIA PhysX"
HOMEPAGE="http://developer.nvidia.com/object/physx.html"
SRC_URI="http://developer.download.nvidia.com/${PN}/${PV}/${PN}_${PV}_SDK_CoreLinux_rpm.tar.gz"

LICENSE="AGEIA PhysX Driver License Agreement"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=""

inherit rpm

src_unpack() {
		unpack ${A}
		cd "${WORKDIR}"
		
		einfo Unpacking libphysx
		mkdir libphysx
		mv libphysx-${PV}-${PV}-5.i386.rpm libphysx
		cd libphysx
		rpm_unpack libphysx-${PV}-${PV}-5.i386.rpm
		cd ..

		einfo Unpacking libphysx-common
		mkdir libphysx-common
		mv libphysx-common-${PV}-5.i386.rpm libphysx-common
		cd libphysx-common
		rpm_unpack libphysx-common-${PV}-5.i386.rpm
		cd ..

		einfo Unpacking libphysx-dev
		mkdir libphysx-dev
		mv libphysx-dev-${PV}-${PV}-5.i386.rpm libphysx-dev
		cd libphysx-dev
		rpm_unpack libphysx-dev-${PV}-${PV}-5.i386.rpm
		cd ..

		einfo Unpacking libphysx-doc
		mkdir libphysx-doc
		mv libphysx-doc-${PV}-${PV}-5.i386.rpm libphysx-doc
		cd libphysx-doc
		rpm_unpack libphysx-doc-${PV}-${PV}-5.i386.rpm
		cd ..

		einfo Unpacking libphysx-extras
		mkdir libphysx-extras
		mv libphysx-extras-${PV}-${PV}-5.i386.rpm libphysx-extras
		cd libphysx-extras
		rpm_unpack libphysx-extras-${PV}-${PV}-5.i386.rpm
		cd ..

		einfo Unpacking libphysx-samples
		mkdir libphysx-samples
		mv libphysx-samples-${PV}-${PV}-5.i386.rpm libphysx-samples
		cd libphysx-samples
		rpm_unpack libphysx-samples-${PV}-${PV}-5.i386.rpm
		cd ..
}

src_install() {
		# libphysx
		insinto /usr/lib/PhysX/v${PV}
		doins ${WORKDIR}/libphysx/usr/lib/PhysX/v${PV}/*
		dosym /usr/lib/PhysX/v${PV}/libNxCooking.so.1 /usr/lib/PhysX/v${PV}/libNxCooking.so
		dosym /usr/lib/PhysX/v${PV}/libPhysXCore.so.1 /usr/lib/PhysX/v${PV}/libPhysXCore.so
		insinto /usr/share/doc/libphysx-${PV}
		doins ${WORKDIR}/libphysx/usr/share/doc/libphysx-${PV}/copyright

		#libphysx-common
		dolib ${WORKDIR}/libphysx-common/usr/lib/libPhysXLoader.so.1
		dosym /usr/lib/libPhysXLoader.so.1 /usr/lib/libPhysXLoader.so
		insinto /usr/share/doc/libphysx-common/
		doins ${WORKDIR}/libphysx-common/usr/share/doc/libphysx-common/copyright
		insinto /etc
		doins ${WORKDIR}/libphysx-common/etc/PhysX.conf

		#libphysx-dev
		insinto /usr/share/doc/libphysx-dev-${PV}
		doins ${WORKDIR}/libphysx-dev/usr/share/doc/libphysx-dev-${PV}/copyright
		insinto /usr/include/PhysX/v${PV}/LowLevel/API/include
		doins ${WORKDIR}/libphysx-dev/usr/include/PhysX/v${PV}/LowLevel/API/include/*
		insinto /usr/include/PhysX/v${PV}/LowLevel/hlcommon/include
		doins ${WORKDIR}/libphysx-dev/usr/include/PhysX/v${PV}/LowLevel/hlcommon/include/*
		insinto /usr/include/PhysX/v${PV}/SDKs/Cooking/include
		doins ${WORKDIR}/libphysx-dev/usr/include/PhysX/v${PV}/SDKs/Cooking/include/*
		insinto /usr/include/PhysX/v${PV}/SDKs/Foundation/include
		doins ${WORKDIR}/libphysx-dev/usr/include/PhysX/v${PV}/SDKs/Foundation/include/*
		insinto /usr/include/PhysX/v${PV}/SDKs/NxCharacter/include
		doins ${WORKDIR}/libphysx-dev/usr/include/PhysX/v${PV}/SDKs/NxCharacter/include/*
		insinto /usr/include/PhysX/v${PV}/SDKs/Physics/include
		doins ${WORKDIR}/libphysx-dev/usr/include/PhysX/v${PV}/SDKs/Physics/include/*
		insinto /usr/include/PhysX/v${PV}/SDKs/Physics/include/cloth
		doins ${WORKDIR}/libphysx-dev/usr/include/PhysX/v${PV}/SDKs/Physics/include/cloth/*
		insinto /usr/include/PhysX/v${PV}/SDKs/Physics/include/fluids
		doins ${WORKDIR}/libphysx-dev/usr/include/PhysX/v${PV}/SDKs/Physics/include/fluids/*
		insinto /usr/include/PhysX/v${PV}/SDKs/Physics/include/softbody
		doins ${WORKDIR}/libphysx-dev/usr/include/PhysX/v${PV}/SDKs/Physics/include/softbody/*
		insinto /usr/include/PhysX/v${PV}/SDKs/PhysXLoader/include
		doins ${WORKDIR}/libphysx-dev/usr/include/PhysX/v${PV}/SDKs/PhysXLoader/include/*
		insinto /usr/include/PhysX/v${PV}/Tools/NxuStream2
		doins ${WORKDIR}/libphysx-dev/usr/include/PhysX/v${PV}/Tools/NxuStream2/*

		# libphysx-doc
		insinto /usr/share/doc/libphysx-${PV}
		doins ${WORKDIR}/libphysx-doc/usr/share/doc/libphysx-${PV}/*
		insinto usr/share/doc/libphysx-doc-${PV}
		doins ${WORKDIR}/libphysx-doc/usr/share/doc/libphysx-doc-${PV}/copyright

		# libphysx-extras
		insinto /usr/lib/PhysX/v${PV}
		doins ${WORKDIR}/libphysx-extras/usr/lib/PhysX/v${PV}/*
		dosym /usr/lib/PhysX/v${PV}/libNxCharacter.so.1 /usr/lib/PhysX/v${PV}/libNxCharacter.so
		insinto /usr/share/doc/libphysx-extras-${PV}
		doins ${WORKDIR}/libphysx-extras/usr/share/doc/libphysx-extras-${PV}/copyright

		# libphysx-samples
		insinto /usr/sbin/PhysX_Samples_${PV}_FC4/Bin/linux
		insopts -m755
		doins ${WORKDIR}/libphysx-samples/usr/sbin/PhysX_Samples_${PV}_FC4/Bin/linux/*
		insinto /usr/sbin/PhysX_Samples_${PV}_FC4/Samples/Media
		insopts -m644
		doins ${WORKDIR}/libphysx-samples/usr/sbin/PhysX_Samples_${PV}_FC4/Samples/Media/*
		insinto /usr/share/doc/libphysx-samples-${PV}
		doins ${WORKDIR}/libphysx-samples/usr/share/doc/libphysx-samples-${PV}/copyright
}


