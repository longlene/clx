# Copyright 1999-2013 Gentoo Foundation

EAPI=4
USE_RUBY="ruby25 ruby26 jruby"

RUBY_FAKEGEM_TASK_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC=""
RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="A library that can manipulate with stardict dictionaries"
HOMEPAGE="http://rubyforge.org/projects/rbstardict"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~ppc ~x86 ~arm"
IUSE=""
SLOT="0"

RDEPEND="${RDEPEND}"

