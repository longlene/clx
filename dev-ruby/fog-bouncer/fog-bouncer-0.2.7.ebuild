# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A simple way to define and manage security groups for AWS with the backing support of fog"
HOMEPAGE="https://github.com/dylanegan/fog-bouncer"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/clamp-0.5.0"
ruby_add_rdepend "=dev-ruby/clarence-1987.0.0"
ruby_add_rdepend ">=dev-ruby/fog-1.2"
ruby_add_rdepend ">=dev-ruby/ipaddress-0.8.0"
ruby_add_rdepend ">=dev-ruby/rake-0.9.0"
ruby_add_rdepend ">=dev-ruby/scrolls-0.2.1"
ruby_add_rdepend ">=dev-ruby/minitest-0"

