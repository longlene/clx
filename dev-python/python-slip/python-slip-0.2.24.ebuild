# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# pygtk, pygobject:2 etc. don't support multiple python2 slots
PYTHON_COMPAT="python2_7"

inherit distutils-r1

DESCRIPTION="Miscellaneous convenience, extension and workaround code for Python"
HOMEPAGE="https://fedorahosted.org/python-slip/"
SRC_URI="https://fedorahosted.org/released/${PN}/${P}.tar.bz2"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="dbus examples gtk selinux"

RDEPEND="dbus? (
		dev-python/dbus-python
		dev-python/pygobject:2
		sys-auth/polkit )
	gtk? ( dev-python/pygtk:2 )
	selinux? ( dev-python/python-selinux )"
DEPEND=""

python_prepare_all() {
	use selinux || epatch "${FILESDIR}/${PN}-${PV}-no-selinux.patch"
	sed -e "s:@VERSION@:${PV}:" setup.py.in > setup.py || die "sed failed"

	if ! use dbus; then
		sed -e '/name="slip.dbus"/ s/\(.*\)/if 0:\n    \1/' \
			-i setup.py || die "sed 2 failed"
	fi

	if ! use gtk; then
		sed -e '/name="slip.gtk"/ s/\(.*\)/if 0:\n    \1/' \
			-i setup.py || die "sed 3 failed"
	fi
}

python_install_all() {
	dodoc doc/dbus/README

	if use examples; then
		docompress -x usr/share/doc/${P}/example/
		insinto usr/share/doc/${P}/
		doins -r doc/dbus/example/
	fi
}
# adapted patch python-slip-0.2.24-no-selinux.patch matching python-slip-0.2.24 files
diff -ur python-slip-0.2.24.orig/setup.py.in python-slip-0.2.24/setup.py.in
--- setup.py.in	2012-11-12 23:13:22.000000000 +0800
+++ setup.py.in	2013-03-12 15:15:38.190459982 +0800
@@ -7,7 +7,7 @@
         py_modules=["slip.__init__", "slip.util.__init__",
             "slip.util.hookable", "slip.util.files",
             "slip._wrappers.__init__", "slip._wrappers._gobject"],
-        requires=["selinux"])
+	requires=[ ])
 
 setup(name="slip.dbus", version="@VERSION@",
         py_modules=["slip.dbus.__init__", "slip.dbus.bus",
diff -ur python-slip-0.2.24.orig/slip/util/files.py python-slip-0.2.24/slip/util/files.py
--- slip/util/files.py	2012-11-12 23:13:22.000000000 +0800
+++ slip/util/files.py	2013-03-12 15:23:55.326435244 +0800
@@ -24,7 +24,6 @@
            "overwrite_safely"]
 
 import os
-import selinux
 import shutil
 import tempfile
 import errno
@@ -134,9 +133,6 @@
 
     os.rename(dsttmpfile.name, dstpath)
 
-    if run_restorecon and selinux.is_selinux_enabled() > 0:
-        selinux.restorecon(dstpath)
-
 
 def linkorcopyfile(srcpath, dstpath, copy_mode_from_dst=True,
     run_restorecon=True):
@@ -244,11 +240,6 @@
         if exists and preserve_mode:
             shutil.copymode(path, tmpname)
 
-        if exists and preserve_context:
-            ret, ctx = selinux.getfilecon(path)
-            if ret < 0:
-                raise RuntimeError("getfilecon(%r) failed" % path)
-
         f = os.fdopen(fd, "w")
         fd = None
 
@@ -259,12 +250,6 @@
 
         os.rename(tmpname, path)
 
-        if preserve_context:
-            if exists:
-                selinux.setfilecon(path, ctx)
-            else:
-                selinux.restorecon(path)
-
     finally:
         if f:
             f.close()
