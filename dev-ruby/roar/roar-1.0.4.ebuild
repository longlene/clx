# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Object-oriented representers help you defining nested REST API documents which can then be rendered and parsed using one and the same concept"
HOMEPAGE="http://rubygems.org/gems/roar"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/representable-2.0.1"
ruby_add_rdepend ">=dev-ruby/rake-0.10.1"
ruby_add_rdepend "=dev-ruby/test_xml-0.1.6"
ruby_add_rdepend ">=dev-ruby/minitest-5.4.2"
ruby_add_rdepend ">=dev-ruby/sinatra-0"
ruby_add_rdepend ">=dev-ruby/sinatra-contrib-0"
ruby_add_rdepend ">=dev-ruby/virtus-1.0.0"
ruby_add_rdepend ">=dev-ruby/faraday-0"
ruby_add_rdepend ">=dev-ruby/json-0"

