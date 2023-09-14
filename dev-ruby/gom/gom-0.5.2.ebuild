# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Core package of the General Object Mapper"
HOMEPAGE="http://github.com/phifty/gom"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/configure-0.3.0"
ruby_add_rdepend ">=dev-ruby/rspec-2"
ruby_add_rdepend ">=dev-ruby/reek-1.2"

