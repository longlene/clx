# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Cross application color theme generator inspired by Solarized"
HOMEPAGE="http://github.com/ninjudd/colorized"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/shoulda-0"
ruby_add_rdepend ">=dev-ruby/bundler-1.0.0"
ruby_add_rdepend ">=dev-ruby/jeweler-1.6.2"
ruby_add_rdepend ">=dev-ruby/rcov-0"

