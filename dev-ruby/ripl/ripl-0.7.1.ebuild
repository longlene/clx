# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="ripl is a light shell that encourages common middleware for shells i"
HOMEPAGE="http://github.com/cldwalker/ripl"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bond-0.5.1"
ruby_add_rdepend ">=dev-ruby/bacon-1.1.0"
ruby_add_rdepend ">=dev-ruby/rr-1.0.4"
ruby_add_rdepend ">=dev-ruby/bacon-bits-0"
ruby_add_rdepend ">=dev-ruby/bacon-rr-0"

