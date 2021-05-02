# Copyright 1999-2013 Gentoo Foundation

EAPI=7
USE_RUBY="ruby20 ruby21 ree18 jruby ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="Dig need stractual infomation from web page"
HOMEPAGE="https://rubygems.org/gems/digger/"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"
SLOT="0"

RDEPEND="${RDEPEND}
	dev-ruby/http-cookie
	dev-ruby/nokogiri
"

