# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Provides a better error page for Rails and other Rack apps"
HOMEPAGE="https://github.com/charliesome/better_errors"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/erubis-2.6.6"
ruby_add_rdepend ">=dev-ruby/coderay-1.0.0"
ruby_add_rdepend ">=dev-ruby/rack-0.9.0"

