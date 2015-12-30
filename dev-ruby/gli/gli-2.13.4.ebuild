# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Build command-suite CLI apps that are awesome"
HOMEPAGE="http://davetron5000.github.com/gli"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-0.9.2.2"
ruby_add_rdepend ">=dev-ruby/rdoc-3.11"
ruby_add_rdepend ">=dev-ruby/rainbow-1.1.1"
ruby_add_rdepend ">=dev-ruby/clean_test-0"
ruby_add_rdepend ">=dev-ruby/cucumber-0"
ruby_add_rdepend ">=dev-ruby/gherkin-0"
ruby_add_rdepend "=dev-ruby/aruba-0.5.1"
ruby_add_rdepend ">=dev-ruby/sdoc-0"
ruby_add_rdepend "=dev-ruby/faker-1.0.0"

