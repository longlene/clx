# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="RSolr aims to provide a simple and extensible library for working with Solr"
HOMEPAGE="https://github.com/mwmitchell/rsolr"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/builder-2.1.2"
ruby_add_rdepend ">=dev-ruby/activesupport-0"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.4.0"
ruby_add_rdepend ">=dev-ruby/rake-0.9.2"
ruby_add_rdepend ">=dev-ruby/rdoc-3.9.4"
ruby_add_rdepend ">=dev-ruby/rspec-2.6.0"

