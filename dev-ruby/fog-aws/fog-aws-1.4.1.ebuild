# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="This library can be used as a module for fog or as standalone provider to use the Amazon Web Services in applications"
HOMEPAGE="https://github.com/fog/fog-aws"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.6"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/shindo-0.3"
ruby_add_rdepend ">=dev-ruby/rubyzip-0.9.9"
ruby_add_rdepend ">=dev-ruby/fog-core-1.38"
ruby_add_rdepend ">=dev-ruby/fog-json-1.0"
ruby_add_rdepend ">=dev-ruby/fog-xml-0.1"
ruby_add_rdepend ">=dev-ruby/ipaddress-0.8"

