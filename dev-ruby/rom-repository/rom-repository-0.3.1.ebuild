# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="rom-repository adds support for auto-mapping and commands on top of rom-rb relations"
HOMEPAGE="http://rom-rb.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rom-2.0"
ruby_add_rdepend ">=dev-ruby/rom-support-2.0"
ruby_add_rdepend ">=dev-ruby/rom-mapper-0.4"
ruby_add_rdepend ">=dev-ruby/rake-11.2"
ruby_add_rdepend ">=dev-ruby/rspec-3.5"

