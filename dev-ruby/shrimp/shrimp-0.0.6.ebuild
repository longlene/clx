# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="html to pdf with phantomjs"
HOMEPAGE="http://github.com/adeven/shrimp"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/json-0"
ruby_add_rdepend ">=dev-ruby/rake-0.9.2"
ruby_add_rdepend ">=dev-ruby/rspec-2.2.0"
ruby_add_rdepend ">=dev-ruby/rack-test-0.5.6"
ruby_add_rdepend "=dev-ruby/rack-1.4.1"

