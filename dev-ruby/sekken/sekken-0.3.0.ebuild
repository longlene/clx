# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Sekken is an experimental SOAP client for the Ruby community"
HOMEPAGE="http://savonrb.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/nori-2.2.0"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.4.0"
ruby_add_rdepend ">=dev-ruby/builder-3.0.0"
ruby_add_rdepend ">=dev-ruby/httpclient-2.3"
ruby_add_rdepend ">=dev-ruby/logging-1.8"
ruby_add_rdepend ">=dev-ruby/rake-10.1"
ruby_add_rdepend ">=dev-ruby/rspec-2.14"
ruby_add_rdepend ">=dev-ruby/mocha-0.14"
ruby_add_rdepend ">=dev-ruby/equivalent-xml-0.3"
ruby_add_rdepend ">=dev-ruby/transpec-0"

