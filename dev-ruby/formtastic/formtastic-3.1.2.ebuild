# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Rails form builder plugin/gem with semantically rich and accessible markup"
HOMEPAGE="http://github.com/justinfrench/formtastic"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/actionpack-3.2.13"
ruby_add_rdepend ">=dev-ruby/nokogiri-0"
ruby_add_rdepend ">=dev-ruby/rspec-rails-2.14"
ruby_add_rdepend ">=dev-ruby/rspec_tag_matchers-1.0"
ruby_add_rdepend ">=dev-ruby/hpricot-0.8.3"
ruby_add_rdepend ">=dev-ruby/RedCloth-4.2"
ruby_add_rdepend ">=dev-ruby/yard-0.8"
ruby_add_rdepend ">=dev-ruby/colored-1.2"
ruby_add_rdepend ">=dev-ruby/tzinfo-0"
ruby_add_rdepend "=dev-ruby/ammeter-1.1.1"
ruby_add_rdepend ">=dev-ruby/appraisal-1.0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/activemodel-3.2.13"

