# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Next Generation Service Description Language"
HOMEPAGE="https://github.com/TU-Berlin-SNET/sdl-ng"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-4.0"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.6"
ruby_add_rdepend ">=dev-ruby/verbs-2.1"
ruby_add_rdepend ">=dev-ruby/rdf-1.1"
ruby_add_rdepend ">=dev-ruby/rdf-rdfxml-1.1"
ruby_add_rdepend ">=dev-ruby/multi_json-1.8"
ruby_add_rdepend ">=dev-ruby/money-6.1"
ruby_add_rdepend ">=dev-ruby/monetize-0.3"
ruby_add_rdepend ">=dev-ruby/yard-0.8.7.3"
ruby_add_rdepend ">=dev-ruby/yard-redcarpet-ext-0.0.3"
ruby_add_rdepend ">=dev-ruby/redcarpet-3.0"
ruby_add_rdepend ">=dev-ruby/rspec-2.14"
ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/fuubar-1.3"
ruby_add_rdepend ">=dev-ruby/simplecov-0.8.2"

