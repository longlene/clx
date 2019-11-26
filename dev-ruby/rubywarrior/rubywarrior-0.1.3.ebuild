# Copyright 1999-2013 Gentoo Foundation

EAPI=4
USE_RUBY="ruby25 ruby26 ree18 jruby"

RUBY_FAKEGEM_TASK_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.rdoc README.rdoc"

RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="A ruby warrior game"
HOMEPAGE="https://github.com/ryanb/ruby-warrior"

LICENSE="as-is"
KEYWORDS="amd64 ppc x86 ~arm"
IUSE="test"
SLOT="0"

RDEPEND="${RDEPEND}"

RUBY_FAKEGEM_EXTRAINSTALL="templates towers"
