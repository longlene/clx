# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=""
HOMEPAGE="http://github.com/opennorth/pupa-ruby"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-4.0.0"
ruby_add_rdepend ">=dev-ruby/colored-1.2"
ruby_add_rdepend ">=dev-ruby/faraday_middleware-0.9.0"
ruby_add_rdepend ">=dev-ruby/json-schema-2.1.3"
ruby_add_rdepend ">=dev-ruby/mail-0"
ruby_add_rdepend ">=dev-ruby/moped-2.0.0"
ruby_add_rdepend ">=dev-ruby/oj-2.1"
ruby_add_rdepend ">=dev-ruby/sequel-4.10.0"
ruby_add_rdepend ">=dev-ruby/pg-0.17.0"
ruby_add_rdepend ">=dev-ruby/coveralls-0"
ruby_add_rdepend ">=dev-ruby/dalli-0"
ruby_add_rdepend ">=dev-ruby/json-1.7.7"
ruby_add_rdepend ">=dev-ruby/multi_xml-0"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.6.0"
ruby_add_rdepend ">=dev-ruby/octokit-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/redis-store-0"
ruby_add_rdepend ">=dev-ruby/rspec-2.10"
ruby_add_rdepend ">=dev-ruby/typhoeus-0"

