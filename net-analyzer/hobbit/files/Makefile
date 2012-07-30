# Toplevel Makefile for Hobbit
BUILDTOPDIR=`pwd`

# configure settings for Hobbit
#
# Toplevel dir
BBTOPDIR = /usr/lib/hobbit
# Server home dir for etc/, bin/
BBHOME = /usr/lib/hobbit/server
# Server data dir for hist/ etc.
BBVAR = /usr/lib/hobbit/data
# CGI scripts go in CGIDIR
CGIDIR = /usr/lib/hobbit/cgi-bin
# Admin CGI scripts go in SECURECGIDIR
SECURECGIDIR = /usr/lib/hobbit/cgi-secure
# Where to put logfiles
BBLOGDIR = /var/log/hobbit
# Where to install manpages
MANROOT = /usr/share/man
# How to run fping or hobbitping
#FPING = hobbitping

# Username running hobbit
BBUSER = hobbit
# Hobbit server hostname
#BBHOSTNAME = localhost
# Hobbit server IP-address
#BBHOSTIP = 127.0.0.1
# Hobbit server OS
BBHOSTOS = linux

# URL for Hobbit webpages
BBHOSTURL = /hobbit
# URL for Hobbit CGIs
BBCGIURL = /hobbit-cgi
# URL for Hobbit Admin CGIs
SECUREBBCGIURL = /hobbit-seccgi
# Webserver group-ID
HTTPDGID = apache

# RRDtool settings
RRDDEF = -DRRDTOOL12
RRDINCDIR = -I/usr/include
RRDLIBS = -L/usr/lib -lrrd -L/usr/lib -lpng
RPATHVAL += /usr/lib

# PCRE settings
PCREINCDIR = -I/usr/include
PCRELIBS = -L/usr/lib -lpcre
RPATHVAL += /usr/lib
#
# OpenSSL settings
#SSLFLAGS = -DBBGEN_SSL
#SSLINCDIR = -I/usr/include 
#SSLLIBS = -L/usr/lib -lssl -lcrypto
#RPATHVAL += /usr/lib
#
# OpenLDAP settings
#LDAPFLAGS = -DBBGEN_LDAP -DBBGEN_LDAP_USESTARTTLS
#LDAPINCDIR = -I/usr/include
#LDAPLIBS = -L/usr/lib -lldap -llber
#RPATHVAL += /usr/lib
# Large File Support settings
LFSDEF = -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64

include build/Makefile.Linux


# Add local CFLAGS etc. settings here

include build/Makefile.rules

