# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="This gem is a Ruby wrapper for the Honeywell Total Connect Comfort SOAP API, built on Savon"
HOMEPAGE="http://github.com/auzroz/rubytcc"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/savon-2.5.1"
ruby_add_rdepend ">=dev-ruby/faraday-0.9.0"
ruby_add_rdepend ">=dev-ruby/nori-2.4.0"
ruby_add_rdepend ">=dev-ruby/xml-mapping-0.10.0"
ruby_add_rdepend ">=dev-ruby/rake-10.3.2"
ruby_add_rdepend ">=dev-ruby/rspec-3.1.0"
ruby_add_rdepend ">=dev-ruby/guard-2.6.0"
ruby_add_rdepend ">=dev-ruby/guard-rspec-4.3.0"
ruby_add_rdepend ">=dev-ruby/ruby_gntp-0.3.4"
ruby_add_rdepend ">=dev-ruby/growl-1.0.0"
ruby_add_rdepend ">=dev-ruby/vcr-2.9.3"
ruby_add_rdepend ">=dev-ruby/webmock-1.19.0"

